% Knowledge Base
% vehicle_rule(Fault, RequiredSymptoms, RecommendedAction).

vehicle_rule(engine_overheating,
             [high_temperature, low_coolant],
             'Check coolant level, radiator and cooling system.').

vehicle_rule(engine_overheating,
             [high_temperature, coolant_leak],
             'Inspect radiator, hoses and coolant leakage.').

vehicle_rule(battery_failure,
             [difficulty_starting, dim_headlights],
             'Test battery voltage and charging system.').

vehicle_rule(starter_motor_problem,
             [difficulty_starting, clicking_noise],
             'Inspect starter motor, relay and electrical connections.').

vehicle_rule(low_engine_oil,
             [oil_warning_light, engine_noise],
             'Check engine oil level and inspect for oil leakage.').

vehicle_rule(engine_knocking,
             [knocking_noise, poor_acceleration],
             'Check engine oil, fuel quality and ignition system.').

vehicle_rule(fuel_system_problem,
             [low_mileage, poor_acceleration],
             'Inspect fuel filter, injectors and fuel pressure.').

vehicle_rule(air_filter_blockage,
             [low_mileage, reduced_engine_power],
             'Inspect and replace the air filter if required.').

vehicle_rule(brake_problem,
             [brake_warning_light, soft_brake_pedal],
             'Inspect brake fluid, brake lines and brake pads.').

vehicle_rule(alternator_failure,
             [battery_warning_light, dim_headlights],
             'Test alternator output and charging circuit.').

vehicle_rule(tyre_pressure_problem,
             [uneven_tyre_wear, low_tyre_pressure],
             'Check and correct tyre pressure and inspect tyre condition.').

vehicle_rule(engine_misfire,
             [rough_engine, poor_acceleration],
             'Inspect spark plugs, ignition coils and fuel injectors.').

vehicle_rule(check_engine_fault,
             [check_engine_light, rough_engine],
             'Scan the vehicle ECU and inspect engine sensors.').

vehicle_rule(transmission_problem,
             [gear_shifting_difficulty, abnormal_transmission_noise],
             'Inspect transmission fluid and transmission components.').

vehicle_rule(coolant_sensor_fault,
             [high_temperature, temperature_gauge_error],
             'Inspect coolant temperature sensor and wiring.').

% Simple facts for domain knowledge
symptom(high_temperature).
symptom(low_coolant).
symptom(coolant_leak).
symptom(difficulty_starting).
symptom(dim_headlights).
symptom(clicking_noise).
symptom(oil_warning_light).
symptom(engine_noise).
symptom(knocking_noise).
symptom(poor_acceleration).
symptom(low_mileage).
symptom(reduced_engine_power).
symptom(brake_warning_light).
symptom(soft_brake_pedal).
symptom(battery_warning_light).
symptom(uneven_tyre_wear).
symptom(low_tyre_pressure).
symptom(rough_engine).
symptom(check_engine_light).
symptom(gear_shifting_difficulty).
symptom(abnormal_transmission_noise).
symptom(temperature_gauge_error).
