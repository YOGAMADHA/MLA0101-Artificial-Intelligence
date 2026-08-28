# Banking Loan Eligibility

A simple AI-based Banking Loan Eligibility Expert System implemented using
production rules, propositional logic, first-order logic, forward chaining,
backward chaining, and Prolog.

## Files

- loan_eligibility.pl - Prolog implementation
- production_rules.txt - IF-THEN rules
- propositional_logic.txt - Boolean representation
- first_order_logic.txt - Predicate representation
- forward_backward_chaining.txt - Reasoning methods
- comparison_table.txt - Comparison of concepts
- test_cases.txt - Sample test cases
- report/report_content.txt - Project report content

## How to Run

Install SWI-Prolog.

Open the Prolog file:

?- [loan_eligibility].

Run a test:

?- loan_eligibility(ravi, 45000, 750, employed, no, R).

Expected:

R = eligible(ravi).

## Project Objective

To demonstrate how knowledge representation and logical inference can be
used to determine whether a banking customer satisfies basic loan eligibility
conditions.
