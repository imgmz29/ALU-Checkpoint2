module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;


   wire cout;
   wire second_out;
 
   wire [31:0] result_addsub, result_and, result_or, result_sll, result_sra;
 
   add_sub addsub1(data_operandA, data_operandB, ctrl_ALUopcode[0], cout, result_addsub, overflow, second_out);
   and_32 and1(data_operandA, data_operandB,result_and);
   or_32 or1(data_operandA, data_operandB,result_or);
   left_logical_shift sll1(data_operandA, ctrl_shiftamt, result_sll);
   right_arithmetic_shift sra1(data_operandA, ctrl_shiftamt,result_sra);
   ifLessOrEqual ifLessOrEqual1(data_operandA, data_operandB, isLessThan, isNotEqual);
	
   wire not_ctr0, not_ctr1, not_crt1;
   not not0(not_ctr0, ctrl_ALUopcode[0]);
   not not1(not_ctr1, ctrl_ALUopcode[1]);
   not not2(not_ctr2, ctrl_ALUopcode[2]);

   wire[31:0] ctr_addsub, ctr_and, ctr_or, ctr_sll, ctr_sra;
   wire[31:0] temp_addsub, temp_and, temp_or, temp_sll, temp_sra;

   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: cal_final_result
         and and_or(ctr_or[i], ctrl_ALUopcode[0], ctrl_ALUopcode[1], not_ctr2);
         and and_and(ctr_and[i], not_ctr0, ctrl_ALUopcode[1], not_ctr2);
         and and_addsub(ctr_addsub[i], not_ctr1, not_ctr2);
         and and_sll(ctr_sll[i], not_ctr0, not_ctr1, ctrl_ALUopcode[2]);
         and and_sra(ctr_sra[i], ctrl_ALUopcode[0], not_ctr1, ctrl_ALUopcode[2]);

         and and_or2(temp_or[i], ctr_or[i], result_or[i]);
         and and_and2(temp_and[i], ctr_and[i], result_and[i]);
         and and_addsub2(temp_addsub[i], ctr_addsub[i], result_addsub[i]);
         and and_sll2(temp_sll[i], ctr_sll[i], result_sll[i]);
         and and_sra2(temp_sra[i], ctr_sra[i], result_sra[i]);

         or final(data_result[i], temp_or[i], temp_and[i], temp_addsub[i], temp_sll[i], temp_sra[i]);
      end
   endgenerate
   
 
endmodule