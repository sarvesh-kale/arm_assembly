.data 
.balign 4
return : .word 0 
.balign 4
in1 : .word 0
in2 : .wrod 0
.text 
.global main 
main :
 	@ save lr into return 
	@ print msg to input 2 nums 
	@ call scanf and receive 2 nums 
	@ print their sum 
	@ restore lr 

