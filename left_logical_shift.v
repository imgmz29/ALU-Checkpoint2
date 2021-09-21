module left_logical_shift(a, shift_num, b);
   input wire[31:0] a;
   input wire[4:0] shift_num;
   output wire[31:0] b;


   wire[31:0] shift_1;
   genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: left_shift_1
         if (i >= 1)
            MUX_2_1 Umux(a[i], a[i - 1], shift_num[0], shift_1[i]);
         else
            MUX_2_1 Umux(a[i], 1'b0, shift_num[0], shift_1[i]);
      end
   endgenerate


   wire[31:0] shift_2;
   //genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: left_shift_2
         if (i >= 2)
            MUX_2_1 Umux(shift_1[i], shift_1[i - 2], shift_num[1], shift_2[i]);
         else
            MUX_2_1 Umux(shift_1[i], 1'b0, shift_num[1], shift_2[i]);
      end
   endgenerate


   wire[31:0] shift_3;
   //genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: left_shift_3
         if (i >= 4)
            MUX_2_1 Umux(shift_2[i], shift_2[i - 4], shift_num[2], shift_3[i]);
         else
            MUX_2_1 Umux(shift_2[i], 1'b0, shift_num[2], shift_3[i]);
      end
   endgenerate


   wire[31:0] shift_4;
  // genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: left_shift_4
         if (i >= 8)
            MUX_2_1 Umux(shift_3[i], shift_3[i - 8], shift_num[3], shift_4[i]);
         else
            MUX_2_1 Umux(shift_3[i], 1'b0, shift_num[3], shift_4[i]);
      end
   endgenerate


   //genvar i;
   generate
      for (i = 0; i < 32; i = i + 1) begin: left_shift_5
         if (i >= 16)
            MUX_2_1 Umux(shift_4[i], shift_4[i - 16], shift_num[4], b[i]);
         else
            MUX_2_1 Umux(shift_4[i], 1'b0, shift_num[4], b[i]);
      end
   endgenerate

endmodule