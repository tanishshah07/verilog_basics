module main(input [31:0] in,input [4:0] sel ,output out);
wire [9:0] out_i;
wire [3:0] out_l;
wire [1:0] sel_l;
assign out_l={1'b0,1'b0,out_i[9:8]};
assign sel_l={1'b0,sel[4]};
genvar g;

generate 
	for (g=0;g<8;g=g+1) begin
	 mux m_g(in[4*g+3:4*g],sel[1:0],out_i[g]);
	end
endgenerate

mux m1(out_i[3:0],sel[3:2],out_i[8]);
mux m2(out_i[7:4],sel[3:2],out_i[9]);
mux m3(out_l[3:0],sel_l[1:0],out);

endmodule
