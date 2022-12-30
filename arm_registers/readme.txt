16 integer regs and 32 floating pt regs 
always store numbers in integer regs in 2s complement 
r0 to r15 are used exactly in same way 

the below is valid 
add r0,r0,r1 

this is expected 
add r0,r1,r2 

we cannot directly access memory from processor 
memory -> registers > processor 

processor only works with registers 

ldr means load to register 
str means store from registers 

both load and store happens from and to memory 

There is also a mvn instruction in arm 

mvn r1, r2 

This will invert all the bits of r2 and move the result in r1 
so r1 will contain 1's complement of r2 if r2 is a negative value 
