#lang racket
(define (make-tree val . children)
  (cons val children))  ; first element is the node value, rest are children
(define (leaf? node) (empty? (cdr node)))
(define (val node) (car node))
(define (children node) (cdr node))

(define my-tree
  (make-tree 1
             (make-tree 2 
                        (make-tree 6) 
                        (make-tree 7 
                                   (make-tree 8))) 
             (make-tree 3
                        (make-tree 9
                                   (make-tree 10)
                                   (make-tree 11)))
             (make-tree 4)
             (make-tree 5)))

(provide (all-defined-out))
