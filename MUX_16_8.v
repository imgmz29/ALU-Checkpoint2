module MUX_16_8(a, b, s, c);
 input wire[7:0] a, b;
 input s;
 output wire[7:0] c;

 MUX_2_1 mux1(a[0], b[0], s, c[0]);
 MUX_2_1 mux2(a[1], b[1], s, c[1]);
 MUX_2_1 mux3(a[2], b[2], s, c[2]);
 MUX_2_1 mux4(a[3], b[3], s, c[3]);
 MUX_2_1 mux5(a[4], b[4], s, c[4]);
 MUX_2_1 mux6(a[5], b[5], s, c[5]);
 MUX_2_1 mux7(a[6], b[6], s, c[6]);
 MUX_2_1 mux8(a[7], b[7], s, c[7]);
endmodule