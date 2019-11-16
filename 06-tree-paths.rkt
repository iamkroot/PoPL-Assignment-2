#lang racket
(require "05-n-ary-tree.rkt")
(define (display-path path) (displayln (string-join (map number->string path) "->")))
(define (add-to-path node path) `(,@path ,(val node)))

(define (traverse-recursive root)
  (cond 
    [(empty? root) '()]
  	[(leaf? root) `(,(val root))]
  	[else (for/fold
           ([paths '()]
            #:result (map (lambda (path) (flatten `(,(val root) ,@path))) paths))
           ([child (children root)])
           (append paths (traverse-recursive child)))]))

(for ([path (traverse-recursive my-tree)])
  (display-path path))

(define (traverse-tail-recursive root [path '()])
  (cond 
    [(empty? root) (display-path path)]
    [(leaf? root) (display-path (add-to-path root path))]
    [else (for 
            ([child (children root)]) 
            (traverse-tail-recursive child (add-to-path root path)))]))

(traverse-tail-recursive my-tree)
