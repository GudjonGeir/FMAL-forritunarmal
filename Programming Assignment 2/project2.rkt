;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname project2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))


;;;1A
(define (maxElement lis)
	(apply max lis)
)

;;;1B
(define (elementAtIndex lis n)
	(if (eq? n 1) 
			(car lis)
			(elementAtIndex (cdr lis) (- n 1))
		)
)

;;;1C
(define (compress lis)
	(cond
		((null? lis) '())
		((null? (cdr lis)) lis)
		((eq? (car lis) (car (cdr lis))) (compress (cdr lis)))
		(else (cons (car lis) (compress (cdr lis))))
	)
)


;;;1D
(define (maxofmax lis)
	(apply max (map maxElement lis))
)

;;;1E
(define (split lis n)
	(list (getFirstList lis n) (getSecondList lis n))
)

(define (getFirstList lis n)
	(cond
		((null? lis) '())
		((eq? 0 n) '())
		(else 
			(cons (car lis) 
			(getFirstList (cdr lis) (- n 1)))
		)
	)
)

(define (getSecondList lis n)
	(cond
		((null? lis) '())
		((eq? 1 n) (cdr lis))
		((eq? 0 n) lis)
		(else 
			(getSecondList (cdr lis) (- n 1))
		)
	)
)

;;;2A
(define (sumList lis) 
	(cond
		((null? lis) 0)
		((= 1 (length lis))
			(car lis))
		(else (+ (car lis)
			(sumList (cdr lis))
		))
	)
)

;;;2B
(define (charactersPerWord lis)
	(map charCount lis)
)

(define (charCount sym)
	(string-length (symbol->string sym))
)
;;;2C
(define (charactersPerSentence lis)
	(map sumList (map charactersPerWord lis))
)

;;;2D
(define (wordsPerSentence lis)
	(map length lis)
)

;;;2E
(define (statsDocument lis)
	(list 
		(sumList (charactersPerSentence lis))
		(sumList (wordsPerSentence lis))
		(length lis)
	)
)

;;Test Cases
(maxElement '(5 3 7 2 6 1 4))
(elementAtIndex '(a b c d e f) 4)
(compress '(a a a b b c c c d d d d e f f))
(maxofmax '((5 3 6 2) (1 6 2 7) (7 3 8 2 9) (6 2 4 1)))
(split '(a b c d e f g) 3)
(sumList ' (5 4 3))
(charactersPerWord ' (Scheme is so wonderful))
(charactersPerSentence '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))
(wordsPerSentence '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))
(statsDocument '((Hello Mary) (Scheme is so wonderful) (See you later) (John)))

