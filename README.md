# arm_assembly

The file compile.sh receives 1 argument as name of the file without .s extention
Suppose you want to compile ex1.s then do the following 

./compile.sh ex1 -o compute

compile.sh only takes 1 argument as input 

- To compile in command line you can execute the following 
Suppose file having assembly instructions in named compute.s

```
$ as -g  -mfpu=vfpv2 -o compute compute.s 
$ ld -o compute compute.o 
$ ./compute 
```
- The file compile.sh has the above instructions but in script form 
- We supply the -g flag to the program so that we can use gdb on the compiled version of assembly 

---
the chapters should be read in the following order to gain maximum from examples presented 

1. arm register 
2. memory 
3. branching 
4. control structure 
5. addressing modes 
6. arrays 
7. function 
8. stacks 

---

following are some of guidelines of writing assembly for ARM 

- Always write the pseudo code first. 
 for eg. You have to compute the sum of first 10 natural number ?
```   
  # init i=0 
  # init sum = 0
  # check i < 10 if yes perform next step else exit loop
  # add i to sum 
  # increment i 
  # go to check statement 
```  
- Having a pseudo code in front on you can give you a flow of the program to write in assembly 
- Start by assigning general purpose registers to variables in pseudo code 
We can assign i to r0 register, and sum to r1 register, we can jump to a label named loop to implement looping nature using b label 
in ARM 
- Then you are all set to write the code. 
- Remember that a well commented Assembly code can save you a lot of effort of understanding if you plan to revisit it !!

---

The file link.txt has links to important websites for more precise information on assembly 
