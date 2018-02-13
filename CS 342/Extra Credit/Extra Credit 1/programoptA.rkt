;; For homework assignment Opt-A: Spring'17

#lang racket
(provide (all-defined-out))

;; results
;; 1, 2, 3, 4, 9, 10, 12, 13: true.

;; point dist.
;; 1, 2, 3, 4, 5:  1pt each
;; 6, 7, 8, 9, 11, 12, 13: 2pts each
;; 10, 14: 3pts each
;; 15: 5pt  (No one has considered recursion in functions correctly)

;; 3 extra points given for correctly answering the question (b)
;; in the assignment. 

;; check the arithmatic expressions
(define prog1
  '(+ (+ (+ (ref 10) 1) 2) 3))

;; check the conditional expression
(define prog2
  '((or (gt 1 2) (gt 2 1)) (+ (+ (free 10) 1) 2)))

;; check the var expressions
(define prog3
  '(var ((x (ref 10)) (y x) (z y)) (var ((w z)) w)))

;; check the fun-apply combination
(define prog4
  '(fun ((f (x y)) (+ x y))
        (apply (f ((ref 10) 20)))))

;; combinations
(define prog5
  '(+ (var ((x (ref 10)) (y (deref x))) y) 20))

;; variable
(define prog6
  '(+ (var ((x (ref 10)) (y (deref x))) (+ y z)) 20))

;; variables in different scopes    
(define prog7
  '(var ((x (free 10))) ((gt x 20) (var ((x 10)) x) 200)))

;; functions in different scopes
(define prog8
  '(fun ((f (x)) (+ x (ref 10)))
        (fun ((f (y)) y)
             (apply (f (20))))))

;; functions in different scopes other way
(define prog9
  '(fun ((f (x)) x)
        (fun ((f (y)) (+ y (ref 10)))
             (apply (f (20))))))

;; higher-order functions
(define prog10
  '(fun ((f (x)) x)
        (fun ((g (y)) y)
             (apply (f ((apply (g ((apply (f ((ref 10)))))))))))))

;; functions with new variables
(define prog11
  '(fun ((f (x)) (var ((x 10)) x))
        (fun ((g (y)) y)
             (apply (f ((apply (g ((ref 10))))))))))

;; other way
(define prog12
  '(fun ((f (x)) (var ((x (free 10))) x))
        (fun ((g (y)) y)
             (apply (f ((apply (g (z)))))))))

;; higher order varexpressions
(define prog13
  '(var ((x (var ((y (ref 10))) (+ y 20))) (y x)) y))

;; higher order functions with varexpressions
(define prog14
  '(fun ((f (x y)) y)
        (fun ((g (y)) y)
             (apply (f ((var ((i 20)) (ref i)) (apply (g (i)))))))))

;; recursion
(define prog15
  '(fun ((f (x)) (+ 1 (apply (f ((- x 1))))))
        (apply (f (20)))))
         