% Explanation Module

explain(Fault) :-
    vehicle_rule(Fault, Symptoms, Action),
    nl,
    writeln('--------------- EXPLANATION ----------------'),
    format('Fault: ~w~n', [Fault]),
    format('Required observations: ~w~n', [Symptoms]),
    format('Recommended action: ~w~n', [Action]),
    writeln('Reasoning: the rule is satisfied when all required symptoms are observed.'),
    writeln('---------------------------------------------'),
    nl.

explain_all(Symptoms) :-
    writeln('Reasoning trace:'),
    vehicle_rule(Fault, RequiredSymptoms, Action),
    subset_list(RequiredSymptoms, Symptoms),
    format('IF ~w THEN ~w; ACTION: ~w~n',
           [RequiredSymptoms, Fault, Action]),
    fail.
explain_all(_).
