`timescale 1ns / 1ps

module encryptionKeyGenerator(
input [7:0]p,
input [7:0]q,
input start,
input clk,
output [7:0]e1,
output reg finish
);
reg [15:0]e;
assign e1=e[7:0];
reg fin;
wire [15:0]phin;

assign phin=(p-1)*(q-1);  //calculating phi(n)

reg [15:0]x,y,random,gcd;
wire [15:0]r,x1,y1;

Division16 d2(x1,y1,outResult,r);
assign y1=y,x1=x;


always @(posedge clk)
begin

		if(start) 
		begin
		x<=phin;
		random<=3;  //start checking gcd from random number=3
		y<=3;
		gcd<=0;
		fin<=0;
		finish<=0;
		e<=0;
		end
		
		if((fin==1) & (gcd==1))  //output when gcd is 1
		begin
		e<=random;
		finish<=1;
		end
	
		if (r==0)       //gcd is found when remainder is 0(euclidean)
		begin
		gcd<=y;
		fin<=1;
		end
		
		
		if( fin==0)  //finding gcd
		begin
		x<=y;
		y<=r;
	
		end
	
		
		if ((fin==1) & (gcd!=1))  // check for another random number if gcd is not 1
		begin
		random<=random+2;
		y<=random+2;
		x<=phin;
		gcd<=0;
		fin<=0;
		end
end

endmodule
