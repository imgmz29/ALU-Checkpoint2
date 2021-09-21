module CSA_32(a, b, cin, cout, sum, second_out);
 input wire[31:0] a, b;
 input cin;
 output cout, second_out;
 output wire[31:0] sum;

 wire s;
 wire[15:0] sum_low, sum_high;
 wire cout0, cout1;
 wire second_out0, second_out1;
 
 wire temp;

 CSA_16 u0(a[15:0], b[15:0], cin, s, sum[15:0], temp);
 CSA_16 u1_0(a[31:16], b[31:16], 0, cout0, sum_low, second_out0);
 CSA_16 u1_1(a[31:16], b[31:16], 1, cout1, sum_high, second_out1);
 MUX_32_16 mux_sum(sum_low, sum_high, s, sum[31:16]);
 MUX_2_1 mux_cout(cout0, cout1, s, cout);
 
 MUX_2_1 mux_second_out(second_out0, second_out1, s, second_out);

endmodule