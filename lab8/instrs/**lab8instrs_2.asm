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

multiply:
addi $0, $0, 0x00 # counter = 0
addi $1, $1, 0x07 # num1 = 7
addi $2, $2, 0xFB # num2 = -5

loop:
beq $0, $1, done # if counter = num1, jump to done
add $3, $3, $2   # sum = sum + num2
addi $0, $0, 1   # counter = counter + 1
# LOOP ISNT OFFICIAL RIP
j loop           # repeat

done:
sw $3, 0x10($0)
lw $0, 0x10($0)

