/* 
this assembly code is translation of following C statement 
for(i=0;i<100;i++) a[i] = i;
*/

.data   @ data section of code 
a: .skip 400 

.text  @ code section of assembly 
.global main 
main :
	@ r0 will be our loop var, init to 0
	@ r1 will be our base address var, = &a 
	@ r2 will be the address to point to storage loc of ith index of a 
	@ 
	mov r0, #0 
	ldr r1, =a
loop:
	cmp r0, #100 
	beq end 
	add r2, r1, r0, lsl #2
	str r0, [r2]
	add r0, r0, #1
	b loop 
end :
	bx lr 

