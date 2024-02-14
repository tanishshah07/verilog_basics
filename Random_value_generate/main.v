module main();
// generating randon value between 17 && 47(including lower and excuding upper)
parameter LOWR=17;
parameter UPPR=47;
parameter NUM=23;
integer a;
integer i;

initial begin

for(i=0;i<NUM;i=i+1) begin
 a=LOWR+{$random}%(UPPR-LOWR);
 $display("the value is %D",a);
 end
end
endmodule
