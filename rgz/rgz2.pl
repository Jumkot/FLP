% Чтение строк из файла
read_file_lines(Filename, Lines) :-
    open(Filename, read, Stream),
    read_file_lines_aux(Stream, Lines),
    close(Stream).
read_file_lines_aux(Stream, []) :- at_end_of_stream(Stream), !.
read_file_lines_aux(Stream, [Line | Rest]) :-
    read_line_to_string(Stream, Line),
    read_file_lines_aux(Stream, Rest).

% Сравнение двух списков и нахождение позиции первого различия
compare_lists([], [], Position, Position) :- !.
compare_lists([Char1 | Rest1], [Char1 | Rest2], TempPosition, Position) :-
    NextTempPosition is TempPosition + 1,
    compare_lists(Rest1, Rest2, NextTempPosition, Position), !.
compare_lists(_, _, Position, Position) :- !.

% Сравнение двух списков строк
compare_files([], [], _).
compare_files([Line1 | Rest1], [Line2 | Rest2], LineNumber) :-
    (Line1 \= Line2 ->
        % Если строки отличаются, определяем позицию первого различия
        string_chars(Line1, List1),
        string_chars(Line2, List2),
        compare_lists(List1, List2, 1, Position),
        format("Файлы различны в строке ~d с символа ~d~n", [LineNumber, Position]),
        false
    ; % иначе продолжаем сравнение строк
        true
    ),
    NewLineNumber is LineNumber + 1,
    compare_files(Rest1, Rest2, NewLineNumber).

compare_text_files(File1, File2) :-
    read_file_lines(File1, Lines1),
    read_file_lines(File2, Lines2),
    compare_files(Lines1, Lines2, 1).