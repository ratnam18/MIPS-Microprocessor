`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:11 07/31/2018 
// Design Name: 
// Module Name:    LAB1 
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
module LAB1(ans_ex,data_out,DM_data,flag_ex,data_in,op_dec,A,B,clk,reset);
output reg [15:0] ans_ex,DM_data,data_out;
output wire [1:0] flag_ex;
input [15:0] data_in,A,B;
input [5:0] op_dec;
input clk,reset;
wire [15:0] ans_tmp,data_out_buff;
reg [1:0] flag_prv;
wire[15:0] x;
wire c1,c2,v1;
wire [15:0] m;
wire [15:0] y;


assign m=(op_dec[0]==1'b0)?B:
		 (op_dec[0]==1'b1)?(~(B)+16'b0000000000000001):B;
			
			
assign {c1,x[14:0]}=A[14:0]+m[14:0];
assign {c2,x[15]}=A[15]+m[15]+c1;
assign v1=c1^c2;
assign y=(B[3:0]==4'b0000)?A:
		   (B[3:0]==4'b0001)?{A[15],A[15:1]}:
			(B[3:0]==4'b0010)?{{2{A[15]}},A[15:2]}:
			(B[3:0]==4'b0011)?{{3{A[15]}},A[15:3]}:
			(B[3:0]==4'b0100)?{{4{A[15]}},A[15:4]}:
			(B[3:0]==4'b0101)?{{5{A[15]}},A[15:5]}:
			(B[3:0]==4'b0110)?{{6{A[15]}},A[15:6]}:
			(B[3:0]==4'b0111)?{{7{A[15]}},A[15:7]}: 
			(B[3:0]==4'b1000)?{{8{A[15]}},A[15:8]}:
         (B[3:0]==4'b1001)?{{9{A[15]}},A[15:9]}:
         (B[3:0]==4'b1010)?{{10{A[15]}},A[15:10]}:
         (B[3:0]==4'b1011)?{{11{A[15]}},A[15:11]}:
         (B[3:0]==4'b1100)?{{12{A[15]}},A[15:12]}:
         (B[3:0]==4'b1101)?{{13{A[15]}},A[15:13]}:
         (B[3:0]==4'b1110)?{{14{A[15]}},A[15:14]}:
         (B[3:0]==4'b1111)?{{15{A[15]}},A[15]}:16'b0;
         
assign ans_tmp=(op_dec==6'b000000)?x:
					(op_dec==6'b000001)?x:
					(op_dec==6'b000010)?B:
					(op_dec==6'b000100)?A&B:
					(op_dec==6'b000101)?A|B:
					(op_dec==6'b000110)?A^B:
					(op_dec==6'b000111)?~(B):
					(op_dec==6'b001000)?x:
					(op_dec==6'b001001)?x:
					(op_dec==6'b001010)?B:
					(op_dec==6'b001100)?A&B:
					(op_dec==6'b001101)?A|B:
					(op_dec==6'b001110)?A^B:
					(op_dec==6'b001111)?~(B):
					(op_dec==6'b010000)?ans_ex:
					(op_dec==6'b010001)?ans_ex:
					(op_dec==6'b010100)?A:
					(op_dec==6'b010101)?A:
					(op_dec==6'b010110)?data_in:
					(op_dec==6'b010111)?ans_ex:
					(op_dec==6'b011000)?ans_ex:
					(op_dec==6'b011001)?A<<B[3:0]:
					(op_dec==6'b011010)?A>>B[3:0]:
					(op_dec==6'b011011)?y:
					(op_dec==6'b011100)?ans_ex:
					(op_dec==6'b011101)?ans_ex:
					(op_dec==6'b011110)?ans_ex:
					(op_dec==6'b011111)?ans_ex:16'b0000000000000000;

assign flag_ex[1]=(ans_tmp==0)?1'b1:(op_dec==6'b010000)||(op_dec==6'b010000)||(op_dec==6'b010000)||(op_dec==6'b010000)||(op_dec==6'b010000)||(op_dec==6'b010000)?1'b0:(op_dec==6'b011100)||(op_dec==6'b011101)||(op_dec==6'b011110)||(op_dec==6'b011111)?flag_prv[1]:1'b0;

assign flag_ex[0]=(op_dec==6'b000000)||(op_dec==6'b000001)||(op_dec==6'b001000)||(op_dec==6'b001001)?v1:(op_dec==6'b011100)||(op_dec==6'b011101)||(op_dec==6'b011110)||(op_dec==6'b011111)?flag_prv[0]:1'b0;

assign data_out_buff=(op_dec==6'b010111)?A:data_out;

always@(posedge clk)
begin
	if(reset==1'b0)
	begin
		data_out<=0;
		ans_ex<=0;
		DM_data<=0;
		flag_prv<=0;
	end	 
	
	else
	begin
		data_out<=data_out_buff;
		ans_ex<=ans_tmp;
		flag_prv<=flag_ex;
		DM_data<=B;
	end	
end						



endmodule
