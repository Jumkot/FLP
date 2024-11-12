;   1. Определите функцию, заменяющую в списке все вхождения x на y.
;   Например, x=1, y=+, L = (2 1 3 5 1 1 8) –> (2 + 3 5 + + 8).

(defun replace_s (x y l)
    (cond
        ((null l) l)
        ((equal x (car l)) (replace_s x y (cons y (cdr l))))
        (t (cons (car l) (replace_s x y (cdr l))))
    )
)
(print(replace_s 1 '+ '(2 1 3 5 1 1 8)))

;   13. Определите функцию, определяющую, сколько раз заданное s-выражение входит в список.
;   Например, x=(a), L=(1 (a) x (a) 2 a 1 2 d) –> 2. 

(defun count_s (x l &optional(n 0))
    (cond
        ((null l) n)
        ((equal x (car l)) (count_s x (cdr l) (+ n 1)))
        (t (count_s x (cdr l) n))
    )
)
(print(count_s '(a) '(1 (a) x (a) 2 a 1 2 d)))

;   23. Определите функцию, формирующую подсписок из элементов списка L, начиная с k-го элемента.
;   (нумерация элементов должна начинаться с 1).
;   Например, L=(-2 6 s -1 4 f 0 z x r), k=3, n=4 –> (s -1 4 f). 

(print(defun little (l k n &optional(p nil))
    (cond
        ((equal n 0) (reverse p))
        ((equal k 1) (little (cdr l) k (- n 1) (cons (car l) p)))
        (t (little (cdr l) (- k 1) n))
    )
))

(print(little '(-2 6 s -1 4 f 0 z x r) 3 4))
