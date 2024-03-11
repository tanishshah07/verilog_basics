`include "sipo.v"
module sipo_tb();
parameter DW=4;
reg clk,rstn,si;
wire [DW-1:0] out;
integer i;
sipo dut(.clk(clk),.rstn(rstn),.si(si),.out(out));
initial forever #5 clk=~clk;
initial begin
clk=1'b1;
reset();
input_data(4'b1010);
input_data(4'b0101);

repeat(10) @(negedge clk);
$finish;
end
task reset();
	begin
	rstn=1'b0;
	@(negedge clk);
	rstn=1'b1;
end
endtask

task input_data(input [DW-1:0] in);
	begin
          for(i=0;i<DW;i=i+1) begin
	   @(negedge clk);
           si=in[DW-1-i];
	  end
	end
endtask
endmodule
