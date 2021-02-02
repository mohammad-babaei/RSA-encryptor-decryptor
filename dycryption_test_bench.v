`timescale 1ns / 1ps
module decryptor_test_bench;

	// Inputs
	reg [15:0] Input;
	//reg InstructionSelector;
	reg [7:0] firstPrimeNumber;
	reg [7:0] secondPrimeNumber;
	reg clk;
	reg start;
	reg start1;
	reg start2;

	// Outputs
	wire [7:0] encryptionKey;
	wire [15:0] n;
	wire [15:0] Output;
	wire [15:0] decryptionKey;
	wire finish;
	wire fin1;

	// Instantiate the Unit Under Test (UUT)
	Main #(.InstructionSelector(0)) uut (
		
		.Input(Input), 
		.firstPrimeNumber(firstPrimeNumber), 
		.secondPrimeNumber(secondPrimeNumber), 
		.clk(clk), 
		.start(start), 
		.start1(start1), 
		.start2(start2), 
		.encryptionKey(encryptionKey), 
		.n(n), 
		.Output(Output), 
		.decryptionKey(decryptionKey), 
		.finish(finish), 
		.fin1(fin1)
		);

	initial begin
		// Initialize Inputs
		Input = 0;
		firstPrimeNumber = 0;
		secondPrimeNumber = 0;
		clk = 0;
		start = 0;
		start1 = 0;
		start2 = 0;

		#10;
      Input = 1256;
		firstPrimeNumber = 67;
		secondPrimeNumber = 53;
		#10;
		start = 1;
		#5;
		start=0;
		#40;
		start1=1;
		#10;
		start1=0;
		#30;
		start2=1;
		#10;start2=0;

	end
      always #0.1 clk=!clk;
      
endmodule



