# Prolog-Based Vehicle Fault Diagnosis Expert System

A simple rule-based expert system developed in SWI-Prolog for diagnosing probable vehicle faults from observed symptoms.

## Features
- Prolog facts and predicates
- Production rules
- Forward chaining
- Backward chaining
- Unification and backtracking
- Explanation of reasoning
- 10 sample industry-based test cases

## Requirements
- SWI-Prolog

## Run
Open SWI-Prolog in this folder and load:

?- [main].

Then run:

?- start.

Or directly test:

?- diagnose([high_temperature, low_coolant], Fault, Action).

Forward chaining:

?- forward_diagnosis([high_temperature, low_coolant], Result).

Backward chaining:

?- backward_diagnosis(engine_overheating, Symptoms).

Explanation:

?- explain(engine_overheating).
