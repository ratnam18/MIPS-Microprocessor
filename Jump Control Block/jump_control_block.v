`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:04 09/04/2018 
// Design Name: 
// Module Name:    jump_control_block 
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
module jump_control_block(jmp_loc,pc_mux_sel,jmp_address_pm,current_address,op,flag_ex,interrupt,clk,reset);

input[15:0] jmp_address_pm,current_address;
input[5:0] op;
input[1:0] flag_ex;
input interrupt,clk,reset;
output[15:0] jmp_loc;
output pc_mux_sel;
wire[15:0] next_address,jmp_1;
wire jv,jnv,jz,jnz,jmp,ret,jv1,jnv1,jz1,jnz1;
wire[1:0] flag_ex_1;
reg interrupt_1,interrupt_2;
reg[15:0] next_address_prv;
reg[1:0] flag_ex_2;
wire[1:0] flag_ex_final;

and a1(jv,~op[0],~op[1],op[2],op[3],op[4],~op[5]);
and a2(jnv,op[0],~op[1],op[2],op[3],op[4],~op[5]);
and a3(jz,~op[0],op[1],op[2],op[3],op[4],~op[5]);
and a4(jnz,op[0],op[1],op[2],op[3],op[4],~op[5]);
and a5(jmp,~op[0],~op[1],~op[2],op[3],op[4],~op[5]);
and a6(jv1,flag_ex_final[0],jv);
and a7(jnv1,~flag_ex_final[0],jv);
and a8(jz1,flag_ex_final[1],jv);
and a9(jnz1,~flag_ex_final[1],jv);
and a10(ret,~op[0],~op[1],~op[2],~op[3],op[4],~op[5]);
or o1(pc_mux_sel,jv1,jnv1,jz1,jnz1,jmp,interrupt_1);

assign next_address=(interrupt==1'b1)?current_address+16'h0001:next_address_prv; 
assign flag_ex_1=(interrupt_2==1'b1)?flag_ex:flag_ex_2;
assign flag_ex_final=(ret==1'b1)?flag_ex_2:flag_ex;
assign jmp_1=(interrupt_1==1'b0)?jmp_address_pm:16'hf000;
assign jmp_loc=(ret==1'b1)?next_address_prv:jmp_1;

always@(posedge clk)
begin
	if(reset==1'b0)
	begin
		flag_ex_2<=2'b0;
		interrupt_1<=1'b0;
		interrupt_2<=1'b0;
		next_address_prv<=16'b0;
	end
	else
	begin
		flag_ex_2<=flag_ex_1;
		interrupt_1<=interrupt;
		interrupt_2<=interrupt_1;
		next_address_prv<=next_address;
	end
end
endmodule
