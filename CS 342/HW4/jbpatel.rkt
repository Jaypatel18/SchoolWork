#lang racket
(require racket/trace)
(require "program.rkt")
(provide (all-defined-out))

(define (synchk expr)
  (synchkF expr '()))

(define (synchkF expr env)
  (cond
    [ (number? expr) true ]  ;; number
    
    [ (symbol? expr) true ]  ;; variable

    ;;fun part
    [ (and (equal? (car expr) 'fun)   ;; first element is var
           (equal? 3 (length expr)))  ;; there are three elements

      ;; then
      (and 
           (synchkFAssign (cadr expr) (append (caadr expr) env)) ;; lets check the varassignseq
           (synchkF (cadr (cdr expr)) (append (caadr expr) env))) ]    ;; finally the expression at the end

    [ (and (equal? (car expr) 'apply)
           (equal? 2 (length expr)))
      ;; then
      (and (list? (cadr expr))
           (equal? 2 (length (cadr expr))))
      
      ;; then
      (and (synchkFExp (cadr expr) env)
           (synchkArgs (cadr (cadr expr)) env))]

    ;;var part
    [ (and (equal? (car expr) 'var)   ;; first element is var
           (equal? 3 (length expr)))  ;; there are three elements

      ;; then
      (and (> (length (cadr expr)) 0) ;; there must be at least one varassign
           (synchkvarassignseq (cadr expr) env) ;; lets check the varassignseq
           (synchk (cadr (cdr expr))env)) ]    ;; finally the expression at the end

    [ (and (arithop (car expr))        ;; first element is +, -, /, *
           (equal? 3 (length expr)))   ;; there are three elements
      ;; then
      (and (synchk (cadr expr)env)
           (synchk (cadr (cdr expr))env)) ]

    [ (and (list? (car expr))        ;; first element is a list
           (equal? 3 (length expr))) ;; there are three elements
      ;; then
      (and (synchkcond (car expr)env)   ;; it is a condition
           (synchk (cadr expr)env)      ;; validate the then expression
           (synchk (cadr (cdr expr))env)) ] ;; validate the else expression

    [ else false ]))

;;new function for FAssign
(define (synchkFAssign listofpairs env)
  (if (null? listofpairs)
     true
      (cond
        [ (and (list? listofpairs)
               (equal? 2 (length listofpairs))
               (equal? 2 (length (car listofpairs)))
               (symbol? (car (car listofpairs)))
               (synchkP (cadr (car listofpairs)))
               (synchkF (cadr listofpairs) env))])))

;;new function for FExpr
;;extra
(define (synchkFExpr listofpairs)
  (cond
    [ (and (equal? 'fun (car listofpairs))
           (equal? 3 (length listofpairs)))
      (and (synchk (cadr listofpairs))
           (synchk (cadr (cdr listofpairs)))) ]
      [else false] ))

;;new function for F
(define (synchkFExp listofpairs env)
  (if (null? env)
      false
      (if (equal? (car listofpairs) (car env))
          (if (equal? (length (cadr listofpairs)) (length (cadr env)))
              true
              (synchkFExp listofpairs(cdr (cdr env))))
          (synchkFExp listofpairs (cdr (cdr env))))))

;;new function for checking P
(define (synchkP listofpairs)
  (if (null? listofpairs)
      true
      (and (list? listofpairs)
           (symbol? (car listofpairs))
           (synchkP (cdr (listofpairs))))))

;;new function for Args
(define (synchkArgs listofpairs env)
  (if (empty? listofpairs)
      true
      (and (list? listofpairs)
           (synchkF (car listofpairs) env)
           (synchkArgs (cdr listofpairs) env))))


(define (synchkvarassignseq listofpairs env)
  (if (null? listofpairs)
      true
      ;; else
      (and (equal? (length (car listofpairs)) 2)  ;; must be a pair
           (symbol? (car (car listofpairs)))      ;; first element in pair is variable
           (synchk (cadr (car listofpairs)) env)      ;; second element is an expression
           (synchkvarassignseq (cdr listofpairs)env))))


(define (synchkcond condition env)
  (cond
    [ (and (or (equal? 'gt (car condition))
               (equal? 'lt (car condition))
               (equal? 'eq (car condition)))
           (equal? 3 (length condition)))
      (and (synchk (cadr condition))
           (synchk (cadr (cdr condition))env)) ]
    [ (and (or (equal? 'and (car condition))
               (equal? 'or (car condition)))
           (equal? 3 (length condition)))
      (and (synchkcond (cadr condition))
           (synchkcond (cadr (cdr condition))env)) ]
    [ (and (equal? 'not (car condition))
           (equal? 2 (length condition)))
      (synchkcond (cadr condition)env) ]

    [ else false] ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eval
;; input: program-expression, environment as list of pairs (variable value)
;; output: '(Cannot Evaluate) or a number

(define (eval expr env)
  (if (caneval env)      ;; the environment might end up with a pair (variable '(Cannot Evaluate))
      (cond
        [ (number? expr) expr ]  ;; number
        [ (symbol? expr) (findvalue expr env) ] ;; sigma(x)

        ;; implementation of the semantics of variable expression
        [ (equal? (car expr) 'var) (evalvarassign (cadr expr) (cadr (cdr expr)) env) ]

        ;;New
        [ (equal? (car expr) 'fun) (eval (cadr (cdr expr)) (cons (cadr expr) env))]

        ;;New
        [ (equal? (car expr) 'apply) (evalA (cadr expr) env)]
 
        ;; with AO: new env only
        [ (arithop (car expr)) (evalarith (car expr) (cadr expr) (cadr (cdr expr)) env) ]

        ;; ifthenelse function
        [ else  (ifthenelse (evalcond (car expr) env) 
                            (cadr expr)
                            (cadr (cdr expr)) env) ]
        )
      '(Cannot Evaluate)
      ))


;; input: variable, environment
;; output: value to which the variable is mapped to in the environment
;;         It can be '(Cannot Evaluate) 
(define (findvalue x env)
  (if (null? env)  
      '(Cannot Evaluate)
      (if (equal? (car (car env)) x)
          (cadr (car env))
          (findvalue x (cdr env)))))

;; input: environment
;; output: true, if no variable is mapped to '(Cannot Evaluate)
;;         false, otherwise
;; Exercise: implement in another way, where it does not depend on '(Cannot Evaluate)
(define (caneval env)
  (if (null? env)
      true
      (and (not (equal? (cadr (car env)) '(Cannot Evaluate)))
           (caneval (cdr env)))))

;; input: list of (variable expression), expr to evaluate, environment
;; output: evaluate expr in some environment

(define (evalvarassign varassigns expr env)
  (if (null? varassigns)  ;; no variable expression pair, 
      (eval expr env)     ;; then just evaluate the expression in the current environment
      ;; else
      ;; recursive call with the suffix of varassigns, with the same expr
      ;; in the environment constructed by cons-ing (variable evaluation of expression)
      ;; to the given environment env.
      (evalvarassign (cdr varassigns)
                     expr
                     (cons (list (car (car varassigns))
                                 (eval (cadr (car varassigns)) env))
                           env))))

;;helper method
(define (evalA assign env)
  (eval (cadr(car(Senvironment assign env))) (append (evaluation (cadr assign)
                                                                  (cadr (car (car (Senvironment assign env)))) env) 
                                                                                             (Senvironment assign env))))
                                                                                                                                                          
;;helper method
(define (evaluation argu assign2 env)
  (if(null? argu)
     argu
     (cons (list (car assign2) (eval (car argu) env)) (evaluation (cdr argu) (cdr assign2) env))))

;;helper method
(define (Senvironment assign3 env)
  (if (and (list? (car(car env))) (equal? (car assign3) (car (car (car env)))))
           env
           (Senvironment assign3 (cdr env))))

;; is op arithmatic operation
(define (arithop op)
  (or (equal? op '+)
      (equal? op '-)
      (equal? op '*)
      (equal? op '/))) ;;added a division

;; input: arithoperator, expr-operand1, expr-operand2, env
;; output: '(Cannot Evaluate) or some number
;; used: myapply 
(define (evalarith op expr1 expr2 env)
 (myapply op (eval expr1 env) (eval  expr2 env)))

;; input: true/false, '(Cannot Evaluate) expression values
;; output: '(Cannot Evaluate) or expression values
;;         expression values can be '(Cannot Evaluate)
(define (ifthenelse condition expr1 expr2 env)
  (if (equal? condition '(Cannot Evaluate))
      '(Cannot Evaluate)
      (if condition
         (eval expr1 env)
         (eval expr2 env))))

;; input: conditions of the form (gt/lt/eq expr1 expr2), (or/and cond1 cond2), (not cond)
;; output: true/false, '(Cannot Evaluate)
;; used: myapply
(define (evalcond condexpr env)
  (cond
    [ (equal? (car condexpr) 'gt)
      (myapply 'gt (eval (cadr condexpr) env) (eval (cadr (cdr condexpr)) env)) ]
    
    [ (equal? (car condexpr) 'lt)
      (myapply 'lt (eval (cadr condexpr) env) (eval (cadr (cdr condexpr)) env)) ]

    ;;adding equal
    
     [ (equal? (car condexpr) 'eq)
      (myapply 'eq (eval (cadr condexpr) env) (eval (cadr (cdr condexpr)) env)) ]
    
    [ (equal? (car condexpr) 'and)
      (myapply 'and (evalcond (cadr condexpr) env)
               (evalcond (cadr (cdr condexpr)) env)) ]

    [ (equal? (car condexpr) 'or)
      (myapply 'or (evalcond (cadr condexpr) env)
               (evalcond (cadr (cdr condexpr)) env)) ]

    [ (equal? (car condexpr) 'not)
      (myapply 'not (evalcond (cadr condexpr) env)
               false) ] ;; dummy
    ))


;; input: some operator, arithmatic or conditional
;;        operand-values for the operator
;; output: '(Cannot Evaluate) or number or boolean 
(define (myapply op val1 val2)
  (if (or (equal? val1 '(Cannot Evaluate))
          (equal? val2 '(Cannot Evaluate)))
      '(Cannot Evaluate)
      (cond
        [ (equal? op '+) (+ val1 val2) ]
        [ (equal? op '-) (- val1 val2) ]
        [ (equal? op '*) (* val1 val2) ]
        [ (equal? op '/) (/ val1 val2) ] ;;added a division 
        [ (equal? op 'gt) (> val1 val2) ]
        [ (equal? op 'lt) (< val1 val2) ]
        [ (equal? op 'eq) (equal? val1 val2) ]
        [ (equal? op 'and) (and val1 val2) ]
        [ (equal? op 'or) (or val1 val2) ]
        [ (equal? op 'not) (not val1) ])))


