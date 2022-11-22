/*
diff btween just lsl and lsl used with mov
check the assembler code emitted for both instrs
*/

.text 
.global main 
main :
	mov r1, #2 
	lsl r1, #1 
	mov r1, r1, lsl #2
	bx lr  @ end here 

