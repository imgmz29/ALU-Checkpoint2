module MUX_2_1(a, b, s, out);
	 input a, b, s;
	 output out;

	 wire temp1, temp2;
	 wire not_s;

	 not u1(not_s, s);
	 and u2(temp1, a, not_s);
	 and u3(temp2, b, s);
	 or u4(out, temp1, temp2);

endmodule
