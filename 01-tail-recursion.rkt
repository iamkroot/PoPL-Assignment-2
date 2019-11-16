#lang racket
(define (sum lst)
  (if (empty? lst)
      0
      (+ (first lst) (sum (rest lst)))))
(define (sum-tail lst [acc 0])
  (if (empty? lst)
      acc
      (+ (sum-tail (rest lst) (+ acc (first lst))))))
