# ALU-Checkpoint2
## Contributors
Xuanqian Hu xh110

Minzhi Guo mg516
## Design Description
### isNotEqual
We used the addsub module to calculate the difference between operandA and operandB. Then we used an OR gate to see if the result was 0, if not, the output would be 1.
### isLessThan
We used the addsub module to calculate the difference between operandA and operandB and extract the highest bit out (1 means less than, 0 means equal or more than). However, if one of the operands was positive and the other was negative, there would be an overflow problem. So we used an XNOR gate on the highest bit of the two operands to see whether they had the same sign. If they had, then the output would be 1 and we used an AND gate, connecting the ouput and the highest bit of subtraction result. Meanwhile, we built a gate to calculate the output directly, which was: if the hightest bit of operandA was 0 and that of operandB was 1, operandA was more than operandB, the result would be 0; if the hightest bit of operandA was 1 and that of operandB was 0, operandA was less than operandB, the result would be 1. Then, the two ouputs of each path were connected by an OR gate. 
### AND
We extracted each bit of operandA and operandB and used a for loop to calculate the result bit by bit.
### OR
We extracted each bit of operandA and operandB and used a for loop to calculate the result bit by bit.
### Logical Left Shift and Arithmetic Right Shift
Because the ALU is 32-bit, we needed a 5-layer shifter. When executing SLL, we added 0; when executing SRA, we added the sign bit of operandA.
### Select Operation
Although the operation code has 5 bits, it actually uses 3 bits. So according to the lowest 3 bits of operation code, we built a gate to select operation and we used an AND gate to connect it and the operation result (if an operation was selected, it would be '1 and result = result', otherwise, '0 and result = 0'). Then, we used an OR gate to connect all of the results of AND gates. There would always be only one path which was not 0, that was exactly what we wanted.
### Addition and Subtraction (Checkpoint 1)
We used a 64to32 MUX to select whether to do addition or subtraction. The two 32-bit inputs were operand B and (operand B)', the select input was ctrl_ALUopcode (00000 for addtion and  00001 for subtraction) which was also the carry in of the 32-bit CSA.
### Overflow (Checkpoint 1)
When we built the 2-bit CSA, we added an output wire leading the first full adder's carry out which was also the second full adder's carry in. So when we built the 4-bit CSA we could get the carry in of the last full adder. And so on, when we built the 32-bit CSA, it could have a wire leading the last full adder's carry in. Here, we named the last full adder's carry in CI and named its carry out CO. When CI XOR CO was false, overflow would happen.
