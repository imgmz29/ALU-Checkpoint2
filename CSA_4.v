module CSA_4(a, b, cin, cout, sum, second_out);
 input wire[3:0] a, b;
 input cin;
 output cout, second_out;
 output wire[3:0] sum;

 wire s;
 wire[1:0] sum_23_0, sum_23_1;
 wire cout0, cout1;
 wire second_out0, second_out1;
 
 wire temp;
 CSA_2 u0(a[1:0], b[1:0], cin, s, sum[1:0], temp);
 CSA_2 u1_0(a[3:2], b[3:2], 0, cout0, sum_23_0, second_out0);
 CSA_2 u1_1(a[3:2], b[3:2], 1, cout1, sum_23_1, second_out1);
 MUX_4_2 mux_sum(sum_23_0, sum_23_1, s, sum[3:2]);
 MUX_2_1 mux_cout(cout0, cout1, s, cout);
 // add modified
 MUX_2_1 mux_second_out(second_out0, second_out1, s, second_out);

endmodule