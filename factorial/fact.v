module facct();
integer fact;
reg test;
function automatic integer f(input integer fact);
 begin
  if(fact==0 || fact==1) f=1;

  else begin
   f=f(fact-1)*fact;
  end

 end

endfunction

initial begin
 test=f(5);
 $display("the factorial is %d",f(5));


end



endmodule
