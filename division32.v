`timescale 1ns / 1ps

module Division32(A,B,Res,remainder);

    parameter WIDTH = 32;
    input [WIDTH-1:0] A;
    input [WIDTH-1:0] B;
    output [WIDTH-1:0] Res;
	 output reg [WIDTH-1:0] remainder;
    reg [WIDTH-1:0] Res = 0;
    reg [WIDTH-1:0] a1,b1;
    reg [WIDTH:0] p1;      
	 reg [7:0]remainderL;
    integer i;

    always@ (A or B)
    begin
        
        a1 = A;		
        b1 = B;		
        p1= 0;			
        for(i=0;i < WIDTH;i=i+1)    begin 
            p1 = {p1[WIDTH-2:0],a1[WIDTH-1]};
            a1[WIDTH-1:1] = a1[WIDTH-2:0];
            p1 = p1-b1;
            if(p1[WIDTH-1] == 1)    begin
                a1[0] = 0;			
                p1 = p1 + b1;   end	
            else
                a1[0] = 1;
        end
        Res = a1;   
		  {remainderL,remainder} = p1;
	 
	 end 

endmodule
