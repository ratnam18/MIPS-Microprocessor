`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:41 08/28/2018 
// Design Name: 
// Module Name:    write_back_block 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module write_back_block(ans_wb,ans_dm,clk,reset);
output reg [15:0] ans_wb;
input[15:0] ans_dm;
input clk,reset;

always@(posedge clk)
begin
	if(reset==1'b0)
	begin
		ans_wb<=16'b0;
	end
	else
	begin
		ans_wb<=ans_dm;
	end
end

endmodule
