% Forward Chaining Engine
% Starts with patient symptoms and repeatedly applies rules.

:- [medical_expert].

% Each rule is represented as:
% rule(Disease, RequiredSymptoms).
rule(flu, [fever, cough, sore_throat]).
rule(flu, [fever, body_pain, headache]).
rule(common_cold, [cough, sneezing, runny_nose]).
rule(common_cold, [runny_nose, sneezing, sore_throat]).
rule(dengue, [fever, headache, rash, joint_pain]).
rule(dengue, [fever, body_pain, rash]).
rule(pneumonia, [fever, cough, breathing_difficulty]).
rule(pneumonia, [cough, chest_pain, breathing_difficulty]).
rule(migraine, [headache, nausea, light_sensitivity]).
rule(migraine, [severe_headache, nausea, light_sensitivity]).
rule(food_poisoning, [vomiting, diarrhea, stomach_pain]).
rule(food_poisoning, [nausea, vomiting, diarrhea]).
rule(bronchitis, [cough, mucus, chest_discomfort]).
rule(bronchitis, [persistent_cough, mucus, fatigue]).

% all_present/2 checks whether every required symptom exists.
all_present(_, []).
all_present(Patient, [S|Rest]) :-
    symptom(Patient, S),
    all_present(Patient, Rest).

% Apply one production rule.
apply_rule(Patient, rule(Disease, Symptoms), Disease) :-
    all_present(Patient, Symptoms).

% Forward chaining for a patient.
forward_chain(Patient, Diseases) :-
    findall(Disease,
            (rule(Disease, Symptoms),
             all_present(Patient, Symptoms)),
            Raw),
    sort(Raw, Diseases).

show_forward(Patient) :-
    format('~nFORWARD CHAINING FOR ~w~n', [Patient]),
    format('Initial facts: ', []),
    findall(S, symptom(Patient, S), Facts),
    writeln(Facts),
    format('Checking production rules...~n', []),
    forward_chain(Patient, Diseases),
    ( Diseases = [] ->
        writeln('No rule fired. No matching diagnosis found.')
    ;
        forall(member(D, Diseases),
               format('Rule fired -> ~w~n', [D])),
        format('Final conclusions -> ~w~n', [Diseases])
    ).
