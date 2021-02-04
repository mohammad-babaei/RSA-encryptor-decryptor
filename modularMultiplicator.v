`timescale 1ns / 1ps

module modularMultiplicator(input [15:0]M,
input [15:0]e,
input [15:0]n,
input start,
input clk,
output finished,
output reg[31:0]Mpower,
output [15:0] remainder
    );

reg [15:0] ncount;
reg [31:0]x,n1;

Division32 d1(x,n1,outResult,remainder);

always @(posedge clk)
begin
		  // $display("start: %d", start);
		  if(start) begin
                ncount = e-1;
					 // $display("in start: ncount: %d; x: %d",ncount, x);
					 Mpower = M;
					 x=0;
					 n1={16'b0000000000000000,n};
        end
        else if(!finished) 
		  begin
					 Mpower = remainder * M;
					 ncount = ncount - 1;
					 // $display("in not finished: ncount: %d; x: %d",ncount, x);

        end
		  x=Mpower;
		  // $display("out of condition: ncount: %d; x: %d",ncount, x);
		  
end

assign finished = (ncount == 0)?1:0;

endmodule

