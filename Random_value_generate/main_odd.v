module main_odd();
// generating random odd value between 17 && 47(including lower and excuding upper)
parameter LOWR=16;
parameter UPPR=47;
parameter NUM=15;
integer a;
integer i;

initial begin

for(i=0;i<NUM;i=i+1) begin
 a=LOWR+{$random}%(UPPR-LOWR);
  if(a%2==0) begin
   a=LOWR+{$random}%(UPPR-LOWR);
  end
  else $display("the value is %D",a);
 end
end
endmodule
