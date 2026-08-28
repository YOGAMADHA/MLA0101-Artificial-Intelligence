% Backward Chaining Demonstration
% Prolog naturally uses goal-directed backward chaining.

:- [medical_expert].

backward_chain(Patient, Disease) :-
    diagnosis(Patient, Disease).

show_backward(Patient, Disease) :-
    format('~nBACKWARD CHAINING~n', []),
    format('Goal: Is ~w suffering from ~w?~n', [Patient, Disease]),
    ( backward_chain(Patient, Disease) ->
        format('Goal succeeded.~n', []),
        format('Evidence: required symptoms are present.~n', [])
    ;
        format('Goal failed.~n', []),
        format('Evidence: required symptoms are not all present.~n', [])
    ).

% Example queries:
% ?- show_backward(patient1, flu).
% ?- show_backward(patient1, dengue).
