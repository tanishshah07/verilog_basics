module event_queue();
integer i;
initial begin
for(i=0;i<6;i=i+1) begin
 $display("this is display %d",i);	
 $monitor("this is monitor %0d",i);

 #10;  // without delay monitor only one time with delay monitor mulitiple time as time instance changes
 end
end

endmodule
