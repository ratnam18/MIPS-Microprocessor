`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:59 08/21/2018 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(ans_dm,ans_ex,DM_data,mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk);
output[15:0] ans_dm;
input[15:0] ans_ex,DM_data;
input mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk;
wire[15:0] DM_out;
reg[15:0] Ex_out;

dm_ip dm_ip1 (
  .clka(clk), // input clka
  .ena(mem_en_ex), // input ena
  .wea(mem_rw_ex), // input [0 : 0] wea
  .addra(ans_ex), // input [15 : 0] addra
  .dina(DM_data), // input [15 : 0] dina
  .douta(DM_out) // output [15 : 0] douta
);

assign ans_dm=(mem_mux_sel_dm==1'b1)?DM_out:Ex_out;

always@(posedge clk)
begin
	if(reset==1'b0)
	begin
		Ex_out<=16'b0;
	end
	else
	begin
		Ex_out<=ans_ex;
	end
end
endmodule
