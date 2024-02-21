module main(input [2:0] d,input clk,input rst,output [2:0]out);
wire d_1,d_2,d0;
assign d0=out[2]&(~out[0]);
assign d_1=out[0];
assign d_2=(out[2]&(~out[1]))|((~out[2])&(~out[0]));
dff d1(out[0],d0,rst,clk,1'b1);
dff d2(out[1],d_1,rst,clk,1'b0);
dff d3(out[2],d_2,rst,clk,1'b0);

endmodule
