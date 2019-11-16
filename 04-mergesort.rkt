; #lang racket
(define arr '(3 2 5 1 3 8 5 4 10 2))
(define (merge a b)  ; merge two sorted lists and return sorted list, runs in O(m + n)
  (cond
    [(empty? a) b]
    [(empty? b) a]
    [(< (first a) (first b)) (cons (first a) (merge (rest a) b))]  ; a[0] < b[0] => set a[0] to be first element, recur for others
    [else (cons (first b) (merge a (rest b)))]))  ; similar as above

(define (mergesort arr)  ; runs in O(n log(n))
  (if (or (empty? arr) (empty? (cdr arr)))  ; if arr has 0 or 1 elements
      arr  ; already sorted
      (let-values ([(a b) (split-at arr (quotient (length arr) 2))])  ; split arr into two halves, a and b
	      (merge (mergesort a) (mergesort b)))))  ; run mergesort on the two halves and then merge results

(mergesort arr)
