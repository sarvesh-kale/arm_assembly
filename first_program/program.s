/* this is a comment */ 

.global main /* entry point must be global*/ 
.func main 

main:
	mov r0, #2 /* put 2 into register r0*/
	mov r7, #1 
	svc 0  @ or SWI 0 -- both works 

