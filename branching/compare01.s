.text 
.global main 

main:

	mov r0,#2
	mov r1,#2
	cmp r0,r1 @ do r0 - r1 and set a flg acc 
	beq equals
	mov r0,#5 
	b end 
equals :
	mov r0, r1 
end :
	bx lr @ this is end of program 
