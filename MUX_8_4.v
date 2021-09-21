module MUX_8_4(a, b, s, c);
	 input wire[3:0] a, b;
	 input s;
	 output wire[3:0] c;

	 MUX_2_1 mux1(a[0], b[0], s, c[0]);
	 MUX_2_1 mux2(a[1], b[1], s, c[1]);
	 MUX_2_1 mux3(a[2], b[2], s, c[2]);
	 MUX_2_1 mux4(a[3], b[3], s, c[3]);
endmodule
