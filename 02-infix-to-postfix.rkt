#lang racket
(define exp '(1 #\* #\( 2 #\+ 3 #\) ))
(define (to-string exp) (list->string (map (lambda (c) (if (number? c) (integer->char (+ c 48)) c)) exp)))
(define-values (open-paren close-paren) (values #\( #\)))
(define (open-paren? s) (char=? s open-paren))
(define (close-paren? s) (char=? s close-paren))
(define (paren? s) (or (open-paren? s) (close-paren? s)))

(define-values (op? prec)
  (let ([table '([#\* 3]
                 [#\+ 2]
                 [#\- 2])])
    (values (lambda (x) (member x (map car table)))
            (lambda (x) (cadr (assoc x table))))))

(define (infix->postfix infix [output empty] [stack empty])
  (match infix
    ['() (if (findf paren? stack)
             (error "Unmatched parentheses")
             (reverse (append (reverse stack) output)))]
    [(cons token infix)
     (match token
       [(? number? n) (infix->postfix infix (cons n output) stack)]
       [#\( (infix->postfix infix output (cons open-paren stack))]
       [#\) (let-values ([(l r) (splitf-at stack (lambda (s) (not (open-paren? s))))])
                      (match r
                        ['() (error "Unmatched parentheses")]
                        [(cons _ r) (infix->postfix infix (append (reverse l) output) r)]))]
       [else (let-values ([(l r) (splitf-at stack (lambda (s) (and (op? s) (<= (prec token) (prec s)))))])
               (infix->postfix infix (append (reverse l) output) (cons token r)))])]))

(displayln (to-string (infix->postfix exp)))
