module HF(s,c,a,b);
input wire a,b;
output wire s,c;
reg sd,cd;
assign s=sd;
assign c=cd;
always @(a or b) begin
	{cd,sd}=a+b;
end
endmodule
