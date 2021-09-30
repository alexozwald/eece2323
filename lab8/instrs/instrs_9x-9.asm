############################# PRELAB  8 #############################
# EECE 2323 – Lab for EECE 2322										#
# By: Alex Oswald													#
#																	#
# Description:														#
# 	Program that multiplies two numbers.							#
#####################################################################

clr $0 # count reg
clr $1 # num1 
clr $2 # num2
clr $3 # product (working sum)

addi $0, $0, 0x00 # counter = 0
addi $1, $1, 0x09 # num1 = 9
addi $2, $2, 0x09 # num2 = 9

label:
add $3, $3, $2 # add num2 for every occurence of num1
addi $0, $0, 1
bne $0, $1, label # go back if (counter != num1)

sw $3, 0x10($0)
lw $0, 0x10($0)
