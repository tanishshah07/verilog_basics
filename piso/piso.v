module piso(clk,rstn,load,data_in,out);
parameter DW=4;
input clk,rstn,load;
input [DW-1:0] data_in;
output reg out;
reg [DW-1:0] temp;

always@(posedge clk,negedge rstn) begin
 if(!rstn) begin
  out<=1'b0;
 end
 else begin
 if (load) temp<=data_in;
 else begin
  temp<=temp<<1;
  out<=temp[DW-1];
  end
 end
end

endmodule
