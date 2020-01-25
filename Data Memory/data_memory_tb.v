`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:23:34 08/21/2018
// Design Name:   data_memory
// Module Name:   D:/CO LAB Sction 2 Grp 6/Processor/data_memory_tb.v
// Project Name:  LAB1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_memory_tb;

	// Inputs
	reg [15:0] ans_ex;
	reg [15:0] DM_data;
	reg mem_rw_ex;
	reg mem_en_ex;
	reg mem_mux_sel_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] ans_dm;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.ans_dm(ans_dm), 
		.ans_ex(ans_ex), 
		.DM_data(DM_data), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_en_ex(mem_en_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm), 
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		ans_ex = 16'h0003;
		DM_data = 16'hFFFF;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#2 reset=1'b0;
		#3 reset=1'b0;
		#3 reset=1'b1;
		#2 mem_en_ex=1'b1;mem_mux_sel_dm=1'b1;
		#5 
		#5 mem_rw_ex=1'b1;
		#5
		#5 mem_rw_ex=1'b0;
        
		// Add stimulus here

	end
	always #5 clk=~clk;
      
endmodule

