module round_robin(clk,rstn,req,grant);
 output reg [3:0] grant;
 input  clk;
 input  rstn;
 input [3:0]  req;
 reg [2:0]  state;
 reg [1:0]  count;
   parameter [2:0] IDLE=3'b000;
   parameter [2:0] S0=3'b001;
   parameter [2:0] S1=3'b010;
   parameter [2:0] S2=3'b011;
   parameter [2:0] S3=3'b100;

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		state<=IDLE;
	end
 else begin
 case (state)
   S0: begin
       casex(req)
	       4'b???1:begin
	         if(count==2'b11) begin
		    if (req[1]) begin
                      count<=2'b00;
                      state<=S1;
                    end
                    else if (req[2]) begin
                      count<=2'b00;
                      state<=S2;
                    end
                    else if (req[3]) begin
                      count<=2'b00;
                      state<=S3;
                    end
		    /*
		    else if (req[0]) begin
		      count<=2'b00;
		      state<=S0;
		    end
		    */
                    else begin
                      count<=2'b00;
                      state<=IDLE;
                    end
	         end
		 else begin
		  count<=count+1'b1;
		  state<=S0;
		 end
	       end

	       4'b??1? : begin
	        count<=2'b00;
		state<=S1;
	       end

               4'b?1?? : begin
	        count<=2'b00;
		state<=S2;
	       end

               4'b1??? : begin
	        count<=2'b00;
		state<=S3;
	       end

	       default : begin
	        count<=2'b00;
		state<=IDLE;
	       end
       endcase
       end

       S1 : begin
             casex(req)
	       4'b??1?:begin
	         if(count==2'b11) begin
		    if (req[2]) begin
                      count<=2'b00;
                      state<=S2;
                    end
                    else if (req[3]) begin
                      count<=2'b00;
                      state<=S3;
                    end
                    else if (req[0]) begin
                      count<=2'b00;
                      state<=S0;
                    end
		    /*
		    else if (req[1]) begin
		      count<=2'b00;
		      state<=S1;
		    end
		    */
                    else begin
                      count<=2'b00;
                      state<=IDLE;
                    end
	         end
		 else begin
		  count<=count+1'b1;
		  state<=S1;
		 end
	       end

	       4'b?1?? : begin
	        count<=2'b00;
		state<=S2;
	       end

               4'b1??? : begin
	        count<=2'b00;
		state<=S3;
	       end

               4'b???1 : begin
	        count<=2'b00;
		state<=S0;
	       end

	       default : begin
	        count<=2'b00;
		state<=IDLE;
	       end
       endcase
       end

       
       S2 : begin
             casex(req)
	       4'b?1??:begin
	         if(count==2'b11) begin
		    if (req[3]) begin
                      count<=2'b00;
                      state<=S3;
                    end
                    else if (req[0]) begin
                      count<=2'b00;
                      state<=S0;
                    end
                    else if (req[1]) begin
                      count<=2'b00;
                      state<=S1;
                    end
		    /*
		    else if (req[2]) begin
		      count<=2'b00;
		      state<=S2;
		    end
		    */
                    else begin
                      count<=2'b00;
                      state<=IDLE;
	             end
	         end
		 else begin
		  count<=count+1'b1;
		  state<=S2;
	         end
	        end

	       4'b1??? : begin
	        count<=2'b00;
		state<=S3;
	       end

               4'b???1 : begin
	        count<=2'b00;
		state<=S0;
	       end

               4'b??1? : begin
	        count<=2'b00;
		state<=S1;
	       end

	       default : begin
	        count<=2'b00;
		state<=IDLE;
	       end
       endcase
       end


       S3 : begin
             casex(req)
	       4'b1??? : begin
	         if(count==2'b11) begin
		    if (req[0]) begin
                      count<=2'b00;
                      state<=S0;
                    end
                    else if (req[1]) begin
                      count<=2'b00;
                      state<=S1;
                    end
                    else if (req[2]) begin
                      count<=2'b00;
                      state<=S2;
                    end
		    /*
		    else if(req[3]) begin
		     count<=2'b00;
		     state<=S3;
		    end
		    */
                    else begin
                      count<=2'b00;
                      state<=IDLE;
                    end
	         end
		 else begin
		  count<=count+1'b1;
		  state<=S3;
		 end
	       end

	       4'b???1 : begin
	        count<=2'b00;
		state<=S0;
	       end

               4'b??1? : begin
	        count<=2'b00;
		state<=S1;
	       end

               4'b?1?? : begin
	        count<=2'b00;
		state<=S2;
	       end

	       default : begin
	        count<=2'b00;
		state<=IDLE;
	       end
       endcase
       end


       default : begin
           if (req[0]) begin
                      count<=2'b00;
                      state<=S0;
                    end
           else if (req[1]) begin
                   count<=2'b00;
                   state<=S1;
           end
           else if (req[2]) begin
                   count<=2'b00;
                   state<=S2;
           end
           else if (req[3]) begin
                  count<=2'b00;
                  state<=S3;
           end
	   else begin
                  count<=2'b00;
                  state<=IDLE;
           end
       end
       endcase
       end
end

always@(state) begin
 case(state)
	 S0: grant=4'b0001;
	 S1: grant=4'b0010;
         S2: grant=4'b0100;
         S3: grant=4'b1000;
	 default : grant=4'b0000; 
 endcase
end

endmodule
