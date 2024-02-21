module tff(input t,input rst,input clk,output reg q);
always@(posedge clk,negedge rst) begin
if(!rst) q<=0;
else begin
 q<=t^q;
 end
end
endmodule
