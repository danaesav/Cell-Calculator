#!/usr/bin/env python3
print("Welcome Back! Please insert the following numbers")
x = int(input("Insert number 1: "))
y = int(input("Insert number 2: "))
z = int(input("Insert number 3: "))
k = int(input("Insert number 4: "))
p = int(input("Insert number 5: "))
m = int(input("Insert number 6: "))
n = int(input("Insert number 7: "))
h = int(input("Insert number 8: "))
dil = int(input("Insert Dilution"))
print("Calculating the average...")
aver=(x+y+z+k+p+m+n+h)/8
print("The average number is: ",aver)
stalo=aver*dil*(10**4)
print(stalo," Cells/ml total")
numb = int(input("Insert the number of wells: "))
stalo2=(numb*5*(10**6))/stalo
print(stalo2, " Microliters of Cells")
stalo3=numb*200-stalo2
print(stalo3, "Microliters of DMEM")
print("Your results are as follow: ")
print("")
print("*** ", stalo, " Cells/ml total"),
print("")
print("*** ",stalo2, " Microliters of Cells")
print("")
print("*** ",stalo3, " Microliters of DMEM")
print("")
