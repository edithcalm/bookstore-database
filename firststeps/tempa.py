temperature = 15

if temperature > 25:
    print("It’s a hot day!")
elif temperature >=10 :
     print ("It’s a cool day!")
else:
    print("it's freezing!")

    # Control flow example for grading student marks
# This will ask the user for input and grade the student's performance

# Prompt the user for student marks
marks = int(input("Enter the student's marks (0-100): "))

# Grading system based on the marks
if marks > 70:
    print("Grade: Distinction")
elif marks >= 60:
    print("Grade: Credit")
elif marks >= 50:
    print("Grade: Pass")
else:
    print("Grade: Fail")
