# Medical Diagnosis Expert System Using Prolog

## Overview
A rule-based expert system developed in SWI-Prolog to identify possible diseases from patient symptoms. The system demonstrates production rules, forward chaining, backward chaining, unification, backtracking, and declarative/non-procedural reasoning.

## Tools
- SWI-Prolog
- Prolog
- Git/GitHub

## Features
- Patient symptom knowledge base
- 14 production-rule patterns / 15+ rule clauses
- Forward chaining
- Backward chaining
- Unification and variable binding
- Backtracking
- Explanation facility
- Multiple test cases

## Files
- `medical_expert.pl` - knowledge base, diagnosis rules and main queries
- `forward_chaining.pl` - forward chaining engine
- `backward_chaining.pl` - backward chaining demonstration
- `test_cases.pl` - test cases

## Run
Open SWI-Prolog in this folder.

```prolog
?- [medical_expert].
?- [forward_chaining].
?- [backward_chaining].
?- [test_cases].
```

### Forward chaining
```prolog
?- show_forward(patient1).
```

Expected conclusion:
```text
flu
```

### Backward chaining
```prolog
?- show_backward(patient1, flu).
```

Expected:
```text
Goal succeeded.
```

### Failed backward goal
```prolog
?- show_backward(patient1, dengue).
```

Expected:
```text
Goal failed.
```

### Run all tests
```prolog
?- run_tests.
```

## Important note
This is an educational expert-system prototype, not a medical diagnostic tool. Real medical diagnosis requires qualified healthcare professionals and clinical data.
