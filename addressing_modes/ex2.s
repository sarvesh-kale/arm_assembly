/*
check what happens if value > 31 supplied to lsl 
there is no rol instead only ror is provided 
rol r1, 4 is eq to ror r1, 28 @ 32 - n where n is 4
*/

.text 
.global main 
main : 
	mov r1, #2 
	lsl r1, #3 @ if shift value is > 31 error in 
	ror r1, #2 
	bx lr 
