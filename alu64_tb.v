`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:07 10/09/2010
// Design Name:   alu16
// Module Name:   C:/Xilinx91i/adnan/miniproject/alu16_tb.v
// Project Name:  miniproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu16_tb_v;

	// Inputs
	reg [16:1] a;
	reg [16:1] b;
	reg [6:1] op;
	reg enable;

	// Outputs
	wire [32:1] c;
	wire [7:1] flags;

	// Instantiate the Unit Under Test (UUT)
	alu16 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.op(op), 
		.enable(enable), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		enable = 0;// output is z, checking last condition
		#100;
		
		//addition, random input
		enable = 1;
		a = 16'd0;
		b = 16'd0;
		op = 6'd1;
		#100;
		
		//addition , max input , check for overflow and carry flag
		enable = 1;
		a=16'd60000;
		b=16'd60000;
		op = 6'd1;
		#100;
		
		enable = 1;
		a=16'd1000;
		b=16'd5000;
		op = 6'd1;
		#100;
		
		//subtraction, random input
		enable = 1;
		a=16'd25;
		b=16'd17;
		op = 6'd2;
		#100;
		
		//subtraction, random input, check for overflow and carry flag
		enable = 1;
		a=16'h0d32;
		b=16'ha012;
		op = 6'd2;
		#100;
      
		//subtraction, max input
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op= 6'd2;
		#100;
		
		// addition with carry		
		enable =1;
		a=16'd4;
		b=16'd3;
		op=6'd3;
		#100;
		
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op = 6'd3;
		#100;
		
		enable =1;	
		a=16'hffff;
		b=16'hffff;
		op=6'd3;
		#100;
		
		//subtraction with borrow
		enable = 1;
		a=16'd4;
		b=16'd2;
		op = 6'd4;
		#100;
		
		enable = 1;
		a=16'd4;
		b=16'd0;
		op = 6'd4;
		#100;
		
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op = 6'd4;
		#100;
		
		// multiplication
		enable = 1;
		a=16'd4;
		b=16'd3;
		op = 6'd5;
		#100;
		
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op = 6'd5;
		#100;
		
		// division
		enable = 1;
		a=16'd4;
		op = 6'd6;
		#100;
		
		enable = 1;
		a=16'd4;
		b=16'd1;
		op=6'd6;
		#100;
		
		//modolo
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd7;
		#100;
		
		enable = 1;
		a=16'd2;
		b=16'd3;
		op=6'd7;
		#100;
		
		//power
		enable = 1;
		a=16'd2;
		b=16'd1;
		op=6'd8;
		#100;
		
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd8;
		#100;
		
		//invert
		enable = 1;
		a=16'd1;
		op=6'd9;
		#100;
		
		enable = 1;
		a=16'd46;
		op=6'd9;
		#100;
		
		//or operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd10;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd10;
		#100;
		
		// and operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd11;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd11;
		#100;
		
		//xor operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd12;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd12;
		#100;
		
		//nor operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd13;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd13;
		#100;
		
		//nand operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd14;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd14;
		#100;
		//xnor operation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd15;
		#100;
		
		enable = 1;
		a=16'd15;
		b=16'd8;
		op=6'd15;
		#100;
		//left shift
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd16;
		#100;
		
		enable = 1;
		a=16'd85;
		b=16'd24;
		op=6'd16;
		#100;
		
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op=6'd16;
		#100;
		//right shift
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd17;
		#100;
		
		enable = 1;
		a=16'd87;
		b=16'd24;
		op=6'd17;
		#100;
		//concatenation
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd18;
		#100;
		
		enable = 1;
		a=16'hffff;
		b=16'hffff;
		op=6'd18;
		#100;
		// 16:1 mux
		enable = 1;
		a=16'd5;
		b=16'd4;
		op=6'd19;
		#100;
		
		enable = 1;
		a=16'd85;
		b=16'd0;
		op=6'd19;
		#100;
		
		//1:32 demux
		enable = 1;
		a=16'd1;
		b=16'd20;
		op=6'd20;
		#100;
		
		enable = 1;
		a=16'd1;
		b=16'd1;
		op=6'd20;
		#100;
		
		// 5:32 encoder
		enable = 1;
		a=16'd5;
		op=6'd21;
		#100;
		
		enable = 1;
		a=16'd15;
		op=6'd21;
		#100;
		
		//16:4 decoder
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd22;
		#100;
		
		enable = 1;
		a=16'd18;
		b=16'd1;
		op=6'd22;
		#100;
		
		enable = 1;
		a=16'd2;
		b=16'd1;
		op=6'd22;
		#100;
		
		//counter 4 bit
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd23;
		#100;
		
		enable = 1;
		a=16'd87;
		b=16'd10;
		op=6'd23;
		#100;
		
		enable = 1;
		a=16'd5;
		b=16'd25;
		op=6'd23;
		#100;
		
		//clear carry flag
		enable = 1;
		op=6'd24;
		#100;
		
		// compare
		enable = 1;
		a=16'd5;
		b=16'd1;
		op=6'd25;
		#100;
		
		enable = 1;
		a=16'd50;
		b=16'd12;
		op=6'd25;
		#100;
		
		enable = 1;
		a=16'd12;
		b=16'd50;
		op=6'd25;
		#100;
		
		enable = 1;
		a=16'd5;
		b=16'd5;
		op=6'd25;
		#100;
		
		//increment by 1
		enable = 1;
		a=16'd5;
		op=6'd26;
		#100;
		
		enable = 1;
		a=16'd45;
		op=6'd26;
		#100;
		
		//decrement by 1
		enable = 1;
		a=16'd5;
		op=6'd27;
		#100;
		
		enable = 1;
		a=16'd85;
		op=6'd27;
		#100;
		
		//Two's complement
		enable = 1;
		a=16'd5;
		op=6'd28;
		#100;
		
		enable = 1;
		a=16'd75;
		b=16'd28;
		#100;
		
		//push
		enable = 1;
		a=16'd5;
		op=6'd29;
		#100;
		
		enable = 1;
		a=16'd365;
		op=6'd29;
		#100;
		
		enable = 1;
		a=16'd2;
		op=6'd29;
		#100;
		
		//pop
		enable = 1;
		op=6'd30;
		#100;
		
		enable = 1;
		op=6'd30;
		#100;
		
		//clear stack
		enable = 1;
		op=6'd33;
		#100;
		
		enable = 1;
		op=6'd30;
		#100;
		
		// unknown opcode
		enable = 1;
		op=6'd34;
		#100;
	end
      
endmodule

