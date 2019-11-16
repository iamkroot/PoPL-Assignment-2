#lang racket
(define exp '(1 2 3 #\+ #\* 4 #\/))
(define (calc expr)
  (for/fold ([stack '()]) ([token expr])
    (match* (token stack)
      [((? number? n) s) (cons n s)]
      [(#\+ (list x y s ___)) (cons (+ y x) s)]
      [(#\- (list x y s ___)) (cons (- y x) s)]
      [(#\* (list x y s ___)) (cons (* y x) s)]
      [(#\/ (list x y s ___)) (cons (/ y x) s)]
      [(x s) (error "Invalid form:" (reverse (cons x s)))])))

(first (calc exp))
