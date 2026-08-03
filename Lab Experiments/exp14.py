age = int(input("Enter Age: "))
bmi = float(input("Enter BMI: "))

if bmi > 30:
    print("Diet Plan: Low Fat Diet")
elif bmi >= 25:
    print("Diet Plan: Balanced Diet")
else:
    print("Diet Plan: High Protein Diet")
