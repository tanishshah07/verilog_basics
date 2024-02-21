module dff(output reg q,input wire d,input wire rst,input clk,input id);
 always@(posedge clk,posedge rst) begin
  if(rst)
	  if (id) q<=1'b1;
	  else q<=0;
  else
	  q<=d;
 
 end
endmodule
