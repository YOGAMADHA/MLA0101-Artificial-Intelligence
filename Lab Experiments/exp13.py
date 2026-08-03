print("Disease Prediction")

age = int(input("Enter Age: "))
bp = int(input("Enter Blood Pressure: "))

if age > 40 and bp > 120:
    print("Disease Detected")
else:
    print("Healthy")
