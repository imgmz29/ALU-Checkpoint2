module or_32(a, b, c);
   
   input wire[31:0] a, b;
   output wire[31:0] c;

   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: or_for_32bits
         or u(c[i], a[i], b[i]);
      end
   endgenerate

endmodule