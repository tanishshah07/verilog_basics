
module ha_tb(s,c,a,b);
input wire  s,c;
output wire a,b;
reg at,bt;
assign a=at;
assign b=bt;
initial begin
	repeat(10) begin
		{at,bt}=$random;
		#2;
		$display("the value of a=%b , b=%b ,s=%b ,c=%b",a,b,s,c);
	end
end
endmodule
