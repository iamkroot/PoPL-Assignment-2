#lang racket
(require racket/include)
(include "q1.rkt")
(require racket/trace)
(trace sumUpRecursive)
(trace sumUpTailRecursion)

(sumUpRecursive '(1 2 3 4 5))
(sumUpTailRecursion '(1 2 3 4 5))