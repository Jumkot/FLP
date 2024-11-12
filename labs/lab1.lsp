;	1. Напишите сложную функцию, используя композиции функций CAR и CDR, которая возвращает атом * при применении к следующему списку:
((1 ((*) 2 3))) -> *
(print (car(caadar '((1 ((*) 2 3))))))

;	3. Из атомов 1, 2, 3, nil создайте список (((1 2 3))) двумя способами:
;   с помощью композиций функций CONS:
	(print (cons (cons (cons 1(cons 2(cons 3 nil))) nil)  nil))
;   с помощью композиций функций LIST:
	(print (list (list (list 1 2 3))))

;	4. С помощью DEFUN определите функцию, которая возвращает измененный список по заданию
;   (в теле функции разрешается использовать только следующие встроенные функции: CAR, CDR, CONS, APPEND, LIST, LAST, BUTLAST
;   с одним аргументом). Проверьте её работу, организуя обращение к функции со списками разной длины.
;   Функция меняет местами первый и предпоследний элементы списка:
(defun f(l)
    (append
         (last (butlast l))(cdr (butlast (butlast l)))(list (car l))(last l)))
