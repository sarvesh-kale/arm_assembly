.global main 
.func main 

main :
	mov r1, #-3
	mov r2, #0
	add r0, r1,r2 
	/*
	mov r1, #1 
	svc 0
	*/
	bx lr 
