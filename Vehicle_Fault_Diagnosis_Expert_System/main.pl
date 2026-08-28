% Vehicle Fault Diagnosis Expert System
% Main program

:- consult(knowledge_base).
:- consult(inference_engine).
:- consult(explanation).

start :-
    nl,
    writeln('=============================================='),
    writeln(' VEHICLE FAULT DIAGNOSIS EXPERT SYSTEM'),
    writeln('=============================================='),
    writeln('Enter symptoms one by one as Prolog atoms.'),
    writeln('Example: high_temperature.'),
    writeln('Type done. when finished.'),
    nl,
    collect_symptoms([], Symptoms),
    diagnose(Symptoms, Fault, Action),
    nl,
    writeln('--------------- DIAGNOSIS ----------------'),
    format('Observed Symptoms: ~w~n', [Symptoms]),
    format('Probable Fault: ~w~n', [Fault]),
    format('Recommended Action: ~w~n', [Action]),
    writeln('-------------------------------------------'),
    nl.

collect_symptoms(Acc, Symptoms) :-
    write('Symptom: '),
    read(Input),
    ( Input == done ->
        reverse(Acc, Symptoms)
    ;
        collect_symptoms([Input|Acc], Symptoms)
    ).

diagnose(Symptoms, Fault, Action) :-
    vehicle_rule(Fault, RequiredSymptoms, Action),
    subset_list(RequiredSymptoms, Symptoms),
    !.

diagnose(_, unknown_fault, 'Perform a complete vehicle inspection.').

subset_list([], _).
subset_list([H|T], List) :-
    member(H, List),
    subset_list(T, List).
