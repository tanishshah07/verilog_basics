module full_adder(input [7:0] a,input [7:0]b,input cin,output [7:0]sum ,output cout_out); 

wire [7:0] cout;
genvar g;
 adder a1(a[0],b[0],cin,sum[0],cout[0]);
generate
	for(g=1;g<8;g=g+1) begin
	 adder a_g(a[g],b[g],cout[g-1],sum[g],cout[g]);
	end

endgenerate

assign cout_out=cout[7];

endmodule


