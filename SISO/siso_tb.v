`include "siso.v"
module top();
reg clk,rst,si;
wire out;

//-------self_varialbe----------------------------------
reg out_exp;
reg tp1,tp2,tp3;

//------------------------------------------------------


siso dut(.clk(clk),.rst(rst),.si(si),.out(out)); // module instantiate
initial forever #5 clk=~clk; //clocl=k generation


// giving test cases 1010 && 01010
initial begin
 clk=0;
 rst=1;
 @(negedge clk);
 rst=0;
 si=1'b1;
 n_delay(1);
 si=1'b0;
 n_delay(1);
 si=1'b1;
 n_delay(1);
 si=1'b0;
 n_delay(5);
//-------------------------------
//-------01010-----------------------
 rst=1;
 @(negedge clk);
 rst=0;
 si=1'b0;
 n_delay(1);
 si=1'b1;
 n_delay(1);
 si=1'b0;
 n_delay(1);
 si=1'b1;
 n_delay(5);
 $finish;
end
//----------MIMICing_the_Functionality-----------------

always@(posedge clk,posedge rst) begin
 if (rst) out_exp<=1'b0;
 else begin
  tp1<=si;
  tp2<=tp1;
  tp3<=tp2;
  out_exp<=tp3;
 end
end
//-------------------------------------------------------
//------------------checker------------------------------

always@(out) begin
 if(out_exp==out) $display("the SISO test PASSED!!! @ %t",$time);
 else  $display("the SISO test FAILED!!! @ %t",$time);
end

//=------------------------------------------------------

//--------TASKS----------------------
task n_delay(input integer n);
 begin
  repeat(n) @(negedge clk);
 end
endtask
//-------------------------------------

endmodule
