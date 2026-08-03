person = {
    "Alice":"10-01-2000",
    "Bob":"20-03-1999"
}

name = input("Enter Name: ")

if name in person:
    print("DOB:", person[name])
else:
    print("Record Not Found")
