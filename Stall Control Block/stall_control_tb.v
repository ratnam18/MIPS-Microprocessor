`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:53 08/28/2018
// Design Name:   stall_control_block
// Module Name:   D:/CO LAB Sction 2 Grp 6/Processor/stall_control_tb.v
// Project Name:  LAB1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stall_control_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stall_control_tb;

	// Inputs
	reg [5:0] op;
	reg clk;
	reg reset;

	// Outputs
	wire stall;
	wire stall_pm;

	// Instantiate the Unit Under Test (UUT)
	stall_control_block uut (
		.stall(stall), 
		.stall_pm(stall_pm), 
		.op(op), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		op = 6'b0;
		clk = 0;
		reset = 1;
		#2 reset=1'b0;
		#4 reset=1'b1;
		#10 op=6'b010100;
		#20 op=6'b000000;
		#10 op=6'b011110;
		#30 op=6'b000000;
		#10 op=6'b010001;
	end
	
	always #5 clk=~clk;
      
endmodule

