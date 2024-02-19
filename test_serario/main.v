module main(input clk,input rst,input in,output reg p,c);

parameter NO_COIN=3'd0,RS1=3'd1,RS2=3'd2,PRODUCT=3'd3,CHANGE=3'd4;
reg [2:0] state;

always@(posedge clk,posedge rst) begin
	if (rst) begin
	 state<=NO_COIN;
	 p<=0;
	 c<=0;
	end

	else begin

	case(state)
		NO_COIN: begin
		 state<=in? RS1 : RS2;
		 p<=0;
		 c<=0;
		end

		RS1 : begin
		 state<=in ? RS2 : PRODUCT;
		 p<=0;
		 c<=0;
		end

		RS2 : begin
		 state<= in ? PRODUCT : CHANGE;
		 p<=0;
		 c<=0;
		end

		PRODUCT : begin
		 state <= NO_COIN;
		 p<=1;
		 c<=0;
		end

		CHANGE : begin
		 state<=NO_COIN;
		 p<=1;
		 c<=1;
		end

		default : begin
		 state<=in? RS1 : RS2;
		 p<=0;
		 c<=0;
		end
	
	
	endcase
    end

end


endmodule
