module CSA_8(a, b, cin, cout, sum, second_out);
 input wire[7:0] a, b;
 input cin;
 output cout, second_out;
 output wire[7:0] sum;

 wire s;
 wire[3:0] sum_low, sum_high;
 wire cout0, cout1;
 wire second_out0, second_out1;

 wire temp;
 CSA_4 u0(a[3:0], b[3:0], cin, s, sum[3:0], temp);
 CSA_4 u1_0(a[7:4], b[7:4], 0, cout0, sum_low, second_out0);
 CSA_4 u1_1(a[7:4], b[7:4], 1, cout1, sum_high, second_out1);
 MUX_8_4 mux_sum(sum_low, sum_high, s, sum[7:4]);
 MUX_2_1 mux_cout(cout0, cout1, s, cout);
 
 MUX_2_1 mux_second_out(second_out0, second_out1, s, second_out);

endmodule