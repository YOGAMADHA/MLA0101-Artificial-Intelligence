planet = {
    "Mercury":"1st Planet",
    "Earth":"3rd Planet",
    "Mars":"4th Planet"
}

name = input("Enter Planet Name: ")

if name in planet:
    print(name, "-", planet[name])
else:
    print("Planet Not Found")
