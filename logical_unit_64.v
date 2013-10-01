`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:19 09/24/2013 
// Design Name: 
// Module Name:    logical_unit_64 
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
module logical_unit_64(a,b,c,opcode,lu_clk);
	 
	 input [63:0] a;
	 input [63:0] b;
	 input [2:0] opcode;
	 input lu_clk;
	 output [63:0] c;
	
	 reg [63:0] c;
	
	`include "or64.v"
	`include "and64.v"
	`include "xor64.v"
	`include "nor64.v"
	`include "nand64.v"
	`include "xnor64.v"
	`include "invert64.v"
	
always @ (posedge lu_clk)
					begin
						case(opcode)
								//or
								6'd0:or64 (a, b, c);
								//and
								6'd1:and64 (a, b, c);
								//xor
								6'd2:xor64 (a, b, c);
								//nor
								6'd3:nor64 (a, b, c);
								//nand
								6'd4:nand64 (a, b, c);
								//xnor
								6'd5:xnor64 (a, b, c);
								// invert a
								6'd6:invert64 (a, c);
								// invert b
								6'd7:invert64 (b, c);
							endcase
					end
endmodule
