module MUX_4_2(a, b, s, c);
	 input wire[1:0] a, b;
	 input s;
	 output wire[1:0] c;

	 MUX_2_1 mux1(a[0], b[0], s, c[0]);
	 MUX_2_1 mux2(a[1], b[1], s, c[1]);
endmodule
