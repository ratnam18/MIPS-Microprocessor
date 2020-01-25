`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:27 08/06/2018
// Design Name:   LAB1
// Module Name:   D:/Assignment1-Grp6/lab1_tb.v
// Project Name:  Assignment1-Grp6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LAB1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab1_tb;

	// Inputs
	reg [15:0] data_in;
	reg [5:0] op_dec;
	reg [15:0] A;
	reg [15:0] B;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] ans_ex;
	wire [15:0] data_out;
	wire [15:0] DM_data;
	wire [1:0] flag_ex;

	// Instantiate the Unit Under Test (UUT)
	LAB1 uut (
		.ans_ex(ans_ex), 
		.data_out(data_out), 
		.DM_data(DM_data), 
		.flag_ex(flag_ex), 
		.data_in(data_in), 
		.op_dec(op_dec), 
		.A(A), 
		.B(B), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		op_dec = 0;
		A = 0;
		B = 0;
		clk = 0;
		reset = 0;
		reset=1'b1;
#2 reset=1'b0;
#8 reset=1'b1;
A=16'h4000;B=16'hC000;op_dec=6'b000000;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000001;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000010;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000100;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000101;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000110;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b000111;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001000;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001001;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001010;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001100;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001101;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001110;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b001111;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010000;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010001;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010100;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010101;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010110;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b010111;data_in=16'h0008;
#10 A=16'h4000;B=16'hC000;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;
#10 A=16'hC000;B=16'h0001;op_dec=6'b011000;data_in=16'h0008;     
		
	end
      
	always
begin
#5 clk = 1'b1;
#5 clk = 1'b0;
end
endmodule

