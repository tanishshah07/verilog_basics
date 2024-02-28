`include "main.v"

module top();
reg a,b,c,d;
wire out;
main dut(.a(a),.b(b),.c(c),.d(d),.out(out));

initial begin  //TB for XOR
 {a,b,c,d}=4'd15;
 #1;
 {a,b,c,d}=4'd1;
 #1;
{a,b,c,d}=4'd3;
 #1;
 {a,b,c,d}=4'd2;
 #1;
{a,b,c,d}=4'd5;
 #1;
 {a,b,c,d}=4'd4;
 #1;
{a,b,c,d}=4'd6;
 #1;
{a,b,c,d}=4'd8;
 #1;
{a,b,c,d}=4'd10;
 #1;
{a,b,c,d}=4'd13;
 #1;
{a,b,c,d}=4'd12;
 #1;
 $finish;
end

/*
initial begin  // NOR GATE
 {a,b,c,d}=4'd1;
 #1;
 {a,b,c,d}=4'd0;
 #1;
 {a,b,c,d}=4'd2;
 #1;
 {a,b,c,d}=4'd0;
 #1;
 {a,b,c,d}=4'd4;
 #1;
 {a,b,c,d}=4'd0;
 #1;
 {a,b,c,d}=4'd8;
 #1;
$finish;
end
*/
endmodule
