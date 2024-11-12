odd(X) :- X mod 2 =:= 1.

print_odd(X, Y) :- 
    odd(X), number(Y),
    write(X), write(" "), fail.

print_odd(X, Y) :- 
    number(X),
    (X =:= Y, !; X1 is X + 1, print_odd(X1, Y)).

task1 :- 
    read(X),
    read(Y),  
    print_odd(X, Y),
    nl.

fibonacci(0, 1) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

task2 :-
    repeat,
    read(N),
    (   N < 0
    ->  write('Ввод завершён.'), nl, !
    ;   fibonacci(N, F),
        write('Число Фибоначчи F('), write(N), write(') = '), write(F), nl,
        fail).
