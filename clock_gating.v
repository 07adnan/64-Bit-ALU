`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:44 09/24/2013 
// Design Name: 
// Module Name:    clock_gating 
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
module clock_gating(clk, enable, opcode, au_clk, lu_clk);
input clk;
input opcode;
input enable;
output au_clk;
output lu_clk;
wire enable, opcode, au_clk, lu_clk, clk;

assign au_clk = clk & enable & opcode;
assign lu_clk = clk & enable & opcode;

endmodule
