module tff_c(input [2:0] t,input rst,input clk,output [2:0] out);
reg [2:0] out_r;

tff t1(1,rst,clk,out[0]);
tff t2(1,rst,~out[0],out[1]);
tff t3(1,rst,~out[1],out[2]);

endmodule
