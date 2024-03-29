//`include "RAM_1KB.sv"
module ram_tb_1024();
parameter      ADDR_WIDTH = 10,
               DATA_WIDTH = 64,
	       DEAPTH = 128,
	       STROBE_WIDTH = 8,
               TP=10;
reg                     cs,clk,wr_enb,rst_n;
reg  [ADDR_WIDTH-1:0]   addr;
reg  [DATA_WIDTH-1:0]   data_in;
wire [DATA_WIDTH-1:0]   data_out;
reg  [STROBE_WIDTH-1:0] strobe;
integer i,x;
integer seed=123;
RAM_1K dut(.clk(clk),
	   .cs(cs),
	   .wr_enb(wr_enb),
	   .addr(addr),
	   .rst_n(rst_n),
           .data_in(data_in),
           .data_out(data_out),
           .strobe(strobe));


initial forever #(TP/2) clk=~clk;

initial begin
clk=1'b1;
seed=1;
reset();  // initial reset
write(10'd0,{$random(seed)},8); //extreme cases
read(10'd0,8);
write(10'h3f8,{$random},8);
read(10'h3f8,8);
//------------------------------------------------




write(10'd0,{$random},4); //write at address & read from different address(bug)
read(10'd2,4);
write(10'd78,64'h78_ac_d0_90_56_78_90_12,4);
read(10'd78,4);
write(10'd143,{$random},8);
read(10'd143,8);
write(10'd77,{$random},4);
read(10'd77,4);
repeat(10) @(negedge clk);
$finish;
end

//-------------------------------------------------------------------

task str(input integer by,output [STROBE_WIDTH-1:0] stro);
	begin
          stro=8'd0;
	  x=0;
	  x=addr%by;
	  for(i=x;i<(x+by);i=i+1) begin
	  stro[i]=1'b1;
	  end
        end
endtask
task reset();
	begin
	  cs=1'b1;
          rst_n=1'b0;
	  @(negedge clk);
	  rst_n=1'b1;
	end
endtask

task write(input [ADDR_WIDTH-1:0] add,input [DATA_WIDTH-1:0] data,input integer by);
	begin
            @(negedge clk);
	    addr=add;
	    data_in=data;
	    str(by,strobe);
	    cs=1'b1;
	    wr_enb=1'b1;
	    repeat(7) @(negedge clk);
	end
endtask
task read(input [ADDR_WIDTH-1:0] add,input integer by);
	begin
            @(negedge clk);
	    addr=add;
	    //str(by,strobe);
	    cs=1'b1;
	    wr_enb=1'b0;
	    repeat(7) @(negedge clk);
	end
endtask

endmodule
