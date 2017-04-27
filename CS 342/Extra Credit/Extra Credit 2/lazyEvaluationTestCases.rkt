#lang racket
(provide (all-defined-out))
;; (eval prog1 '() '()) -> (31 '())
;; Testing Basic variable lazy eval
(define prog1
  '(var ((x (ref 10)))
        (var ((x 10) (y 21))
             (+ x y))))

;; (eval prog2 '() '((1 free))) -> (20 '(1 free))
;;Testing basic ccond eval. 
(define prog2
  '(var ((x (ref 15)) ( y 10))
        ((or (gt y 5) (eq (deref x) 15))
         (var ((z 10)) (+ z 10))
         x)))

;; (eval prog3 '() '((1 free))) -> (20 '(1 15))
;; Testing basic ccond eval. 
(define prog3
  '(var ((x (ref 15)) ( y 10))
        ((and (gt y 5) (eq (deref x) 15))
         (var ((z 10)) (+ z 10))
         x)))


;; (eval prog4 '() '((1 free))) -> (exception ooma '((1 15)))
;;Testing Var assign and heap chaining. 
(define prog4
  '(var ((a 10)
         (x (ref 15))
         (y (deref x))
         (z (wref y a)))
         (+ z 10)))

;; (eval prog5 '() '((1 free) (15 1))) -> (20  '((1 15) (15 10)))
;;Testing Var assign and heap chaining. 
(define prog5
  '(var ((a 10)
         (x (ref 15))
         (y (deref x))
         (z (wref y a)))
         (+ z 10)))

;; (eval prog6 '() '((1 free) (2 free) (3 free))) -> (2 '((1 2) (2 15) (3 2)))
;; Testing heap chaining in deref/ref/wref
(define prog6
  '(var ((x (deref
            (ref
            (wref
            (ref 10) (ref 15))))))
         
        x))

;; (eval prog7 '() '((1 free) (2 free) (3 free))) -> (3 '((1 10) (2 free) (3 free)))
;; Testing to make sure variables are only evaluated once.
;; Wait, Now we evaluate variables multiple times so.
;; (eval prog7 '() '((1 free) (2 free) (3 free))) -> (3 '((1 10) (2 free) (3 free)))
(define prog7
  '(fun (( f (n)) ((gt n 1)
                        ( +  x (apply (f ( (- n 1) ))))
                        x))
        (var ((x (ref 10)))
             (apply (f (3))))))


;;(eval prog8 '() '((1 free) (2 free) (3 free))) -> (3 ((1 10) (2 1) (3 2)))
;; Testing to make sure enviroment isn't deleted in findValue func. 
(define prog8
  '(var ((x (ref y))
         (y (ref z))
         (z (ref 10))) x))


;;(eval prog9 '() '((1 free) (2 free) (3 free))) -> (9 '((1 20) (2 20) (3 10)))
;; Testing recursion with conditionals. 
(define prog9
  '(fun (( f (n x)) (var ((y (ref 10))) ((or (gt n 1) (eq x 1))
                     (+ n (apply (f ((- n 1) x))))
                     y)))
        (var ((x (ref 20))) (apply (f (3 x))))))
              


