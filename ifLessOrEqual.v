module ifLessOrEqual(a, b, less, equal);
   input wire[31:0] a, b;
   output less, equal;

   wire cout, overflow, second_out;
   wire[31:0] result;
   add_sub addsub1(a, b, 1'b1, cout, result, overflow, second_out);


   or or_gate(equal, result);



   wire not_b31;
   not not_gate(not_b31, b[31]);

   wire temp_xnor, temp_and, temp_result;
   xnor xnor_gate(temp_xnor, a[31], b[31]);
   and and_result(temp_result, temp_xnor, result[31]);
   and and_gate(temp_and, a[31], not_b31);
   or final(less, temp_result, temp_and);

endmodule