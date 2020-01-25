`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:29 09/25/2018 
// Design Name: 
// Module Name:    mips_16bit 
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
module mips_16bit(ins,A,B,Current_Address,ans_ex,ans_dm,ans_wb,mux_sel_A,mux_sel_B,imm_sel,data_out,data_in,interrupt,clk,reset);

output wire[31:0] ins;
output [15:0] A,B,data_out,Current_Address,ans_ex,ans_dm,ans_wb;
output wire[1:0] mux_sel_A,mux_sel_B;
output wire imm_sel;

input[15:0] data_in;
input clk,interrupt,reset;

wire stall,stall_pm,pc_mux_sel;
wire[5:0] op_dec;
wire[15:0] jmp_loc,imm,DM_data;
wire[4:0] RW_dm;
wire mem_en_ex,mem_rw_ex,mem_mux_sel_dm;
wire[1:0] flag_ex;

stall_control_block s1(stall,stall_pm,ins[31:26],clk,reset);

program_memory1 p1(ins,Current_Address,jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk);

dep_check_16bit dep1(imm,op_dec,RW_dm,mux_sel_A,mux_sel_B,imm_sel,mem_en_ex,mem_rw_ex,mem_mux_sel_dm,ins,clk,reset);

register_bank r1(A,B,ans_ex,ans_dm,ans_wb,imm,ins[20:16],ins[15:11],RW_dm,mux_sel_A,mux_sel_B,imm_sel,clk);

LAB1 l1(ans_ex,data_out,DM_data,flag_ex,data_in,op_dec,A,B,clk,reset);

data_memory dm1(ans_dm,ans_ex,DM_data,mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk);

write_back_block b1(ans_wb,ans_dm,clk,reset);

jump j1(jmp_loc,pc_mux_sel,ins[15:0],Current_Address,ins[31:26],flag_ex,interrupt,clk,reset);
endmodule
