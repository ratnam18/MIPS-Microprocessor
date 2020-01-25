`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:27 08/21/2018 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(A,B,ans_ex,ans_dm,ans_wb,imm,RA,RB,RW_dm,mux_sel_A,mux_sel_B,imm_sel,clk);

output[15:0] A,B;
input[15:0] ans_ex,ans_dm,ans_wb,imm;
input[4:0] RA,RB,RW_dm;
input[1:0] mux_sel_A,mux_sel_B;
input imm_sel,clk;
reg [15:0] AR,BR;
wire [15:0] B1;
reg[15:0] register_bank[31:0];

assign A=(mux_sel_A==2'b00)?AR:(mux_sel_A==2'b01)?ans_ex:(mux_sel_A==2'b10)?ans_dm:(mux_sel_A==2'b11)?ans_wb:16'b0;
assign B1=(mux_sel_B==2'b00)?BR:(mux_sel_B==2'b01)?ans_ex:(mux_sel_B==2'b10)?ans_dm:(mux_sel_B==2'b11)?ans_wb:16'b0;
assign B=(imm_sel==1'b1)?imm:B1;

always@ (posedge clk)
begin
register_bank[RW_dm]<=ans_dm;
AR<=register_bank[RA];
BR<=register_bank[RB]; 
end

endmodule
