#lang racket
(require racket/trace)
(require "program.rkt")
(provide (all-defined-out))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eval
;; input: program-expression, environment as list of pairs (variable value)
;; output: '(Cannot Evaluate) or a number

;;adding heap
(define (eval expr env heap)
  (if (caneval env)      ;; the environment might end up with a pair (variable '(Cannot Evaluate))
      (cond
        [ (number? expr) (list expr heap) ]  ;; number
        [ (symbol? expr) (list (findvalue expr env) heap) ] ;; sigma(x)

        ;; implementation of the semantics of variable expression
        [ (equal? (car expr) 'var) (evalvarassign (cadr expr) (cadr (cdr expr)) env heap) ]

        ;; implementation of the semantics of FExpr(eval prov2 '((x 3)))
        [ (equal? (car expr) 'fun) (eval (cadr (cdr expr)) (cons (cadr expr) env) heap) ]

        ;; implementation of the semantics of Apply
        ;; utter disregard for efficiency - searching the same environment three times using the same key
        ;; But this keeps it clean
        ;; We are going to translate the apply semantics to varexpression semantics
        ;; [[(apply (f (ArgList)))]]_env = [[(var Param-ArgValue list  FDef]]_staticenv
        [ (equal? (car expr) 'apply) (eval (list 'var
                                                     (paramargs (findfunparams (car (cadr expr))  ;; function name
                                                                               (length (cadr (cadr expr))) ;; number of params
                                                                               env)              ;; current environment
                                                            ;; findfunparams returns parameters of the function
                                                                (cadr (cadr expr)) ;; expressions representing arguments
                                                                env heap)
                                                 ;; paramargs returns the list of variable-value pairs
                                                 
                                                 (findfundef (car (cadr expr)) (length (cadr (cadr expr))) env)) ;; definition of the function
                                           
                                           (staticenv (car (cadr expr)) (length (cadr (cadr expr))) env) ;; static environment
                                           (pheap (findfunparams (car (cadr expr))(length (cadr (cadr expr))) env) (cadr (cadr expr)) env heap)) ]

        ;;new
        [(equal? (car expr) 'free)
         (if (list? (rlocation (car (eval (cadr expr) env heap)) heap))
             (list (rlocation (car (eval (cadr expr) env heap)) heap) heap)
             (list (car (eval (cadr expr) env heap)) (wlocation 'free (car (eval (cadr expr) env heap)) heap)))]

        ;;new
        [(equal? (car expr) 'ref)
         (if (equal? (fflocation heap) '(exception oom))
             (list (fflocation heap) heap)
             (list (fflocation heap) (wlocation (car (eval (cadr expr) env heap)) (fflocation heap) heap)))]
        
        ;; new
        [(equal? (car expr) 'deref)
             (list (rlocation (car (eval (cadr expr) env heap)) heap) heap)]
        
         ;;new
        [(equal? (car expr) 'wref)
         (if (list? (rlocation (car (eval (cadr expr) env heap)) heap))
             (list (rlocation (car (eval (cadr expr) env heap)) heap) heap)
             (list (car (eval (cadr (cdr expr)) env heap))
                   (wlocation (car (eval (cadr (cdr expr)) env heap))
                              (car (eval (cadr expr) env heap)) heap)))]
       
        ;; same as before with the arithmatic operations: environment is added
        [ (arithop (car expr)) (evalarith (car expr) (cadr expr) (cadr (cdr expr)) env heap) ]
        
        ;; ifthenelse function new
        [ else (if (list? (car (evalcond (car expr) env heap)))
                   (evalcond (car expr) env heap)
                   (ifthenelse (car (evalcond (car expr) env heap)) 
                               (cadr expr)
                               (cadr (cdr expr)) env (cadr (evalcond (car expr) env heap)) )) ]
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

(define (evalvarassign varassigns expr env heap)
  (if (null? varassigns)  ;; no variable expression pair, 
      (eval expr env heap)     ;; then just evaluate the expression in the current environment
      ;; else
      ;; recursive call with the suffix of varassigns, with the same expr
      ;; in the environment constructed by cons-ing (variable evaluation of expression)
      ;; to the given environment env.
      (if (list? (car (eval (cadr (car varassigns)) env heap)))
          (eval (cadr (car varassigns)) env heap)
          (evalvarassign (cdr varassigns)
                         expr
                         (cons (list (car (car varassigns))
                                     ;;new
                                     (car (eval (cadr (car varassigns)) env heap)))
                               env)
                         (cadr (eval (cadr (car varassigns)) env heap))))))

;; is op arithmatic operation
(define (arithop op)
  (or (equal? op '+)
      (equal? op '-)
      (equal? op '*)
      (equal? op '/)))

;; input: arithoperator, expr-operand1, expr-operand2, env
;; output: '(Cannot Evaluate) or some number
;; used: myapply
;;new heap
(define (evalarith op expr1 expr2 env heap)
  (if (list? (car (eval expr1 env heap)))
      (eval expr1 env heap)
      (if (list? (car (eval  expr2 env (cadr (eval expr1 env heap)))))
          (eval  expr2 env (cadr (eval expr1 env heap)))
          (list (myapply op (car (eval expr1 env heap))
                         (car (eval  expr2 env (cadr (eval expr1 env heap)))))
                (cadr (eval  expr2 env (cadr (eval expr1 env heap))))))))

;; input: true/false, '(Cannot Evaluate) expression values
;; output: '(Cannot Evaluate) or expression values
;;         expression values can be '(Cannot Evaluate)
;;added heap
(define (ifthenelse condition expr1 expr2 env heap)
  (if (equal? condition '(Cannot Evaluate))
      '(Cannot Evaluate)
      (if condition
         (eval expr1 env heap)
         (eval expr2 env heap))))

;; input: conditions of the form (gt/lt/eq expr1 expr2), (or/and cond1 cond2), (not cond)
;; output: true/false, '(Cannot Evaluate)
;; used: myapply
;;new for exceptions
(define (evalcond condexpr env heap)
  (cond
    [ (equal? (car condexpr) 'lt)
      (if (list? (car (eval (cadr condexpr) env heap)))
          (eval (cadr condexpr) env heap)
          (if (list? (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
              (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))
              (list (myapply 'lt (car (eval (cadr condexpr) env heap)) (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
                    (cadr (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap))))))) ]

     [ (equal? (car condexpr) 'or)
      (if (list? (car (evalcond (cadr condexpr) env heap)))
          (evalcond (cadr condexpr) env heap)
          (if (list? (car (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))))
              (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))
              (list (myapply 'or (car (evalcond (cadr condexpr) env heap))
                             (car (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))))
                    (cadr (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap))))))) ]

    [ (equal? (car condexpr) 'gt)
      (if (list? (car (eval (cadr condexpr) env heap)))
          (eval (cadr condexpr) env heap)
          (if (list? (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
              (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))
              (list (myapply 'gt (car (eval (cadr condexpr) env heap)) (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
                    (cadr (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))))]

    [ (equal? (car condexpr) 'not)
      (if (list? (car (evalcond (cadr condexpr) env heap)))
          (evalcond (cadr condexpr) env heap)
          (list (myapply 'not (car (evalcond (cadr condexpr) env heap))
                         false) (cadr (evalcond (cadr condexpr) env heap)))) ] ;; dummy
    
    [ (equal? (car condexpr) 'and)
      (if (list? (car (evalcond (cadr condexpr) env heap)))
          (evalcond (cadr condexpr) env heap)
          (if (list? (car (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))))
              (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))
              (list (myapply 'and (car (evalcond (cadr condexpr) env heap))
                             (car (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))))
                    (cadr (evalcond (cadr (cdr condexpr)) env (cadr (evalcond (cadr condexpr) env heap)))))))]

    [ (equal? (car condexpr) 'eq)
      (if (list? (car (eval (cadr condexpr) env heap)))
          (eval (cadr condexpr) env heap)
          (if (list? (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
              (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))
              (list (myapply 'eq (car (eval (cadr condexpr) env heap)) (car (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))
                    (cadr (eval (cadr (cdr condexpr)) env (cadr (eval (cadr condexpr) env heap)))))))]
  
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
        [ (equal? op '/) (/ val1 val2) ]
        [ (equal? op 'gt) (> val1 val2) ]
        [ (equal? op 'lt) (< val1 val2) ]
        [ (equal? op 'eq) (equal? val1 val2) ]
        [ (equal? op 'and) (and val1 val2) ]
        [ (equal? op 'or) (or val1 val2) ]
        [ (equal? op 'not) (not val1) ])))

;; Functions added for the assignment 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (paramargs (x1 x2 .... xn) (e1 e2 .... en) env) = ((x1 e1val) (x2 e2val) ... (xn enval))
;; input: list of variables
;;        list of expressions
;;        environment
;; output: list of pairs of variable-expressionvalue
;;new heap
(define (paramargs paramlist exprlist env heap)
  (if (null? paramlist)
      '()
      (if (list? (car (eval (car exprlist) env heap)))
          (eval (car exprlist) env heap)
          (cons (list (car paramlist) (car (eval (car exprlist) env heap)))
                (paramargs (cdr paramlist) (cdr exprlist) env (cadr (eval (car exprlist) env heap)))))))

;; find the function parameters
;; input: function name and arg-length
;;        env
;; output: list of function parameters
(define (findfunparams fname paramlength env)
  (if (and (list? (car (car env)))   ;; is a function definition
           (equal? (car (car (car env))) fname)  ;; name matches
           (equal? (length (cadr (car (car env)))) paramlength)) ;; paramlength matchs
      ;; 
      (cadr (car (car env)))   ;; return the list of parameters
      (findfunparams fname paramlength (cdr env)))) ;; else keep looking


;; Same as above: just return the definition of the function
(define (findfundef fname paramlength env)
  (if (and (list? (car (car env)))
           (equal? (car (car (car env))) fname)
           (equal? (length (cadr (car (car env)))) paramlength))
      ;; 
      (cadr (car env)) ;; return the definition of the function
      (findfundef fname paramlength (cdr env)))) ;; else keep looking

;;new function
(define (pheap plist elist env heap)
  (if (null? plist)
      heap
      (pheap (cdr plist) (cdr elist) env (cadr (eval (car elist) env heap)))))

;; Given an environment; generate the static environment corresponding
;; for a function
;; same as above again
(define (staticenv fname paramlength env)
  (if (and (list? (car (car env)))
           (equal? (car (car (car env))) fname)
           (equal? (length (cadr (car (car env)))) paramlength))
      env ;; return the environment at the time of definition
      (staticenv fname paramlength (cdr env)))) ;; else keep looking

;;new
(define (wlocation value position heap)
  (if (null? heap)
      '(exception ooma)
      (if (equal? (car (car heap)) position)
          (cons (list (car (car heap)) value) (cdr heap))
          (if (equal? (wlocation value position (cdr heap)) '(exception ooma))
              '(exception ooma)
              (cons (car heap) (wlocation value position (cdr heap)))))))

;;new
(define (rlocation position heap)
  (if (null? heap)
      '(exception ooma)
      (if (equal? (car (car heap)) position)
          (if (equal? (cadr (car heap)) 'free)
              '(exception fma)
              (cadr (car heap)))
          (rlocation position (cdr heap)))))

;;new
(define (fflocation heap)
  (if (null? heap)
      '(exception oom)
      (if (equal? (cadr (car heap)) 'free)
          (car (car heap))
          (fflocation (cdr heap)))))


           
     





