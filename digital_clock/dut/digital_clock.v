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
integer count;
assign  hrs = hrs_temp;
assign min = min_temp;
assign sec = sec_temp;

parameter MAX_COUNT=10;
parameter MAX_SEC=6;
parameter MAX_HRS=12;
initial count=1;
always@(posedge clk,negedge rstn) begin
 if(!rstn){hrs_temp,min_temp,sec_temp}=10'd0;
 else begin
  count<=count+1;
  if (count==MAX_COUNT) begin
   sec_temp<=sec_temp+1'b1;
   count<=0;
  end

  if (sec_temp==(MAX_SEC-1) && count==MAX_COUNT) begin
   min_temp<=min_temp+1'b1;
   sec_temp<=3'd0;
  end

  if (min_temp==(MAX_SEC-1) && sec_temp==(MAX_SEC-1) && count==MAX_COUNT) begin
	  hrs_temp<=hrs_temp+1'b1;
	  min_temp<=3'b0;
  end

  if(hrs_temp==(MAX_HRS-1) && min_temp==(MAX_SEC-1) && sec_temp==(MAX_SEC-1) && count==MAX_COUNT)begin
		 hrs_temp<=4'b0;
		 min_temp<=3'b0;
		 sec_temp<=3'b0;
  end
 end
end

endmodule


