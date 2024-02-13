`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 12:27:58
// Design Name: 
// Module Name: main
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


module main(input wire clk,input wire load,input wire rstn,input wire [5:0] data_in,output wire data_out);
parameter TP=5;
reg out;
integer count;
assign data_out=out;
always@(posedge clk or negedge rstn)
begin
 if (!rstn) out<=1'b0;

 else begin
  if(load) count<=TP*data_in;

  else begin
   if (count>1) begin
    count<=count-1;
   end
   else begin
    if(count==1) out<=1'b1;
   end
  end
 end
end
endmodule
