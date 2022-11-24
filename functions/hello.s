.data 
.balign 4 
msg : .asciz "Hello World !!" @ string stored in ram 

.balign 4
return : .word 0 @ a place in ram 

.text 
.global main 
main :
	@ ------PSEUDO CODE------- 
	@ str lr before call to puts 
	@ have ptr to msg in r0 
	@ call puts using bl 
	@ restore lr 
	
	ldr r1,=return @ r1 <- &return 
	str lr,[r1]    @ *r1 <- lr, lr saved bfr call 
	
	ldr r0, =msg   @ r0 <- &msg 
	bl puts        @ call puts and save nxt line adr into lr
				   @ r0 will have # of bytes printed on terminal 
    
	ldr r1,=return 
	ldr r1,[r1]    @ r1 has previous lr value before call to puts 
	mov lr, r1     @ rstr lr 

	bx lr		   @ hello world ends  



