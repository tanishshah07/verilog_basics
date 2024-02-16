`timescale 10ms / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 12:47:47
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//--------------------TEST_CASES_COVERS---------------------------------------------
//--->>RESET
//--->>Reset_In_Between
//--->>Loding_data_&_Checking_output


module tb();
parameter TP=5;
parameter WIDTH=6;
reg clk;
reg rstn;
reg [WIDTH-1:0] data_in;
reg load;
wire data_out;

//----------------self_checking_variable----------------------------------
reg data_out_ex;
integer count_ex,testr;
//-------------------------------------------------------------------------
main tb(.clk(clk),
        .rstn(rstn),
	.data_in(data_in),
	.load(load),
	.data_out(data_out));

initial forever #1 clk=~clk;
initial begin
clk=0;
reset_n(); // calling reset
load_data(5'b00101); // checking output to be HIGH after 5 seconds
n_delay(70);
reset_n(); // doing reset after that
load_data(5'b01101);  //loading data 
n_delay(50);
reset_n(); // doing reset HIGH in between
rstn=1'b0;
n_delay(40);
$finish;
end
//------------------------------------------------------------------
//-------------------Mimic the functionality------------------------

always@(posedge clk or negedge rstn) begin

	if (!rstn) begin
	 data_out_ex<=1'b0;
	 count_ex<=0;
	end
        else begin
	 if(load) count_ex<=TP*data_in;
	 else begin
	  if(count_ex>1) begin
	   count_ex=count_ex-1;
	  end
	  else if(count_ex==1) data_out_ex<=1'b1;
	 end
        end	
end
///-----------------------CHeckerS----------------------------
//-----RESET_CHECKER------
initial begin
 testr=0;
 forever@(rstn) begin
  if(rstn==1'b0) begin
   $display("Reset Status is Loading........... ");
   @(negedge clk);
   if(data_out_ex==1'b0 && count_ex==0) $display("Reset is PASSED!!! at %t",$time);
   else $display("RESET is failed @ %t",$time);
  end
 end
end
//--------------------------------------------------
//------OUTPUT_CHECKER------------------------------
initial begin
	forever@(data_out_ex,data_out) begin
		if(count_ex==1) begin
		 $display("Output Status is Loading......."); 
		 if(data_out_ex==data_out) $display("Output Test Is PASSED!!!! @ %t",$time);
		 else $display("Output Test Is FAILED!!!!");
		end
	end
end
//------------------------------------------------
//-------COUNT_CHECKER----------------------------
always@(count_ex) begin
	if(data_in) begin
	 if(count_ex==count_ex) testr=testr+1;
	end
        if(testr==(TP*data_in)) begin
	$display("Count dectrimenting test is PASSED testeer value %d!!!@%t",testr,$time);
	 testr=0;
        end
end


//--------tasks------------------------------------------------------
task load_data(input [WIDTH-1:0]data); //loading data task
 begin
  load=1'b1;
  data_in=data;
  @(negedge clk);
  load=1'b0;
 end
endtask

task reset_n(); //reset task
 begin
  rstn=1'b0;
  @(negedge clk);
  rstn=1'b1;
 end
endtask



task n_delay(input integer i); //delay task
 begin
  repeat(i) @(negedge clk);
 end
endtask

endmodule
