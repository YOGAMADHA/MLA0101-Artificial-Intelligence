% Forward and Backward Chaining Demonstration

% Forward chaining example:
% Facts/symptoms -> matching rule -> conclusion.

demo_forward :-
    Symptoms = [high_temperature, low_coolant],
    forward_diagnosis(Symptoms, Fault),
    format('Forward Chaining~n'),
    format('Facts: ~w~n', [Symptoms]),
    format('Conclusion: ~w~n', [Fault]).

% Backward chaining example:
% Goal/fault -> required conditions.

demo_backward :-
    Fault = engine_overheating,
    backward_diagnosis(Fault, RequiredSymptoms),
    format('Backward Chaining~n'),
    format('Goal: ~w~n', [Fault]),
    format('Required conditions: ~w~n', [RequiredSymptoms]).

demo_both :-
    demo_forward,
    nl,
    demo_backward.
