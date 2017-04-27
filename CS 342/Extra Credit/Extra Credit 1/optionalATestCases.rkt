#lang racket
(require racket/trace)
(provide (all-defined-out))

;; Simple number test
;; (reftype prog0) -> #f/False
(define prog0
   '5)

;; Simple Ref test
;; (reftype prog1) -> #t/True
(define prog1
  '(ref 10))

;; Simple Free test
;; (reftype prog2) -> #t/True
(define prog2
  '(free (+ 6 2)))

;; Simple wref test
;; (reftype prog3) -> #f/False
(define prog3
   '(wref ( + (ref 10) 7)))

;;ArithExpr test
;;(reftype prog4) -> #t/True
(define prog4
  '(+ (ref 1) 6))

;;Var expr test #1
;;(reftype prog5) -> #t/True
(define prog5
  '(var ((x (free 10)) (y 10)) ( + x 10)))

;;Var expr test #2
;; (reftype prog6) -> #f/False
(define prog6
  '(var ((x (free 10)) (y 10)) ( + y 10)))

;; Conditional Test #1
;; (reftype prog7) -> #t/True
(define prog7
  '(var ((x (ref 10)) (y 10)) ((eq y 11) x 10)))

;; Conditional Test #2
;; (reftype prog8) -> #f/False
(define prog8
  '(var ((x (ref 10)) (y 10))
        ((eq y 11) ((eq x (ref 10)) (var ((x 10)) (+ y x)) y) 10)))

;; Conditional Test #3
;; (reftype prog9) -> #t/True
(define prog9
  '(var ((x (ref 10)) (y 10))
        ((eq y 11) ((eq x (ref 10)) (var ((x 10)) (+ y x)) y) x)))

;;Function test #1
;; (reftype prog10) -> #t/True
(define prog10
  '(fun ((f1 (x)) (+ x 10)) (apply (f1 ((ref 1)))))) 

;;Function test #2
;; (reftype prog11) -> #f/False
(define prog11
  '(fun ((f1 (x)) (+ x (ref 10)))
        ((gt (apply (f1 ((ref 1)))) 10) (+ 5 10) (- 1 2)))
  ) 

;;Function test #3
;; (reftype prog12) -> #t/True
(define prog12
    '(fun ((g1 (z)) (+ z 5))
        (var ((x (ref 1)) (y 10))
             (fun ((f1 (x y)) ((gt x y) (apply (g1 (x))) (apply (g1 (y)))))
                  (apply (f1 (x y))))))
  )

;;Function test #3
;; (reftype prog13) -> #f/False
(define prog13
    '(fun ((g1 (z)) ((gt z (ref 10)) (deref 10) (+ 10 (wref 10))))
        (var ((x (ref 1)) (y 10))
             (fun ((f1 (x y)) ((gt x y) (apply (g1 (x))) (apply (g1 (y)))))
                  (apply (f1 (x y))))))
  )
             