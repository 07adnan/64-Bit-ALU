`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: CMR Institute of Technology 
// Engineer: Adnan Khan
// 
// Create Date:    11:51:44 10/09/2010 
// Design Name:    v5
// Module Name:    alu64 
// Project Name:   A 64 bit unsigned integer complex alu
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: addition, subtraction, addition with carry, subtraction with carry, multiplication , division, modulo, 
//								power,not,or,and,xor,nor,nand,xnor,left shift, right shift,16:1 mux,32:1 demux,5:32 encoder,16:4 decoder
//                      16 bit counter
//
//////////////////////////////////////////////////////////////////////////////////
module arithimetic_unit_64(a, b, c, op, enable, carry_in, carry_out, au_clk);
	input [63:0] a,b;// 1st signal
   input au_clk;// clk signal
	input carry_in;
   input [2:0] op;// opcode operation to be performed
	input enable;
	output [127:0] c;// output signal
	output carry_out;
	
	reg [127:0] c;
	
	`include "addition64.v"
	`include "subtraction64.v"
	`include "multiplier64.v"
//	`include "division64.v"
								

		always @ (posedge au_clk)
					begin
						case(opcode)
								//addition
								6'd0:addition64 (a, b, c, carry_in);
								//subtraction
								6'd1:subtraction64 (a, b, c, carry_in);
								//addition with carry
								6'd2:addition64 (a, b, c, carry_in);
								//subtraction with borrow
								6'd3:subtraction64 (a, b, c, carry_in);
								//multiplication
								6'd4:multiplier64 (a, b, c);
								//division
								//6'd5:division64 (1'b1, c, a, b, 0, clk);
								// modulus or remainder
								//6'd6:division64 (1'b1, c, a, b, 0, clk);
							endcase
					end
endmodule