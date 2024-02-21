module main(input a,b,c, output out);
wire[4:0] y; 
nor(y[0],~a,b);
nor(y[1],~c,b);
nor(y[2],a,~b);
nor(y[3],a,~c);
nor(y[4],y[1],y[2],y[3],y[0]);
nor(out,y[4],y[4]);
endmodule
