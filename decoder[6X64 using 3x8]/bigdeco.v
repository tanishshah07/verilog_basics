module decoder(input[5:0] in,output  [63:0] out);
wire [7:0] ena;

deco d1(in[5:3],1'b1,ena[7:0]);

genvar g;
generate
 for(g=0;g<8;g=g+1) begin
  deco d_g(in[2:0],ena[g],out[8*g+7:8*g]);
 end
endgenerate
endmodule
