`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:57 09/24/2013 
// Design Name: 
// Module Name:    output_register 
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
module output_register( clk, in, out);
input [127:0]in;
input clk;
output [127:0]out;
reg [127:0] out;

always @ ( posedge clk)
begin
	out[127:0] = in[127:0];
end

endmodule
