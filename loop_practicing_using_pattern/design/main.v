`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 18:18:18
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


module main();

integer i,j;
initial begin
for(i=32'b0;i<32'd5;i=i+1'b1)begin
	for(j=0;j<=i;j=j+1'b1) begin
	 $write("%d",j);
	 $write("  ");
	end
end

end
endmodule
