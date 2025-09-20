# Modules: A module is a Python script containing Python code.
# It can define functions, classes, and variables that can be used in other Python scripts.
# Modules help organize and modularize your code, making it more maintainable.

roll_number = 10
studentName = "Ram"
age = 25

def annual_percentage(sub1, sub2, sub3, sub4):
    n = len(locals())
    total_score = sub1 + sub2 + sub3 + sub4
    return total_score / n

percentage = annual_percentage(85, 88, 95, 98)
