`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:12:02 09/04/2018
// Design Name:   jump_control_block
// Module Name:   D:/CO LAB Sction 2 Grp 6/Processor/jump_control_tb.v
// Project Name:  LAB1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jump_control_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jump_control_tb;

	// Inputs
	reg [15:0] jmp_address_pm;
	reg [15:0] current_address;
	reg [5:0] op;
	reg [1:0] flag_ex;
	reg interrupt;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] jmp_loc;
	wire pc_mux_sel;

	// Instantiate the Unit Under Test (UUT)
	jump_control_block uut (
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.jmp_address_pm(jmp_address_pm), 
		.current_address(current_address), 
		.op(op), 
		.flag_ex(flag_ex), 
		.interrupt(interrupt), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		jmp_address_pm = 16'h0000;
		current_address = 16'h0001;
		op = 6'h00;
		flag_ex = 2'b11;
		interrupt = 1'b0;
		clk = 0;
		reset = 1'b1;
		
		#2 reset=1'b0;
		#6 reset=1'b1;
		#8 interrupt=1'b1;
		#10 interrupt=1'b0;jmp_address_pm=16'h0008;
      #10 op=6'h18;
		#20 op=6'h10;flag_ex=2'b00;
		#10 op=6'h1e;
		// Add stimulus here

	end
	
	always #5 clk=~clk;
      
endmodule

