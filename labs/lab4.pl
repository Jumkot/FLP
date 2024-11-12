parent("Джон", "Боб").
parent("Мэри", "Боб").
parent("Мэри", "Энн").
parent("Боб", "Лиз").
parent("Боб", "Паул").
parent("Боб", "Сэм").
parent("Паул", "Пат").

man("Джон").
man("Боб").
man("Сэм").
man("Паул").

woman("Мэри").
woman("Энн").
woman("Лиз").
woman("Пат").

father(A, B) :-
    parent(B, A),
    man(B).

mother(A, B) :-
    parent(B, A),
    woman(B).

brother(A, B) :-
    (parent(X, A), parent(X, B), man(B)), A \= B.

sister(A, B) :-
    (parent(X, A), parent(X, B), woman(B)), A \= B.

grandchild(A, B) :-
    (parent(X, A), parent(B, X)).

aunt(A, B) :-
    (parent(X, B), sister(X, A)).

two_children(A) :-
    setof(Y, parent(A, Y), Z),
    length(Z, I),
    I=:=2.

man_have_son(A) :-
    (man(A), parent(A, B), man(B)).

#father("Сэм", X).
#mother("Боб", _).
#sister("Сэм", X).
#sister("Лиз", _).
#brother("Боб", X).
#grandchild(X, "Мэри").
#grandchild("Паул", X).
#aunt(X, "Сэм").
#aunt("Энн", _).
#two_children(X).
#man_have_son("Боб").
