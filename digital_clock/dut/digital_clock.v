`timescale 1ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 18:43:57
// Design Name: 
// Module Name: digital_clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digital_clock(input wire clk,input wire rstn,output [2:0] min,sec,output [3:0] hrs);
reg [3:0] hrs_temp;
reg [2:0] min_temp;
reg [2:0] sec_temp;

assign  hrs = hrs_temp;
assign min = min_temp;
assign sec = sec_temp;

//initial {hrs_temp,min_temp,sec_temp}=10'd0;

always@(posedge clk,negedge rstn) begin
 if(!rstn){hrs_temp,min_temp,sec_temp}=10'd0;
 else begin
	 if(sec_temp<6) begin
	  repeat(10) @(negedge clk);
	  sec_temp<=sec_temp+1'b1;
         end

	 else if (min_temp<6) begin
	  min_temp<=min_temp+1'b1;
	  sec_temp<=3'b0;
	 end

	 else if (hrs_temp<4'd12) begin
	  hrs_temp<=hrs_temp+1'b1;
	  min_temp<=3'd0;
	 end
	 else if (hrs_temp==4'd12)begin
	  {hrs_temp,min_temp,sec_temp}=10'd0;
	 end
 end
end

endmodule