############################# PRELAB  8 #############################
# EECE 2323 – Lab for EECE 2322										#
# By: Alex Oswald													#
#																	#
# Description:														#
# 	Program that multiplies two numbers.							#
#####################################################################

# part 1
# 3 * -5 = -15

clr $0 # count reg
clr $1 # num1 
clr $2 # num2
clr $3 # product (working sum)

addi $0, $0, 0x00 # counter = 0
addi $1, $1, 0x03 # num1 = 3
addi $2, $2, 0xFB # num2 = -5

loopone:
add $3, $2, $3 # add num2 for every occurence of num1
addi $0, $0, 1
bne $0, $1, loopone # go back if (counter != num1)

clr $0
sw $3, 0x10($0)
lw $1, 0x10($0)
addi $1, $1, 0


# part 2
# 3 * 9 = 27

clr $0 # count reg
clr $1 # num1 
clr $2 # num2
clr $3 # product (working sum)

addi $0, $0, 0x00 # counter = 0
addi $1, $1, 0x03 # num1 = 3
addi $2, $2, 0x09 # num2 = 9

looptwo:
add $3, $2, $3 # add num2 for every occurence of num1
addi $0, $0, 1
bne $0, $1, looptwo # go back if (counter != num1)

clr $0
sw $3, 0x20($0)
lw $1, 0x20($0)
addi $1, $1, 0
