`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 16:10:17
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





//----------------------this are the ambiguity and conncurrentness----------
////----ambiguity of the ternary operator it will assign both the value----
///-----------ambiguity in if-------------
////=------ambiguity in case -----
///checking assgin is perfectly concurrent
//checking initial is not concurrent
module main();
wire [3:0]y;
////----ambiguity of the ternary operator it will assign both the value----
/*
assign y= 1'bx ? 4'b0110 : 4'b0001;
initial begin
$display("%b",y);
$finish;
end
*/


///-----------ambiguity in if-------------
/*
initial begin
 if (1'bx) $display("in the if ");
 else $display("it is always in else in case of ambiguity");
$finish;
end
*/

////=------ambiguity in case -----
/*
initial begin

case(1'bx)
	1:$display("in a");
	0:$display("in b");

default:$display("always is in default in case of ambiguity");
endcase
end
*/

///checking assgin is perfectly concurrent
/*
assign y=1'b1;
assign y=1'b0;
initial
$display("%b",y);
*/


//checking initial is not concurrent
reg [3:0] x;
initial begin
x=4'b1011;
end
initial begin
x=4'b0101;
$display("%b",x);

end





endmodule
