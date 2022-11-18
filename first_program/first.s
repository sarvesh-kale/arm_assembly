/* this is a comment */ 

.global main /* entry point must be global*/ 
.func main 

main:
	mov r0,#1000 /* put 2 into register r0*/
	bx lr       /* return from main */


