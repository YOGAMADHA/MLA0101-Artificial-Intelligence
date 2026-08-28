# Project Notes

## Domain
Automobile Industry

## Problem
A vehicle service center receives complaints about overheating, starting difficulty, abnormal noise, low mileage and warning lights. The expert system identifies probable faults and recommends diagnostic actions.

## Inputs
Vehicle symptoms entered as Prolog atoms.

## Outputs
Probable vehicle fault and recommended diagnostic action.

## Knowledge Representation
Knowledge is represented through Prolog facts, predicates and production rules.

## Forward Chaining
The system begins with observed symptoms and searches for a rule whose conditions match those symptoms.

## Backward Chaining
The system begins with a possible fault and retrieves the symptoms required to establish that fault.

## Procedural vs Non-Procedural
A procedural program mainly specifies how a task should be performed step by step. Prolog is primarily declarative/non-procedural: the programmer describes facts and relationships, while the Prolog inference engine searches for solutions.

## Unification
Variables in Prolog rules are matched with concrete terms or other variables to make a rule applicable.

## Backtracking
When one possible rule or solution fails, Prolog can return to an earlier choice point and try another possibility.

## Limitation
The system is rule-based and depends on the symptoms and rules entered by the developer. It does not replace professional vehicle inspection.

## Future Enhancement
A future version can include a web interface, database storage, sensor/OBD data, confidence scoring and machine-learning assistance.
