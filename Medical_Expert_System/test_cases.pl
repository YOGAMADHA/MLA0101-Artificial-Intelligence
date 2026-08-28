% Test cases for the Medical Expert System

:- [medical_expert].
:- [forward_chaining].

test_case_1 :-
    writeln('TEST 1: patient1'),
    forward_chain(patient1, D),
    writeln(D).

test_case_2 :-
    writeln('TEST 2: patient2'),
    forward_chain(patient2, D),
    writeln(D).

test_case_3 :-
    writeln('TEST 3: patient3'),
    forward_chain(patient3, D),
    writeln(D).

test_case_4 :-
    writeln('TEST 4: Backward chaining - patient1 / flu'),
    ( diagnosis(patient1, flu) ->
        writeln('PASS: Flu can be inferred.')
    ;
        writeln('FAIL: Flu cannot be inferred.')
    ).

test_case_5 :-
    writeln('TEST 5: Backward chaining - patient1 / dengue'),
    ( diagnosis(patient1, dengue) ->
        writeln('FAIL: Unexpected dengue diagnosis.')
    ;
        writeln('PASS: Dengue correctly rejected.')
    ).

run_tests :-
    test_case_1,
    test_case_2,
    test_case_3,
    test_case_4,
    test_case_5.
