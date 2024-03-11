module piso_tb();
parameter DW=4;
reg clk,rstn,load;
reg [DW-1:0] di;
wire out;
piso dut(.clk(clk),.load(load),.rstn(rstn),.data_in(di),.out(out));

initial forever #5 clk=~clk;
initial begin
clk=1'b1;
reset();
data_in(4'b1010);
d_out();
data_in(4'b0101);
d_out();
repeat(10) @(negedge clk);
$finish;
end
task reset(); //task for reset
	begin
          rstn=1'b0;
	  @(negedge clk);
	  rstn=1'b1;
	end
endtask
task data_in(input [DW-1:0] in);
	begin
          @(negedge clk);
	  load=1'b1;
	  di=in;
	end
endtask
task d_out();
	begin
         @(negedge clk);
	 load=1'b0;
         repeat(DW) @(negedge clk);
        end
endtask

endmodule
