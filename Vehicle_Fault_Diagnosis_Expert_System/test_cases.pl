% Test Cases
% Load main.pl before running these queries.

test_case(1) :-
    diagnose([high_temperature, low_coolant], Fault, Action),
    format('Test 1 -> ~w -> ~w~n', [Fault, Action]).

test_case(2) :-
    diagnose([difficulty_starting, dim_headlights], Fault, Action),
    format('Test 2 -> ~w -> ~w~n', [Fault, Action]).

test_case(3) :-
    diagnose([oil_warning_light, engine_noise], Fault, Action),
    format('Test 3 -> ~w -> ~w~n', [Fault, Action]).

test_case(4) :-
    diagnose([low_mileage, poor_acceleration], Fault, Action),
    format('Test 4 -> ~w -> ~w~n', [Fault, Action]).

test_case(5) :-
    diagnose([brake_warning_light, soft_brake_pedal], Fault, Action),
    format('Test 5 -> ~w -> ~w~n', [Fault, Action]).

test_case(6) :-
    diagnose([battery_warning_light, dim_headlights], Fault, Action),
    format('Test 6 -> ~w -> ~w~n', [Fault, Action]).

test_case(7) :-
    diagnose([rough_engine, poor_acceleration], Fault, Action),
    format('Test 7 -> ~w -> ~w~n', [Fault, Action]).

test_case(8) :-
    diagnose([check_engine_light, rough_engine], Fault, Action),
    format('Test 8 -> ~w -> ~w~n', [Fault, Action]).

test_case(9) :-
    diagnose([gear_shifting_difficulty, abnormal_transmission_noise], Fault, Action),
    format('Test 9 -> ~w -> ~w~n', [Fault, Action]).

test_case(10) :-
    diagnose([uneven_tyre_wear, low_tyre_pressure], Fault, Action),
    format('Test 10 -> ~w -> ~w~n', [Fault, Action]).

run_tests :-
    nl,
    writeln('========== TEST RESULTS =========='),
    test_case(1),
    test_case(2),
    test_case(3),
    test_case(4),
    test_case(5),
    test_case(6),
    test_case(7),
    test_case(8),
    test_case(9),
    test_case(10),
    writeln('==================================').
