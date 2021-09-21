module CSA_2(a, b, cin, cout, sum, second_out);
 input wire[1:0] a, b;
 input cin;
 output cout, second_out;
 output wire[1:0] sum;

 //wire s;
 wire sum_1_0, sum_1_1;
 wire cout_1_0, cout_1_1;

 FullAdder u0(a[0], b[0], cin, second_out, sum[0]);
 FullAdder u1_0(a[1], b[1], 0, cout_1_0, sum_1_0);
 FullAdder u1_1(a[1], b[1], 1, cout_1_1, sum_1_1);
 MUX_2_1 u_mux_sum(sum_1_0, sum_1_1, second_out, sum[1]);
 MUX_2_1 u_mux_cout(cout_1_0, cout_1_1, second_out, cout);

endmodule
