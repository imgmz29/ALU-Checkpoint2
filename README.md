# ALU-Checkpoint2
## Contributors
Xuanqian Hu xh110

Minzhi Guo mg516
## Design Description
### isNotEqual
### isLessThan
### AND
We extracted each bit of operandA and 
### OR
### Logical Left Shift
### Arithmetic Right Shift
### Select Operation
### Addition and Subtraction (Checkpoint 1)
We used a 64to32 MUX to select whether to do addition or subtraction. The two 32-bit inputs were operand B and (operand B)', the select input was ctrl_ALUopcode (00000 for addtion and  00001 for subtraction) which was also the carry in of the 32-bit CSA.
### Overflow (Checkpoint 1)
When we built the 2-bit CSA, we added an output wire leading the first full adder's carry out which was also the second full adder's carry in. So when we built the 4-bit CSA we could get the carry in of the last full adder. And so on, when we built the 32-bit CSA, it could have a wire leading the last full adder's carry in. Here, we named the last full adder's carry in CI and named its carry out CO. When CI XOR CO was false, overflow would happen.
