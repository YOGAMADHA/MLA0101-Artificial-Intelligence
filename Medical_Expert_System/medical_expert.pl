% Medical Diagnosis Expert System
% SWI-Prolog
% Main knowledge base, backward chaining, explanation, and menu.

:- dynamic symptom/2.
:- dynamic patient_info/4.

% -------------------------
% Patient information
% -------------------------
patient_info(patient1, 22, normal, no).
patient_info(patient2, 35, normal, no).
patient_info(patient3, 28, normal, no).

% -------------------------
% Symptom facts
% -------------------------
symptom(patient1, fever).
symptom(patient1, cough).
symptom(patient1, sore_throat).
symptom(patient1, body_pain).

symptom(patient2, fever).
symptom(patient2, headache).
symptom(patient2, rash).
symptom(patient2, joint_pain).

symptom(patient3, cough).
symptom(patient3, sneezing).
symptom(patient3, runny_nose).

% -------------------------
% Production rules
% 15 diagnosis rules
% -------------------------
disease(flu) :-
    symptom(P, fever),
    symptom(P, cough),
    symptom(P, sore_throat).

disease(flu) :-
    symptom(P, fever),
    symptom(P, body_pain),
    symptom(P, headache).

disease(common_cold) :-
    symptom(P, cough),
    symptom(P, sneezing),
    symptom(P, runny_nose).

disease(common_cold) :-
    symptom(P, runny_nose),
    symptom(P, sneezing),
    symptom(P, sore_throat).

disease(dengue) :-
    symptom(P, fever),
    symptom(P, headache),
    symptom(P, rash),
    symptom(P, joint_pain).

disease(dengue) :-
    symptom(P, fever),
    symptom(P, body_pain),
    symptom(P, rash).

disease(pneumonia) :-
    symptom(P, fever),
    symptom(P, cough),
    symptom(P, breathing_difficulty).

disease(pneumonia) :-
    symptom(P, cough),
    symptom(P, chest_pain),
    symptom(P, breathing_difficulty).

disease(migraine) :-
    symptom(P, headache),
    symptom(P, nausea),
    symptom(P, light_sensitivity).

disease(migraine) :-
    symptom(P, severe_headache),
    symptom(P, nausea),
    symptom(P, light_sensitivity).

disease(food_poisoning) :-
    symptom(P, vomiting),
    symptom(P, diarrhea),
    symptom(P, stomach_pain).

disease(food_poisoning) :-
    symptom(P, nausea),
    symptom(P, vomiting),
    symptom(P, diarrhea).

disease(bronchitis) :-
    symptom(P, cough),
    symptom(P, mucus),
    symptom(P, chest_discomfort).

disease(bronchitis) :-
    symptom(P, persistent_cough),
    symptom(P, mucus),
    symptom(P, fatigue).

% -------------------------
% Patient-specific diagnosis
% Backward chaining through disease/1 and symptom/2
% -------------------------
diagnosis(Patient, Disease) :-
    disease_for_patient(Patient, Disease).

disease_for_patient(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, sore_throat).

disease_for_patient(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, body_pain),
    symptom(Patient, headache).

disease_for_patient(Patient, common_cold) :-
    symptom(Patient, cough),
    symptom(Patient, sneezing),
    symptom(Patient, runny_nose).

disease_for_patient(Patient, common_cold) :-
    symptom(Patient, runny_nose),
    symptom(Patient, sneezing),
    symptom(Patient, sore_throat).

disease_for_patient(Patient, dengue) :-
    symptom(Patient, fever),
    symptom(Patient, headache),
    symptom(Patient, rash),
    symptom(Patient, joint_pain).

disease_for_patient(Patient, dengue) :-
    symptom(Patient, fever),
    symptom(Patient, body_pain),
    symptom(Patient, rash).

disease_for_patient(Patient, pneumonia) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, breathing_difficulty).

disease_for_patient(Patient, pneumonia) :-
    symptom(Patient, cough),
    symptom(Patient, chest_pain),
    symptom(Patient, breathing_difficulty).

disease_for_patient(Patient, migraine) :-
    symptom(Patient, headache),
    symptom(Patient, nausea),
    symptom(Patient, light_sensitivity).

disease_for_patient(Patient, migraine) :-
    symptom(Patient, severe_headache),
    symptom(Patient, nausea),
    symptom(Patient, light_sensitivity).

disease_for_patient(Patient, food_poisoning) :-
    symptom(Patient, vomiting),
    symptom(Patient, diarrhea),
    symptom(Patient, stomach_pain).

disease_for_patient(Patient, food_poisoning) :-
    symptom(Patient, nausea),
    symptom(Patient, vomiting),
    symptom(Patient, diarrhea).

disease_for_patient(Patient, bronchitis) :-
    symptom(Patient, cough),
    symptom(Patient, mucus),
    symptom(Patient, chest_discomfort).

disease_for_patient(Patient, bronchitis) :-
    symptom(Patient, persistent_cough),
    symptom(Patient, mucus),
    symptom(Patient, fatigue).

% -------------------------
% Explanation
% -------------------------
explain(Patient, Disease) :-
    format('~nGoal: Is the diagnosis ~w?~n', [Disease]),
    ( diagnosis(Patient, Disease) ->
        format('Backward reasoning succeeded.~n', []),
        format('Required symptoms for ~w were found for ~w.~n', [Disease, Patient])
    ;
        format('Backward reasoning failed.~n', []),
        format('The required symptoms for ~w were not all found.~n', [Disease])
    ).

% -------------------------
% Interactive query
% -------------------------
start :-
    write('Medical Diagnosis Expert System'), nl,
    write('Enter patient name (example: patient1): '),
    read(Patient),
    findall(D, diagnosis(Patient, D), Raw),
    sort(Raw, Diseases),
    nl,
    ( Diseases = [] ->
        write('No matching diagnosis found.'), nl
    ;
        write('Possible diagnosis(es): '), write(Diseases), nl
    ).
