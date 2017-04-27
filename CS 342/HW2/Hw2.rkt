#lang racket
(provide (all-defined-out)) ;; for us to test
(require racket/trace) ;;in case you want to use tracing
(require "DB.rkt") ;;to access the database definations in DB.txt

; Question 3a

(define applyonstds
  (lambda (student-table)
  (lambda (q1)
    (if (null? student-table)
       student-table
       (cons (q1 (car student-table)) ((applyonstds (cdr student-table)) q1))))))


;; Question 3b

(define numberofcourses
  (lambda (lst)
    (if(null? lst)
       lst
       (list (car lst) (cadr lst) (length(cadr(cdr lst)))))))


;; Question 3c
;; please note that my Question 3c is incomplete but my  Question 3a and 3b are working fine!

(define gp
  (lambda (grade)
  (cond
    [(equal? grade 'A) 4.0]
    [(equal? grade 'B) 3.0]
    [(equal? grade 'C) 2.0]
    [(equal? grade 'A) 1.0]
    [(equal? grade 'F) 0.0])))


(define tnc
  (lambda (lst)
    (lambda (no)
    (if (null? lst)
        0
        (if(equal? (cadr (car lst)) no)
                   (+ 1 ((tnc (cdr lst)) no))
                   (+ 0 ((tnc (cdr lst)) no)))))))

(define tgp
  (lambda (lst)
    (lambda (no)
    (if (null? lst)
        0
        (if(equal? (cadr (car lst)) no)
                   (+ 0 ((tgp (cdr lst)) no))
                   (+ 1 ((tgp )cdr lst)) no)))))

;; I would like to aplogoize for not completing Question 3d due to lack of time I was
;; not able to get to this part!
           

