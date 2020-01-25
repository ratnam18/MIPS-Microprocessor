`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:42 08/14/2018
// Design Name:   program_memory1
// Module Name:   D:/CO LAB Sction 2 Grp 6/LAB1/lab2_tb.v
// Project Name:  LAB1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_memory1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab2_tb;

	// Inputs
	reg [15:0] jmp_loc;
	reg pc_mux_sel;
	reg stall;
	reg stall_pm;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire [15:0] current_address;

	// Instantiate the Unit Under Test (UUT)
	program_memory uut (
		.ins(ins), 
		.current_address(current_address), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.stall(stall), 
		.stall_pm(stall_pm), 
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		jmp_loc = 16'h0008;
		pc_mux_sel = 1'b1;
		stall = 1'b0;
		stall_pm = 1'b0;
		reset = 1'b1;
		clk = 1'b0;
 
#2 reset=1'b0;
#6 reset=1'b1;
#2 pc_mux_sel=1'b0;
#5 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b0;stall_pm=1'b0;
#10 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b0;stall_pm=1'b0;
#10 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b0;stall_pm=1'b0;
#5 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b1;stall_pm=1'b0;
#10 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b0;stall_pm=1'b1;
#5 jmp_loc=16'h0008;pc_mux_sel=1'b0;stall=1'b0;stall_pm=1'b1;
#5 jmp_loc=16'h0008;pc_mux_sel=1'b1;stall=1'b0;stall_pm=1'b0;
#5 jmp_loc=16'h0008;pc_mux_sel=1'b1;stall=1'b0;stall_pm=1'b0;
		
end
always
#5 clk=~clk;
      
endmodule