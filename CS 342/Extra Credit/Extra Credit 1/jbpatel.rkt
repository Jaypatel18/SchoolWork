#lang racket
(require "programoptA.rkt") ;;varies on the file name
(provide (all-defined-out))

(define (ref refexpr env)
  (cond
    [ (equal? refexpr true) true ]
    [ (equal? refexpr false) false ]
    [ (number? refexpr) false]
    [ (symbol? refexpr) (fval refexpr env)]
    [ (equal? (car refexpr) 'var) (cvar (cadr refexpr) (cadr (cdr refexpr)) env)]
    [ (equal? (car refexpr) 'fun) (ref (caddr refexpr) (cons (cadr refexpr) env))]
    [ (equal? (car refexpr) 'apply) (ref (list 'var
                                                (parm (param (car (cadr refexpr)) (length (cadr (cadr refexpr))) env) (cadr (cadr refexpr)) env)
                                                (ffdef (car (cadr refexpr)) (length (cadr (cadr refexpr))) env))
                                             (senv (car (cadr refexpr)) (length (cadr (cadr refexpr))) env)) ]
    [ (equal? (car refexpr) 'ref) true]
    [ (equal? (car refexpr) 'free) true]
    [ (equal? (car refexpr) 'wref) false]
    [ (equal? (car refexpr) 'deref)false]
    [ (arithop (car refexpr)) (or (ref (cadr refexpr) env) (ref (cadr (cdr refexpr)) env)) ]
    [ else (or (ref (cadr refexpr) env) (ref (cadr (cdr refexpr)) env))]
    ))

;;function for arithmatic operations
(define (arithop op)
  (or (equal? op '+)
      (equal? op '-)
      (equal? op '*)
      (equal? op '/)))

;;function that calls the function for recursion
(define (reftype expr)
  (ref expr '()))

;;function for checking the var
(define (cvar elemnt cphrase env) 
  (if (null? elemnt)
      (ref cphrase env)
      (cvar (cdr elemnt) cphrase (cons (list (car (car elemnt)) (ref (cadr (car elemnt)) env)) env))))

;;function for finding the value
(define (fval var env) 
  (if (null? env)
      false
      (if (equal? (car (car env)) var)
          (car (cdr (car env)))
          (fval var (cdr env)))))

;; helper Function for static env
(define (senv sname splength env) 
  (if (and (list? (car (car env)))
           (equal? (car (car (car env))) sname)
           (equal? (length (cadr (car (car env)))) splength))
      env
      (senv sname splength (cdr env)))) 

;;helper function for finding the function def
(define (ffdef name plen env) 
  (if (and (list? (car (car env)))
           (equal? (car (car (car env))) name)
           (equal? (length (cadr (car (car env)))) plen))
           (cadr (car env))
      (ffdef name plen (cdr env))))

;; helper function for param arguments
(define (parm plist elist env) 
  (if (null? plist)
      '()
      (cons (list (car plist) (ref (car elist) env))
            (parm (cdr plist) (cdr elist) env))))

;; helper function for function parameters
(define (param funName len env) 
  (if (and (list? (car (car env)))   
           (equal? (car (car (car env))) funName) 
           (equal? (length (cadr (car (car env)))) len)) 
      (cadr (car (car env))) 
      (param funName len (cdr env))))