module MUX_32_16(a, b, s, c);
 input wire[15:0] a, b;
 input s;
 output wire[15:0] c;

 MUX_2_1 mux1(a[0], b[0], s, c[0]);
 MUX_2_1 mux2(a[1], b[1], s, c[1]);
 MUX_2_1 mux3(a[2], b[2], s, c[2]);
 MUX_2_1 mux4(a[3], b[3], s, c[3]);
 MUX_2_1 mux5(a[4], b[4], s, c[4]);
 MUX_2_1 mux6(a[5], b[5], s, c[5]);
 MUX_2_1 mux7(a[6], b[6], s, c[6]);
 MUX_2_1 mux8(a[7], b[7], s, c[7]);
 MUX_2_1 mux9(a[8], b[8], s, c[8]);
 MUX_2_1 mux10(a[9], b[9], s, c[9]);
 MUX_2_1 mux11(a[10], b[10], s, c[10]);
 MUX_2_1 mux12(a[11], b[11], s, c[11]);
 MUX_2_1 mux13(a[12], b[12], s, c[12]);
 MUX_2_1 mux14(a[13], b[13], s, c[13]);
 MUX_2_1 mux15(a[14], b[14], s, c[14]);
 MUX_2_1 mux16(a[15], b[15], s, c[15]);
endmodule