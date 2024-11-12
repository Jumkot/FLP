% Чтение строки и преобразование её в список чисел
read_list(List) :-
    read_line_to_string(user_input, Input),
    split_string(Input, " ", "", StrNumbers),
    maplist(number_string, List, StrNumbers).

% Проверка, есть ли элемент в списке
member(X, [X|_]).
member(X, [_|Tail]) :-
    member(X, Tail).

% Пересечение двух списков
intersection([], _, []). % Если первый список пустой, пересечение — пустой список
intersection([Head|Tail], List2, [Head|Result]) :-
    member(Head, List2), % Если Head содержится в List2, добавляем его в результат
    intersection(Tail, List2, Result).
intersection([_|Tail], List2, Result) :-
    intersection(Tail, List2, Result).

% Основной предикат для запуска программы
find_intersection :-
    read_list(List1),
    read_list(List2),
    intersection(List1, List2, Intersection),
    Intersection \= [], % Если пересечение непустое
    maplist(write_number_with_space, Intersection),
    nl.

% Вспомогательный предикат для вывода числа с пробелом после него
write_number_with_space(Number) :-
    write(Number), write(' ').