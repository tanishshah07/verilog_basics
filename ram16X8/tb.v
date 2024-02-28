`include "ram_16x8.v"
`define ADDR_WIDTH 4
`define DEPTH 16
`define DATA_WIDTH 8
`define TP 10
module top();
reg clk,rst;
reg wr_enb,rd_enb;
reg [`ADDR_WIDTH-1:0] wr_addr,rd_addr;
reg [`DATA_WIDTH-1:0] wr_data;
wire [`DATA_WIDTH-1:0] rd_data;
integer i;
ram dut(.clk(clk),.rst(rst),.wr_enb(wr_enb),.wr_addr(wr_addr),.wr_data(wr_data),.rd_enb(rd_enb),.rd_addr(rd_addr),.rd_data(rd_data));
initial forever #(`TP/2) clk=~clk; //Clock
initial begin
 //------reset test ---------------------
 clk=0;
 reset(); //reset verify
 //-----------------------------------------
 write(4'b0000,8'hfe);  //extreme cases
 read(4'b0000);
 write(4'b1111,8'hed);  //extreme cases
 read(4'b1111);
 //-----------------------------------------------------
 //-------------full the memory----------------------------------------
 for (i=0;i<`DEPTH;i=i+1) begin
  write(i,{$random}%256);
 end
 for (i=0;i<`DEPTH;i=i+1) begin
  read(i);
 end
 //-------------out of range---------------------------------------------------
 write(8'hfe,9'd256);  //take the in range value from LSB
 read(8'hfe);
//---------------RANDOM_read_write-----------------------------------
 write({$random}%16,{$random}%256);
 read({$random}%16);
//------------------------------------------------------------------
 //------------------BACK_TO_BACK_WRITE_READ---------------------------------------------------
for(i=0;i<`DEPTH;i=i+1)begin
 if(i==10) reset(); // in_between_reset
 else begin
 write({$random}%16,{$random}%256);
 read({$random}%16);
 end
end
//-----------------------------------------------------------
//---------------READ_WRITE_AT_SAME_TIME(DIFF_addrs)-------------------------------------
fork
write(4'b1010,8'd17);
read(4'b1101);
join
//==-----------------------------------------------------------
 $finish;
end
//---------------READ_WRITE_AT_SAME_TIME(same_addrs)-------------------------------------
initial begin
@(negedge clk);
read(4'b0000); //it will take the previous data of that address as it will assign the data when nxt posedge come
end
//-------------------------------------------------------------------------------------
//-------------------MIMiCing_the_Design---------------------------------------------------------------





//----------------------------------------------------------------------------
//---------------------tasks---------------------------------------
task write(input [`ADDR_WIDTH-1:0] addr
	  ,input [`DATA_WIDTH-1:0] data);
	  begin
	    @(negedge clk);
	    rd_enb=1'b0;
            wr_enb=1'b1;
	    wr_addr=addr;
	    wr_data=data;
	  end
endtask
task read(input [`ADDR_WIDTH-1:0] addr);
	  begin
           @(negedge clk);
	   wr_enb=1'b0;
	   rd_enb=1'b1;
	   rd_addr=addr;
	  end
  endtask
task reset();
 begin
  rst=1;
  @(negedge clk);
  rst=0;
 end
endtask
endmodule
