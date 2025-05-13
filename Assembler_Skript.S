.data
N:
.byte 5
M:
.byte 3
matrix:
.byte 1, 2, 3, 4, 5
.byte 6, 7, 8, 9, 1
.byte 2, 3, 4, 5, 6
result:
.byte 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a3, result
call print
call exit

print:
addi a0, x0, 1 # print_int ecall
lb a1, 0(a3) # loading result
ecall		# printing result
ret

exit:
addi a0, x0, 10
ecall

process:					#						funktion process starts
lb t1, 0(a2) # N -> t1									int t1N = N;
lb t2, 0(a3) # M -> t2									int t2M = M;

addi t4, x0, 0 # row pointer						    int t4RowCounter = 0;
sw t0, 0(a5)

init:          # init cycle for all matrix				DO
addi t5, x0, 0 # result to save								int t5Res = 0;
addi t3, x0, 0 # row element number							int t3RowElemCounter = 0;

cycle:         # cycle cycle for counting row sum			DO
lb t6, 0(a4) # load value from array							t6CurrentMatrixElem = matr[0][a4]
addi a4, a4, 4 # increment array pointer						a4++
add t5, t5, t6 # count sum										t5Res += t6CurrentMatrixElem
addi t3, t3, 1		#											t3RowElemCounter++
blt t3, t1, cycle							#				WHILE (t3RowElemCounter < t1N)

lb t0, 0(a5)
blt t5, t0, else							#   			if (a5result < t5Res)
sw t5, 0(a5)								#  				a5result = t5Res

else:										#				else		
addi t4, t4, 1								#				t4RowCounter ++
blt t4, t2, init    #									WHILE (t4RowCounter < t2M)
ret						# 							return 0


