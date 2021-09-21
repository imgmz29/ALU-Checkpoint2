module FullAdder(A, B, Cin, Cout, Sum);
	input A, B, Cin;
	output Cout, Sum;

	wire[2:0] temp;

	xor U1(temp[0], A, B);
	and U2(temp[1], temp[0], Cin);
	and U3(temp[2], A, B);
	xor U4(Sum, temp[0], Cin);
	or U5(Cout, temp[1], temp[2]);

endmodule