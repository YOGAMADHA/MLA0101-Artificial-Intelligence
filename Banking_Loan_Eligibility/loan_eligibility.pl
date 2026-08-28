% Banking Loan Eligibility Expert System
% Run with SWI-Prolog using: ?- [loan_eligibility].
% Then try: ?- loan_eligibility(Name, Income, CreditScore, Employment, ExistingLoan, Result).

loan_eligibility(Name, Income, CreditScore, Employment, ExistingLoan, Result) :-
    ( eligible(Income, CreditScore, Employment, ExistingLoan)
      -> Result = eligible(Name)
      ;  Result = not_eligible(Name)
    ).

eligible(Income, CreditScore, Employment, ExistingLoan) :-
    Income >= 30000,
    CreditScore >= 700,
    Employment = employed,
    ExistingLoan = no.

eligible(Income, CreditScore, Employment, ExistingLoan) :-
    Income >= 50000,
    CreditScore >= 650,
    Employment = employed,
    ExistingLoan = no.

% Example queries:
% ?- loan_eligibility(ravi, 45000, 750, employed, no, R).
% ?- loan_eligibility(priya, 25000, 600, employed, no, R).
