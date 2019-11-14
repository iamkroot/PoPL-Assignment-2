#lang racket
(provide (all-defined-out))

(require racket/trace)

(define (sumUpRecursive lst)
  (if (empty? lst)
      0
      (+ (first lst)
         (sumUpRecursive (rest lst)))))

(define (sumUpTailRecursion lst sumTillNow)
  (cond
    [(empty? lst) sumTillNow]
    [else (sumUpTailRecursion (rest lst) (+ sumTillNow (first lst)))]))

(trace sumUpRecursive)
(trace sumUpTailRecursion)