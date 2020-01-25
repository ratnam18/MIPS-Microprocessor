`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:00 08/28/2018
// Design Name:   write_back_block
// Module Name:   D:/CO LAB Sction 2 Grp 6/Processor/write_back_tb.v
// Project Name:  LAB1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_back_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module write_back_tb;

	// Inputs
	reg [15:0] ans_dm;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	write_back_block uut (
		.ans_wb(ans_wb), 
		.ans_dm(ans_dm), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		ans_dm = 0;
		clk = 0;
		reset = 1'b0;
		#5 reset = 1'b1;
		#10 ans_dm = 16'b1111111111111111;
		#5 ans_dm = 16'b1010101010101010;
		#4 ans_dm = 16'b1100110011001100;
		#10 ans_dm = 16'b1111000011110000;
		end
		
		always #5 clk=~clk;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

      
endmodule

