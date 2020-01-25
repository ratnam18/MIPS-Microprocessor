`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:04:10 09/25/2018
// Design Name:   mips_16bit
// Module Name:   D:/CO LAB Sction 2 Grp 6/Processor/mips_16bit_tb.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_16bit_tb;

	// Inputs
	reg [15:0] data_in;
	reg interrupt;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] ins;
	wire [15:0] A;
	wire [15:0] B;
	wire [15:0] Current_Address;
	wire [15:0] ans_ex;
	wire [15:0] ans_dm;
	wire [15:0] ans_wb;
	wire [1:0] mux_sel_A;
	wire [1:0] mux_sel_B;
	wire imm_sel;
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	mips_16bit uut (
		.ins(ins), 
		.A(A), 
		.B(B), 
		.Current_Address(Current_Address), 
		.ans_ex(ans_ex), 
		.ans_dm(ans_dm), 
		.ans_wb(ans_wb), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.data_out(data_out), 
		.data_in(data_in), 
		.interrupt(interrupt), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		interrupt = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#200 reset=0;
		#500 reset=1;
        
		// Add stimulus here

	end
      
		always #500 clk=~clk;

endmodule