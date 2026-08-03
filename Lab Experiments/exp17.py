fever = input("Fever (yes/no): ")
cough = input("Cough (yes/no): ")

if fever == "yes" and cough == "yes":
    print("Disease: Flu")
elif fever == "yes":
    print("Disease: Viral Fever")
else:
    print("No Disease Found")
