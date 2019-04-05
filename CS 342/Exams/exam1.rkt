#lang racket
(define (minmax lst)
  (if (< (length lst) 2)
      lst
      (if (equal? (length lst) 2)
          (if (< (car lst) (cadr lst) )
              lst
              (list (cadr lst) (car lst)))
          (if (< (car lst) (car (minmax (cdr lst))))
              (append (list (car lst)) (cdr (minmax (cdr lst))))
              (if (> (car lst) (cadr (minmax (cdr lst))))
                  (list (car (minmax (cdr lst))) (car lst))
                  (minmax (cdr lst))
                  )))))




(define (myfunc f lst)
  (if (null? lst)
      lst
      (if (f (car lst))
      (cons (car lst) (myfunc f (cdr lst)))
      (myfunc f (cdr lst))
      )))