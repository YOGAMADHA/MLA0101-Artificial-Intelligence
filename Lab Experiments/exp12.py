X = [
    [25, 30000, 0],
    [35, 60000, 1],
    [45, 80000, 1],
    [20, 20000, 0],
    [50, 90000, 1],
    [30, 50000, 1]
]

age = int(input("Enter Age: "))
income = int(input("Enter Income: "))

if age >= 30 and income >= 50000:
    print("Loan Approved")
else:
    print("Loan Rejected")
