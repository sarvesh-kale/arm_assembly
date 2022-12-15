.data @data section

.balign 4
read: .asciz "%f%f"
.balign 4
output : .asciz "%f+%f=%f\n"
.balign 4
num1: .float 0
.balign 4
num2: .float 0

.text @ code secion  
.global main 
main :
		push {lr}
		ldr r0, =read @ read the floating point numbers 
		ldr r1, =num1 
		ldr r2, =num2 
		bl scanf
		
		ldr r3, =num1
		vldr s1, [r3]  @ store the values read in registers 

		ldr r3, =num2 
		vldr s2, [r3]
		
		
		vadd.f32 s3, s1, s2 @ do floating point add
		vmov r3, s3     @ mov result back 

		ldr r0, =output 
		bl printf 

		pop {lr}            @ restore lr  
		bx lr @ end  

