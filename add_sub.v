module add_sub(a, b, cin, cout, sum, overflow, second_out);
 input wire[31:0] a, b;
 input cin;
 output cout;
 output wire[31:0] sum;
 output overflow;
 // modified
 output second_out;

 wire[31:0] not_b, out_b;
 //not u1(not_b, b);
 //assign not_b = ~b;
 not not0(not_b[0], b[0]);
 not not1(not_b[1], b[1]);
 not not2(not_b[2], b[2]);
 not not3(not_b[3], b[3]);
 not not4(not_b[4], b[4]);
 not not5(not_b[5], b[5]);
 not not6(not_b[6], b[6]);
 not not7(not_b[7], b[7]);
 not not8(not_b[8], b[8]);
 not not9(not_b[9], b[9]);
 not not10(not_b[10], b[10]);
 not not11(not_b[11], b[11]);
 not not12(not_b[12], b[12]);
 not not13(not_b[13], b[13]);
 not not14(not_b[14], b[14]);
 not not15(not_b[15], b[15]);
 not not16(not_b[16], b[16]);
 not not17(not_b[17], b[17]);
 not not18(not_b[18], b[18]);
 not not19(not_b[19], b[19]);
 not not20(not_b[20], b[20]);
 not not21(not_b[21], b[21]);
 not not22(not_b[22], b[22]);
 not not23(not_b[23], b[23]);
 not not24(not_b[24], b[24]);
 not not25(not_b[25], b[25]);
 not not26(not_b[26], b[26]);
 not not27(not_b[27], b[27]);
 not not28(not_b[28], b[28]);
 not not29(not_b[29], b[29]);
 not not30(not_b[30], b[30]);
 not not31(not_b[31], b[31]);
 

 MUX_64_32 u2(b, not_b, cin, out_b);
 
 // modified
 wire second_out;

 CSA_32 u3(a, out_b, cin, cout, sum, second_out);

 //wire not_a31, not_b31, not_sum31;
 //not u4(not_a31, a[31]);
 //not u5(not_b31, b[31]);
 //not u6(not_sum31, sum[31]);
 //wire temp1, temp2;
 //and u7(temp1, not_a31, not_b31, sum[31]);
 //and u8(temp2, a[31], b[31], not_sum31);
 //or u9(overflow, temp1, temp2);
 xor u4(overflow, cout, second_out);

endmodule