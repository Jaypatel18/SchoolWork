#lang racket
(provide (all-defined-out))
(require "program.rkt")
(require racket/trace)

;;from the lecture slides
(define (pref2inf expression2) 
  (cond
    [ (number? expression2) expression2 ]
    [ (and (list? expression2)
           (equal? (length expression2) 3)
           (arithop (car expression2)))
      (list (pref2inf (cadr expression2)) (car expression2) (pref2inf (cadr (cdr expression2))))]
    [ else false ]))

;;from the lecture slides 
(define (arithop x) 
  (or (equal? x '+)
      (equal? x '-)
      (equal? x '*)
      (equal? x '/)))

;;q1
(define(synchk expression)
          (cond
            [ (number? expression) true ]
            [ (symbol? expression) true ]

           
            [ (and (list? expression) (arithop (car expression)))   ;; if the expression is an arithexpression then synchk 2nd and 3rd element
      (and (synchk (cadr expression)) (synchk(cadr (cdr expression)))) ] 

            [ (and (list? expression)
                   (equal? (length expression)3)
                   (equal? (car expression) 'var))
              (and (synchk (cadr expression)) 
                   (synchk (cadr (cdr expression))))] 
            [ else false ]))


;;Checking the syntax of conditional statements

(define (conditionevaluation expression3)
  (cond
    [ (equal? (car expression3) 'gt)
      (> (eval (cadr expression3)) (eval (cadr (cdr expression3)))) ]
    
    [ (equal? (car expression3) 'lt)
      (< (eval (cadr expression3)) (eval (cadr (cdr expression3)))) ]
    
    [ (equal? (car expression3) 'and)
      (and (conditionevaluation (cadr expression3))
          (conditionevaluation (cadr (cdr expression3)))) ]))

;;(synchk prog2)

;;(car prog2)


;;q2

;;(define (eval program env)
  ;; if you cannot find the value of that variable in the environemnt
  ;; results of eval will be in that string

  ;; Ideas:
  ;; we can do that by building a new env based on the varible assignment
  ;; and check the value for the variable.
  ;; I have some ideas on how to solve it but due to lack of time I dont think
  ;; I will be able to finish it. So I can wrote down my ideas on how
  ;; I will solve this problem, I hope it helps.

  ;; solve been very busy this week with 4 assignments and 2 exams and
  ;; a presentation so didn't have enough time to work on it as I should
  ;; have!

  