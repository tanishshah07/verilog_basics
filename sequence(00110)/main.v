module mealy_00110(
input clk,rst,in,
output reg out
);

parameter SD=0,S0=1,S00=2,S001=3,S0011=4;

reg [2:0] state;
always @(posedge clk)begin
	if(rst==1'b1)begin
		out<=0;
		state<=SD;
	end
	else begin
		case(state)
			SD : begin
			  state<=in? SD : S0;
			  out<=0;
			end
			S0 : begin
				state <= in ? S0 : S00;
				out <= 0;
			end
			S00 : begin
				state <= in ? S001 : S00;
				out <=0;
			end
			S001 : begin
				state <= in ? S0011 : S0;
				out <=0;
			end
			S0011 : begin
				state <= in ? S0:S00;
				out <= in ? 0 : 1;
			end
			default : begin
				state <= SD;
				out <= 0;
			end
		endcase
	end
end
endmodule
