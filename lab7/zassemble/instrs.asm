############################# PRELAB  7 #############################
# EECE 2323 – Lab for EECE 2322										#
# By: Alex Oswald													#
#####################################################################

########## TASK 1 ###########
# clear all, keep $0=0x0 for base addr
clr $0
clr $1
clr $2
clr $3

# initialize (data mem) address 0x4 with 0x10
addi $1, $0, 0x10
sw $0, 0x4($1)

# initialize (data mem) address 0x5 with 0x0F
addi $2, $0, 0x0F
sw $0, 0x5($2)


########## TASK 2 ###########
# clr all, keep $0 base addr
clr $0
clr $1
clr $2
clr $3

# Add the numbers stored in 0x4 and 0x5 and store the sum in 0x11
lw $1, 0x5($0)
lw $2, 0x4($0)
add $3, $1, $2
sw $0, 0x11($3)


########## TASK 3 ###########
# clr all, keep $0 base addr
clr $0
clr $1
clr $2
clr $3

# Flip the sign of the number (2^c) stored in 0x5,
# store it in 0x12 (all data mem)
lw $1, 0x5($0)
inv $2, $1
addi $3, $2, 0x01
sw $0, 0x12($3)


########## TASK 4 ###########
# clr all, keep $0 base addr
clr $0
clr $1
clr $2
clr $3

# Subtract the numbers stored in 0x4 and 0x12,
# store the result in 0x13
lw $1, 0x4($0)
lw $2, 0x12($0)
inv $1, $1
addi $1, $1, 0x1
add $3, $1, $2
sw $0, 0x13($0)
