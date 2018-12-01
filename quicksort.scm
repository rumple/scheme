#! /usr/local/bin/csi -ss
; Quicksort in Chicken
(import srfi-1)

(define (quicksort numbers)
  (if (null? numbers)
    '()
    (let* ([pivot       (car numbers)]
           [new-numbers (cdr numbers)]
           [lessthann   (filter (lambda (x) (<= x pivot)) new-numbers)]
           [morethann   (filter (lambda (x) (> x pivot)) new-numbers)])
      (append (quicksort lessthann)
              (list pivot)
              (quicksort morethann)))))

(define (main args)
  (print (quicksort (map string->number args))))
