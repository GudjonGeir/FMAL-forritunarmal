(define (elementAtIndex lis n)
	(if (eq? n 1)
		(car lis)
		(nth (- n 1) (cdr lis))))