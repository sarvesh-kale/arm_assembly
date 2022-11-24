.data
.balign 4
return: .word 0 

.balign 4
msg: .asciz "sum of first %d Naturals is %d\n"

.text 
.global main 
main :
	@ enter the N in r0 
	@ save lr bfr call to sum func
	@ do compute in func 
	@ restr lr after
	@ print the result to terminal 
	@ end 
	mov r0, #100 
	ldr r1, =return @ r1 <- &return 
	str lr, [r1]    @ save lr 

	bl sum
	
	@ prepare args for printf 
	mov r1, r0 
	mov r2, r3
	ldr r0,=msg  
	bl printf  
	
	@ restore lr 
	ldr r1,=return 
	ldr lr, [r1]
	
	@ end program  
	bx lr 

sum :
	mov r2, #0 @ loop cntr 
	mov r3, #0 @ sum init 
	loop:
		cmp r2, r0  
		bgt end
		add r3, r3, r2 
		add r2, r2, #1 
		b loop 
	end :
	bx lr   @ return from function  
	

