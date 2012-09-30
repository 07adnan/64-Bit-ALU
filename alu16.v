`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: CMR Institute of Technology 
// Engineer: Adnan Khan
// 
// Create Date:    11:51:44 10/09/2010 
// Design Name:    v5
// Module Name:    alu16 
// Project Name:   A 16 bit unsigned integer simple alu
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
module alu16(a, b, c, op, enable, flags);
	input [16:1] a;// 1st signal
   input [16:1] b;// 2nd signal
   input [6:1] op;// opcode operation to be performed
	input enable;
	output [32:1] c;// output signal
	output [7:1] flags;
	integer i;
	reg [32:1] temp;
	reg [16:1] stack [32:1];//stack - 32 register of width 16 bit
	reg [32:1] p_rom [4:1] [4:1];//rom created for power function ** 16x16 register of width 32 bits
	reg [32:1] d_rom [4:1] [4:1];//rom created for division function ** 16x16 register of width 32 bits
	reg [32:1] m_rom [4:1] [4:1];//rom created for modulo function ** 16x16 register of width 32 bits
	reg [4:1] tos = 1;
	reg [32:1] c;
	reg [7:1] flags;   /*flags [1] - overflow flag
							   flags [2] - divide by zero flag 
							   flags [3] - zero flag 
							   flags [4] - carry/borrow flag
								flags [5] - stack overflow flag
								flags [6] - stack underflow flag
								flags [7] - counter exceed flag*/
								
	initial
		begin
		d_rom[1][1]=16'd1;
		d_rom[1][2]=16'd0;
		d_rom[1][3]=16'd0;
		d_rom[1][4]=16'd0;
		d_rom[2][1]=16'd2;
		d_rom[2][2]=16'd1;
		d_rom[2][3]=16'd0;
		d_rom[2][4]=16'd0;
		d_rom[3][1]=16'd3;
		d_rom[3][2]=16'd1;
		d_rom[3][3]=16'd1;
		d_rom[3][4]=16'd0;
		d_rom[4][1]=16'd4;
		d_rom[4][2]=16'd2;
		d_rom[4][3]=16'd1;
		d_rom[4][4]=16'd1;
		m_rom[1][1]=16'd0;
		m_rom[1][2]=16'd1;
		m_rom[1][3]=16'd1;
		m_rom[1][4]=16'd1;
		m_rom[2][1]=16'd0;
		m_rom[2][2]=16'd0;
		m_rom[2][3]=16'd2;
		m_rom[2][4]=16'd1;
		m_rom[3][1]=16'd0;
		m_rom[3][2]=16'd1;
		m_rom[3][3]=16'd0;
		m_rom[3][4]=16'd3;
		m_rom[4][1]=16'd0;
		m_rom[4][2]=16'd0;
		m_rom[4][3]=16'd1;
		m_rom[4][4]=16'd0;
		p_rom[1][1]=16'd1;
		p_rom[1][2]=16'd1;
		p_rom[1][3]=16'd1;
		p_rom[1][4]=16'd1;
		p_rom[2][1]=16'd2;
		p_rom[2][2]=16'd4;
		p_rom[2][3]=16'd8;
		p_rom[2][4]=16'd16;
		p_rom[3][1]=16'd3;
		p_rom[3][2]=16'd9;
		p_rom[3][3]=16'd27;
		p_rom[3][4]=16'd81;
		p_rom[4][1]=16'd4;
		p_rom[4][2]=16'd16;
		p_rom[4][3]=16'd64;
		p_rom[4][4]=16'd256;
		flags = 7'd0;
		end
		always @ (a,b,op,enable)
				begin
				flags[3:1] = 3'd0;
				flags[7:5] = 3'd0;/*if addition is done before any other operation , and if overflow is 1 same remain even in multiplication
				             , leading to confusion as to overflow is there osr not , hence ressetting all flags are each operation,
								 carry flag is not made zero, because its used in command such as addc(add with carry) and subc,
								 rotate left or right through carry*/
				c = 32'd0;//multiplication done prior to any other operation,17 to 32 are 1 and remain 1, giving wrong result
				temp = 32'd0;// same as above, to prevent any wrong results
				if (enable == 1)//checking if enable  is 1
					begin
						case(op)
								//no operation,provides delay
								6'd0:begin
									for(i=0;i<=1000;i=i+1)
									temp[1] = temp[1] + 1'b1; 
								end
								//addition
								6'd1:begin
									{flags[4],c[16:1]}=a+b;
									flags[1]=flags[4];//checking for overflow
								end
								//subtraction
								6'd2:begin
									{flags[4],c[16:1]}=a-b;
									flags[1]=flags[4];
								end
								//addition with carry
								6'd3:begin
									{flags[4],c[16:1]}=a+b+flags[4];
									flags[1]=flags[4];
								end
								//subtraction with borrow
								6'd4:begin
									{flags[4],c[16:1]}=a-b-flags[4];
									flags[1]=flags[4];
								end
								//multiplication
								6'd5:c=a*b;
								//division
								6'd6:begin
										if(b==16'd0)//checking for divide by zero
										flags[2]=1'b1;//true - making divide by zero flag 1
										else if ( a >4 | b>4)
										flags[1]=1'b1;
										else
										c = d_rom[a][b];
								end
								// modulus or remainder
								6'd7:begin
								if(b==16'd0)//checking for divide by zero
										flags[2]=1'b1;//true - making divide by zero flag 1
										else if ( a >4 | b>4)
										flags[1]=1'b1;
										else
										c = m_rom[a][b];
								end
								// power,maximum of 
								6'd8:begin
									if ( a >4 | b>4)
									flags[1]=1'b1;
									else
									c = p_rom[a][b];
								end
								// invert operation -  takes only one input a
								6'd9:c=~a;
								// Or operation
								6'd10:c=a|b;
								// and operation
								6'd11:c=a&b;
								// xor operation
								6'd12:c=a^b;
								// nor operation
								6'd13:c[16:1]=~(a|b);
								// nand operation
								6'd14:c[16:1]=~(a&b);
								//xnor operation
								6'd15:c[16:1]=~(a^b);
								// left shift
								6'd16:begin
									if(b == 16'd0) c = a << 0;
									else if(b == 16'd1) c = a << 1;
									else if(b == 16'd2) c = a << 2;
									else if(b == 16'd3) c = a << 3;
									else if(b == 16'd4) c = a << 4;
									else if(b == 16'd5) c = a << 5;
									else if(b == 16'd6) c = a << 6;
									else if(b == 16'd7) c = a << 7;
									else if(b == 16'd8) c = a << 8;
									else if(b == 16'd9) c = a << 9;
									else if(b == 16'd10) c = a << 10;
									else if(b == 16'd11) c = a << 11;
									else if(b == 16'd12) c = a << 12;
									else if(b == 16'd13) c = a << 13;
									else if(b == 16'd14) c = a << 14;
									else if(b == 16'd15) c = a << 15;
									else c = 16'd0;//after b = 15 bits all 'a' terms are shifted and only 0 is left hence not necessaery to shift for b>15 
									end
								// right shift
								6'd17:begin
									if(b == 16'd0) c = a << 0;
									else if(b == 16'd1) c = a >> 1;
									else if(b == 16'd2) c = a >> 2;
									else if(b == 16'd3) c = a >> 3;
									else if(b == 16'd4) c = a >> 4;
									else if(b == 16'd5) c = a >> 5;
									else if(b == 16'd6) c = a >> 6;
									else if(b == 16'd7) c = a >> 7;
									else if(b == 16'd8) c = a >> 8;
									else if(b == 16'd9) c = a >> 9;
									else if(b == 16'd10) c = a >> 10;
									else if(b == 16'd11) c = a >> 11;
									else if(b == 16'd12) c = a >> 12;
									else if(b == 16'd13) c = a >> 13;
									else if(b == 16'd14) c = a >> 14;
									else if(b == 16'd15) c = a >> 15;
									else c = 16'd0;//after b = 15 bits all 'a' terms are shifted and only 0 is left hence not necessaery to shift for b>15
								end
								//concatennation , since op is 32 bit and inputs are 16 bit , its possible to implement this feature
								6'd18:c={a,b};
								//Mux,a is input has 16 bits, so selects line is B is 4 bits, so max of d16, cout 1st bit is output
								//i.e c[1] (16:1 Mux)
								6'd19:begin
									mux4(a[4:1],b[2:1],temp[1]);
									mux4(a[8:5],b[2:1],temp[2]);
									mux4(a[12:9],b[2:1],temp[3]);
									mux4(a[16:13],b[2:1],temp[4]);
									mux4(temp[4:1],b[4:3],c[1]);
								end
								//Demux, output is 32 bits so, a[1] is the input , the select lines are b, can be max of 5 bits(1:32 demux)
								6'd20:begin
									demux2(a[1],b[5],temp[2:1]);
									demux4(temp[1],b[4:3],temp[6:3]);
									demux4(temp[2],b[4:3],temp[10:7]);
									demux4(temp[3],b[2:1],c[4:1]);
									demux4(temp[4],b[2:1],c[8:5]);
									demux4(temp[5],b[2:1],c[12:9]);
									demux4(temp[6],b[2:1],c[16:13]);
									demux4(temp[7],b[2:1],c[20:17]);
									demux4(temp[8],b[2:1],c[24:21]);
									demux4(temp[9],b[2:1],c[28:25]);
									demux4(temp[10],b[2:1],c[32:29]);
								end
								//Encoder, c is output with 32bits so max input is 5 bits which is 'a',(5:32 encoder)
								6'd21:begin
									if(a[5:1] == 5'd0 ) c = 32'h00000001;     // line 1 is high(1)
									else if(a[5:1] == 5'd1) c = 32'h00000002; // line 2 is high(1)
									else if(a[5:1] == 5'd2) c = 32'h00000004; // line 3 is high(1)
									else if(a[5:1] == 5'd3) c = 32'h00000008; // line 4 is high(1)
									else if(a[5:1] == 5'd4) c = 32'h00000010; // line 5 is high(1)
									else if(a[5:1] == 5'd5) c = 32'h00000020; // line 6 is high(1)
									else if(a[5:1] == 5'd6) c = 32'h00000040; // line 7 is high(1)
									else if(a[5:1] == 5'd7) c = 32'h00000080; // line 8 is high(1)
									else if(a[5:1] == 5'd8) c = 32'h00000100; // line 9 is high(1)
									else if(a[5:1] == 5'd9) c = 32'h00000200; // line 10 is high(1)
									else if(a[5:1] == 5'd10) c = 32'h00000400;// line 11 is high(1)
									else if(a[5:1] == 5'd11) c = 32'h00000800;// line 12 is high(1)
									else if(a[5:1] == 5'd12) c = 32'h00001000;// line 13 is high(1)
									else if(a[5:1] == 5'd12) c = 32'h00002000;// line 14 is high(1)
									else if(a[5:1] == 5'd14) c = 32'h00004000;// line 15 is high(1)
									else if(a[5:1] == 5'd15) c = 32'h00008000;// line 16 is high(1)
									else if(a[5:1] == 5'd16) c = 32'h00010000;// line 17 is high(1)
									else if(a[5:1] == 5'd17) c = 32'h00020000;// line 18 is high(1)
									else if(a[5:1] == 5'd18) c = 32'h00040000;// line 19 is high(1)
									else if(a[5:1] == 5'd19) c = 32'h00080000;// line 20 is high(1)
									else if(a[5:1] == 5'd20) c = 32'h00100000;// line 21 is high(1)
									else if(a[5:1] == 5'd21) c = 32'h00200000;// line 22 is high(1)
									else if(a[5:1] == 5'd22) c = 32'h00400000;// line 23 is high(1)
									else if(a[5:1] == 5'd23) c = 32'h00800000;// line 24 is high(1)
									else if(a[5:1] == 5'd24) c = 32'h01000000;// line 25 is high(1)
									else if(a[5:1] == 5'd25) c = 32'h02000000;// line 26 is high(1)
									else if(a[5:1] == 5'd26) c = 32'h04000000;// line 27 is high(1)
									else if(a[5:1] == 5'd27) c = 32'h08000000;// line 28 is high(1)
									else if(a[5:1] == 5'd28) c = 32'h10000000;// line 29 is high(1)
									else if(a[5:1] == 5'd28) c = 32'h20000000;// line 30 is high(1)
									else if(a[5:1] == 5'd30) c = 32'h40000000;// line 31 is high(1)
									else if(a[5:1] == 5'd31) c = 32'h80000000;// line 32 is high(1)
									else c = 32'dz;
								end
								// decoder , since a is 16 bit only , the max i.e c can be only 4 bits(16:4 decoder)
								6'd22:begin
									if(a[16:1] == 16'h0001) c = 32'd0;
									else if(a[16:1] == 16'h0002) c = 32'd1;
									else if(a[16:1] == 16'h0004) c = 32'd2;
									else if(a[16:1] == 16'h0008) c = 32'd3;
									else if(a[16:1] == 16'h0010) c = 32'd4;
									else if(a[16:1] == 16'h0020) c = 32'd5;
									else if(a[16:1] == 16'h0040) c = 32'd6;
									else if(a[16:1] == 16'h0080) c = 32'd7;
									else if(a[16:1] == 16'h0100) c = 32'd8;
									else if(a[16:1] == 16'h0200) c = 32'd9;
									else if(a[16:1] == 16'h0400) c = 32'd10;
									else if(a[16:1] == 16'h0800) c = 32'd11;
									else if(a[16:1] == 16'h1000) c = 32'd12;
									else if(a[16:1] == 16'h2000) c = 32'd13;
									else if(a[16:1] == 16'h4000) c = 32'd14;
									else if(a[16:1] == 16'h8000) c = 32'd15;
									else c = 32'dz;
								end
								//counter, a is the initial value ,b is no of counts , since b is 16bits hence max count of 65536
								6'd23:begin
									temp[16:1] = a;
									if ( b > 16 )
									flags[7] = 1'b1;
									else
										begin
											for ( i=0 ;i < 16 ; i= i+1 )
											begin
											if ( i == b)
											c[16:1] = temp[16:1];
											temp[16:1] = temp[16:1] + 16'd1;
											end
										end
								end
								//clear carry flag
								6'd24:flags[4]=1'b0;
								//Compare two operands a & b , cout[2:1] = 01 (a==b), c[2:1] = 10(a>b) , c[2:1] == 11(a<b)
								6'd25:begin
									if(a==b)
										c[2:1] = 2'b01;
									else if (a>b)
										c[2:1] = 2'b10;
									else
										c[2:1] = 2'b11;
								end
								//Increment by 1
								6'd26:begin
									{flags[4],c[16:1]} = a+1;//carry flag + c
									flags[1]=flags[4];//checking for overflow
								end
								//Decrement by 1
								6'd27:begin
									{flags[4],c[16:1]} = a-1;//carry flag + c
									flags[1]=flags[4];//checking for underflow
								end
								//Two complement , input is 'a'
								6'd28:begin
									{flags[4],c[16:1]} = (~a)+1;
									flags[1]=flags[4];//checking for overflow
								end
								//push
								6'd29:begin
									if ( tos > 16)
										flags[5] = 1'b1;
									else if ( tos < 1)
										flags[6] = 1'b1;
									else
										begin
										stack[tos][16:1]=a;
										tos=tos+4'd1;
										end
								end
								//pop
								6'd30:begin
									if ( tos > 16)
										flags[5] = 1'b1;
									else if ( tos < 1)
										flags[6] = 1'b1;
									else
										begin
										tos=tos-4'd1;
										c[16:1]=stack[tos][16:1];
										end
								end
								// clear stack
								6'd32:tos=1;
								// any other unknown op
								default:c=32'dz;
						endcase
					end
				else
					begin	 
						c=32'dz;
				   end
				// if(enable) statement ends
				// checking if output is zero then making zero flag 1
				if (c==0)
					flags[3]=1'b1;
			end
		
			
	task mux4;
	input [4:1] in;
	input [2:1] sel;
	output op;
	begin
	op = (in[1]& ~sel[2] & ~sel[1])|(in[2]&~sel[2]&sel[1])|(in[3]&sel[2]&~sel[1])|(in[4]&sel[2]&sel[1]);
	end
	endtask
	
	task demux4;
	input in;
	input [2:1] sel;
	output [4:1] op;
	begin
	op[1] = (in&~sel[2]&~sel[1]);
	op[2] = (in&~sel[2]&sel[1]);
	op[3] = (in&sel[2]&~sel[1]);
	op[4] = (in&sel[2]&sel[1]);
	end
	endtask
	
	task demux2;
	input in;
	input sel;
	output [2:1] op;
	begin
	op[1] = (in&~sel);
	op[2] = (in&sel);
	end
	endtask
	

endmodule