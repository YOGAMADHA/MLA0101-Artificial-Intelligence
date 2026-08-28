% Inference Engine
% Demonstrates forward and backward chaining concepts.

% Forward chaining:
% Start from known symptoms and derive a fault when rule conditions are satisfied.

forward_diagnosis(Symptoms, Fault) :-
    vehicle_rule(Fault, RequiredSymptoms, _),
    subset_list(RequiredSymptoms, Symptoms),
    !.

forward_diagnosis(_, unknown_fault).

% Backward chaining:
% Start with a possible fault and ask what symptoms are required to prove it.

backward_diagnosis(Fault, RequiredSymptoms) :-
    vehicle_rule(Fault, RequiredSymptoms, _).

% Backward reasoning with supplied observations.
backward_verify(Fault, Symptoms) :-
    vehicle_rule(Fault, RequiredSymptoms, _),
    subset_list(RequiredSymptoms, Symptoms).

% Unification demonstration.
unification_demo :-
    vehicle_rule(Fault, Symptoms, Action),
    format('Unified Fault = ~w~n', [Fault]),
    format('Unified Symptoms = ~w~n', [Symptoms]),
    format('Unified Action = ~w~n', [Action]).

% Backtracking demonstration.
list_possible_faults(Symptoms) :-
    vehicle_rule(Fault, RequiredSymptoms, _),
    subset_list(RequiredSymptoms, Symptoms),
    format('Possible Fault: ~w~n', [Fault]),
    fail.
list_possible_faults(_).
