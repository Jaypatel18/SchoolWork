#lang racket
(provide (all-defined-out)) ;; for us to test
(require racket/trace) ;; in case you want to use tracing


;; Student
(define student-table
  '( (0 Asterix (342 230 412 227))
     (1 Obelix  (342 228 227 230))))


;; Grades
(define grade-table
  '( (342 0 A)
     (227 0 B)
     (412 0 A)
     (227 1 C)
     (228 1 A)
     (342 1 B)
     ))