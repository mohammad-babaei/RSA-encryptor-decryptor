`timescale 1ns / 1ps

module Main(
	 // input is what you want to encrypt or decrypt
    input [15:0] Input,
	 input [7:0]firstPrimeNumber,
	 input [7:0]secondPrimeNumber,
	 input clk,
    input start,
	 input start1,
	 input start2,
	 output [7:0]encryptionKey,
	 output [15:0]n,

	 output [15:0]Output,
	 output [15:0] decryptionKey,
	 output finish,
	 output fin1
    );
	
	 wire [15:0] MPower;
	 parameter InstructionSelector = 0;
	 
	 encryptionKeyGenerator k1 (firstPrimeNumber,secondPrimeNumber,start,clk,encryptionKey,finish);
	 decryptionKeyGenerator kd1 (firstPrimeNumber,secondPrimeNumber,encryptionKey,clk,start1,n,decryptionKey,fin1);
	 
	 generate
	 
	 if(InstructionSelector)
		begin
		modularMultiplicator encryptor (Input,{8'b00000000,encryptionKey},n,start2,clk,finished,Mpower,Output);
		assign MPowerOutput = Mpower;
		end
	 else
		begin
	   modularMultiplicator decryptor (Input,decryptionKey,n,start2,clk,finished,Mpower,Output);
		assign MPowerOutput = Mpower;
		end
	  
	  endgenerate
	  
	 
	 
	 
endmodule
