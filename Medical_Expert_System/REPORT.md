# Medical Diagnosis Expert System Using Prolog

## 1. Problem Analysis and Domain Understanding

The project develops a rule-based expert system that identifies possible diseases from basic symptoms and observations. The system uses a knowledge base containing patient facts and production rules.

### Main entities
- Patient
- Symptom
- Disease
- Production rule
- Diagnosis
- Inference engine

### Inputs
Examples include fever, cough, sore throat, body pain, headache, rash, joint pain, sneezing and runny nose.

### Outputs
The system produces one or more possible diseases when the required symptom conditions are satisfied.

## 2. Objectives

- Represent medical knowledge using Prolog facts and rules.
- Build a production-rule knowledge base.
- Implement forward chaining.
- Demonstrate backward chaining using Prolog's goal-directed inference.
- Demonstrate unification and backtracking.
- Test the system using multiple patient cases.
- Compare procedural and non-procedural approaches.

## 3. Knowledge Acquisition

For an academic prototype, symptom-disease relationships should be based on introductory medical references and reviewed before being included in the rule base. The rules in this project are simplified educational rules and are not intended for real clinical diagnosis.

## 4. Knowledge Representation

### Facts
A fact states information that is known to be true.

Example:
```prolog
symptom(patient1, fever).
symptom(patient1, cough).
symptom(patient1, sore_throat).
```

### Production Rule
A production rule has the form:

IF required conditions are true
THEN conclude a disease.

Example:
```prolog
disease_for_patient(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, cough),
    symptom(Patient, sore_throat).
```

## 5. Production Rule Knowledge Base

The system contains multiple rules for:
- Flu
- Common cold
- Dengue
- Pneumonia
- Migraine
- Food poisoning
- Bronchitis

The rules use combinations of symptoms. Multiple rules for the same disease demonstrate alternative reasoning paths.

## 6. Forward Chaining

Forward chaining is data-driven reasoning.

Process:
```text
Initial patient facts
       ↓
Check production rules
       ↓
Find rules whose conditions are satisfied
       ↓
Fire matching rules
       ↓
Generate conclusions
```

For patient1:
```text
fever + cough + sore_throat
        ↓
Flu rule satisfied
        ↓
Flu
```

The `forward_chaining.pl` program checks the initial symptom facts against the production rules and reports the rules that fire.

## 7. Backward Chaining

Backward chaining is goal-driven reasoning.

Process:
```text
Goal: Flu?
      ↓
Find rule that can conclude Flu
      ↓
Check required symptoms
      ↓
Verify symptoms for patient
      ↓
Goal succeeds or fails
```

Example:
```prolog
?- show_backward(patient1, flu).
```

The system attempts to prove the goal `diagnosis(patient1, flu)` by satisfying the required symptom conditions.

## 8. Unification

Unification allows Prolog to match terms and bind variables.

Example:
```prolog
symptom(Patient, fever).
```

When queried with:
```prolog
symptom(patient1, fever).
```

the variable `Patient` is unified with `patient1`.

## 9. Backtracking

If more than one rule can produce a conclusion, Prolog can automatically search for alternative solutions.

Example:
```prolog
?- diagnosis(patient1, Disease).
```

Prolog may explore the first matching rule and then backtrack to find another matching diagnosis rule if applicable.

## 10. Procedural vs Non-Procedural Paradigm

| Procedural approach | Non-procedural / Declarative approach |
|---|---|
| Describes how to solve the problem | Describes facts and relationships |
| Programmer specifies control flow | Prolog's inference engine controls search |
| Usually step-by-step | Goal and rule based |
| Example: Python/C algorithm | Example: Prolog |
| Focuses on procedure | Focuses on knowledge |

Prolog is mainly declarative because the programmer describes facts and logical relationships rather than writing the complete control sequence.

## 11. Testing

### Test 1
Patient1:
- Fever
- Cough
- Sore throat
- Body pain

Expected:
- Flu

### Test 2
Patient2:
- Fever
- Headache
- Rash
- Joint pain

Expected:
- Dengue

### Test 3
Patient3:
- Cough
- Sneezing
- Runny nose

Expected:
- Common cold

### Test 4
Backward goal:
```prolog
show_backward(patient1, flu).
```
Expected:
- Goal succeeds.

### Test 5
Backward goal:
```prolog
show_backward(patient1, dengue).
```
Expected:
- Goal fails.

## 12. Sample Results

```text
FORWARD CHAINING FOR patient1
Initial facts: [fever,cough,sore_throat,body_pain]
Rule fired -> flu
Final conclusions -> [flu]
```

```text
BACKWARD CHAINING
Goal: Is patient1 suffering from flu?
Goal succeeded.
Evidence: required symptoms are present.
```

## 13. Evaluation

### Correctness
The system correctly matches symptom combinations with the predefined rules.

### Coverage
The knowledge base covers seven simplified disease categories and multiple symptom combinations.

### Consistency
Rules are structured so that a conclusion is produced only when its required symptoms are present.

### Reasoning
Forward chaining begins with known facts, while backward chaining begins with a diagnosis goal.

## 14. Limitations

- Rules are simplified for academic demonstration.
- The system does not replace a doctor.
- It does not use laboratory results, medical history, examination findings, or real clinical decision support.
- It does not provide a medically validated diagnosis.

## 15. Future Enhancements

- Add more diseases and symptoms.
- Add confidence or severity levels.
- Add a graphical user interface.
- Add medical-history reasoning.
- Add explanation traces for every rule.
- Connect to a validated clinical knowledge source.

## 16. Conclusion

The project demonstrates how a rule-based expert system can represent domain knowledge using Prolog facts and production rules. Forward chaining provides data-driven reasoning, while backward chaining provides goal-driven reasoning. Prolog's unification and backtracking support automated logical inference. The project therefore demonstrates the main concepts required for constructing a rule-based expert system.

## 17. GitHub Repository

Recommended repository name:

`Medical-Expert-System-Prolog`

Suggested repository structure:

```text
Medical-Expert-System-Prolog/
├── medical_expert.pl
├── forward_chaining.pl
├── backward_chaining.pl
├── test_cases.pl
├── README.md
├── REPORT.md
└── screenshots/
```

## 18. References

Use reliable introductory sources for the medical background and cite the exact sources used during knowledge acquisition. For the software component, use the official SWI-Prolog documentation.
