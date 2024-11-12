;   3. Определите предикат, проверяющий: являются ли два множества пересекающимися.

(defun element-in-set? (el set)
  (cond
    ((null set) nil)
    ((eq el (car set)) t)
    (t (element-in-set? el (cdr set)))))

(defun intersection? (set1 set2)
  (cond
    ((or (null set1) (null set2)) nil)
    ((element-in-set? (car set1) set2) t) 
    (t (intersection? (cdr set1) set2))))

(print (intersection? '(1 2 3) '(3 4 5)))
(print (intersection? '(1 2 3) '(4 5 6)))

;   6. Определите функцию, возвращающую разность двух множеств, т.е. множество
;    из элементов первого множества, не входящих во второе.

(defun element-in-set? (el set)
  (cond
    ((null set) nil)
    ((eq el (car set)) t)
    (t (element-in-set? el (cdr set)))))

(defun set-diff (set1 set2)
  (cond
    ((null set1) nil)
    ((element-in-set? (car set1) set2)
     (set-diff (cdr set1) set2))
    (t
     (cons (car set1) (set-diff (cdr set1) set2)))))

(print (set-diff '(1 2 3 4) '(3 4 5)))
(print (set-diff '(1 2 3) '(4 5 6)))
(print (set-diff '() '(1 2)))

;   11. Определите функционал, выполняющий определенную операцию над соответствующими элементами
;   двух списков (Используйте применяющий функционал FUNCALL). Проверьте работу функционала для операций:
;   - выбор максимального элемента (функциональный аргумент – лямбда выражение);
;   - деление (функциональный аргумент – имя встроенной функции /).

(defun F
    (func l1 l2)
      (mapcar (lambda (x y) (funcall func x y)) l1 l2))

(print(F (lambda (a b) (if (> a b) a b)) '(3 7 2) '(5 1 9)))

(print(F #'/ '(10 20 30) '(2 4 5)))
