#!/usr/bin/env python3
print("Welcome Back! Please insert the following numbers")
choice = int(input("How many numbers do you want to use? 4 or 8? "))
if choice == 4 :
    x = int(input("Insert number 1: "))
    y = int(input("Insert number 2: "))
    z = int(input("Insert number 3: "))
    k = int(input("Insert number 4: "))
    aver = (x+y+z+k)/4
else :
    x = int(input("Insert number 1: "))
    y = int(input("Insert number 2: "))
    z = int(input("Insert number 3: "))
    k = int(input("Insert number 4: "))
    p = int(input("Insert number 5: "))
    m = int(input("Insert number 6: "))
    n = int(input("Insert number 7: "))
    h = int(input("Insert number 8: "))
    aver=(x+y+z+k+p+m+n+h)/8
print("The average number is: ", aver)
dil = int(input("Insert Dilution: "))
stalo=aver*dil*(10**4)
print(stalo," Cells/ml total")
wells = int(input("Insert the number of wells: "))
volwel = int(input("Insert the vol/well: "))
stalo2=(wells*dil*(10**6))/stalo
print(stalo2, " Microliters of Cells")
stalo3=wells*volwel-stalo2
print(stalo3, "Microliters of DMEM")
print("Your results are as follow: ")
print("")
print("*** ", stalo, " Cells/ml total"),
print("")
print("*** ",stalo2, " Microliters of Cells")
print("")
print("*** ",stalo3, " Microliters of DMEM")
print("")