`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2024 14:43:35
// Design Name: 
// Module Name: tb
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


module tb();

reg [9:0] sel;
reg [1023:0] in;
wire out;
integer i;
main dut(.in(in),.sel(sel),.out(out));

initial begin
in=1024'd1;
sel=10'd0;
#1;
 for(i=0;i<1024;i=i+1) begin
  in={in[1022:0],in[1023]};
  in=~in;
  sel=sel+1'b1;
  #1;
 end
 $finish;
end

initial begin
$monitor("the sel is %d and the input is %d",sel,in);

end

endmodule
