module sipo(si,clk,rstn,out);
parameter DW=4;

input wire          si,clk,rstn;
output reg [DW-1:0] out;
reg [DW-1:0] temp;

always@(posedge clk,negedge rstn) begin
 if(!rstn) begin
  out<=4'd0;
 end
 else begin
  temp<=temp<<1;
  temp[0]<=si;
  out<=temp;
 end
end

endmodule
