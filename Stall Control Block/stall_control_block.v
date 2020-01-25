`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:21 08/28/2018 
// Design Name: 
// Module Name:    stall_control_block 
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
module stall_control_block(stall,stall_pm,op,clk,reset);
output stall;
output reg stall_pm;
input[5:0] op;
input clk,reset;

wire hlt,ld,jump;
reg ld1,jp1,jp;

and a1(hlt,op[0],~(op[1]),~(op[2]),~(op[3]),op[4],~(op[5]));
and a2(ld,~(op[0]),~(op[1]),op[2],~(op[3]),op[4],~(op[5]),~(ld1));
and a3(jump,op[2],op[3],op[4],~(op[5]),~(jp1),op[4],~(op[5]));
or o1(stall,hlt,jump,ld);

always@(posedge clk)
begin
	if(reset==1'b0)
	begin 
		ld1<=0;
		stall_pm<=0;
		jp<=0;
		jp1<=0;
	end
	else
	begin
		ld1<=ld;
		jp<=jump;
		stall_pm<=stall;
		jp1<=jp;
	end
end

endmodule
