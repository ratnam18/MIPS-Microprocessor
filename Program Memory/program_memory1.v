`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:52 08/14/2018 
// Design Name: 
// Module Name:    program_memory1 
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
module program_memory1(ins,current_address,jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk);
input clk,reset,pc_mux_sel,stall,stall_pm;
input[15:0] jmp_loc;
output  [15:0] current_address;
output [31:0] ins;
reg[15:0] hold_address,next_address;
reg[31:0] ins_prv;
wire[31:0] PM_out,ins_pm;
wire[15:0] CAJ,CAR,IA;

/*pm_ip p1 (
  .clka(clk), // input clka
  .addra(current_address), // input [15 : 0] addra
  .douta(PM_out) // output [31 : 0] douta
);*/

pm_ip p1(
  .clka(clk), // input clka
  .addra(current_address), // input [15 : 0] addra
  .douta(PM_out) // output [31 : 0] douta
);


assign CAJ=(stall==1'b1)? hold_address:next_address;
assign CAR = (pc_mux_sel == 1'b1) ? jmp_loc : CAJ;
assign current_address=(reset==1'b1)?CAR:16'b0;
assign IA=current_address+16'b0000000000000001;
assign ins_pm=(stall_pm==1'b1)?ins_prv:PM_out;
assign ins=(reset==1'b1)?ins_pm:32'b0;

always@(posedge clk)
begin
if(reset==1'b0)
begin
next_address<=16'b0;
hold_address<=16'b0;
ins_prv<=32'b0;
end

else
begin
next_address<=IA;
hold_address<=current_address;
ins_prv<=ins;
end

end
endmodule
