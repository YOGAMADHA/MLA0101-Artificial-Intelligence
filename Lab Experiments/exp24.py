# Backward Chaining Example

goal = input("Enter Disease to Check (Flu/Cold): ")

fever = input("Does patient have fever? (yes/no): ")
cough = input("Does patient have cough? (yes/no): ")

if goal == "Flu":
    if fever == "yes" and cough == "yes":
        print("Goal Achieved: Patient has Flu")
    else:
        print("Goal Failed: Patient does not have Flu")

elif goal == "Cold":
    if cough == "yes":
        print("Goal Achieved: Patient has Cold")
    else:
        print("Goal Failed: Patient does not have Cold")
