<html>

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=Generator content="Microsoft Word 14 (filtered)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{font-size:10.0pt;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

</head>

<body lang=EN-GB>

<div class=WordSection1>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:26.0pt;line-height:115%;color:#4BACC6'>FAQ</span></b></p>

<p class=MsoNormal style='text-align:justify'>The ALU is a combinational logic
unit. It takes two inputs of 16 bits wide and performs Logic and Arithmetic�s
operations. The logic and arithmetic are operated depending on the 5-bit
ALU_opcode signal. The logic operations involve bit -wise and, bit-wise or, and
bit-wise xor, bit-wise xnor, bit-wise nand, bit-wise nor, left/right shift
operations. The Arithmetic�s operations involve addition, subtraction, addition
with carry, subtraction with carry, multiplication , division, modulo,
power,16:1 mux,32:1 demux,5:32 encoder,16:4 decoder,16 bit counter.</p>

<p class=MsoNormal style='text-align:justify'>There are two outputs from ALU:
32-bit output c and 7-bit Flag signals. The 32-bit Output is the result
depending on the operation of 16bit operand A, 16 bit operand B, 6bit opcode
and enable. The 7-bit Flag_ signals support every conditional instruction. </p>

<p class=MsoNormal style='text-align:justify'>To understand the design of the
ALU better, we will see the basic block diagram, which gives a fair idea about
the inputs and outputs.</p>

<p class=MsoNormal style='text-align:justify'>The ALU designed in this project
performs the following arithmetic operations and can be enlisted as</p>

<p class=MsoNormal><b><span style='font-size:18.0pt;line-height:115%'>Functions</span></b></p>

<p class=MsoNormal style='text-align:justify'>1.� <b>Addition:</b> The addition
operation performs the sum of two inputs that are 16 bits wide and in this case
these are A operand and B operand and the result in 16 bits wide output. The
flags that are affected are overflow flag and carry flag that is bit 1 of the
flag register. The flag are set when the sum result of both inputs exceeds the
size of that of the resultant location.</p>

<p class=MsoNormal style='text-align:justify'>2.� <b>Subtraction:</b> The
subtraction operation performs the difference of two inputs that are 16 bits
wide and the result in 16 bits wide output. The flags that are affected are
overflow flag and borrow flag that is bit 1 of the flag register. The flag are
set when the sum result of both inputs exceeds the size of that of the
resultant location. </p>

<p class=MsoNormal style='text-align:justify'>3.� <b>Addition with carry:</b>
This operation performs the addition of two inputs and the result is added with
1 if carry flag is set. The flags that are affected are overflow flag and carry
flag that is bit 1 of the flag register. The flag are set when the sum result
of both inputs exceeds the size of that of the resultant location. </p>

<p class=MsoNormal style='text-align:justify'>4.� <b>Subtraction with borrow:</b>
This operation finds the difference of two 16 bits input and the result is
subtracted by 1 if borrow/carry flag is set. The flags that are affected are
overflow flag and borrow flag that is bit 1 of the flag register. The flag are
set when the sum result of both inputs exceeds the size of that of the
resultant location. </p>

<p class=MsoNormal style='text-align:justify'>5.� <b>Multiplication:� </b>As
the name suggests this following operation performs multiplication of two
numbers that are 16 bits wide.</p>

<p class=MsoNormal style='text-align:justify'>6.� <b>Division:</b> it performs
the division operation either it be dividing the operand a by operand b or the
either way. In case if any of the input is selected as zero either operand a or
operand b, divide by zero is indicated by setting the divide by zero flag that
is the� bit 2 of our flag register to 1.Divison is implemented using ROM. If
the inputs operands are greater than 4, then the overflow flag is set. Else the
value is read from the ROM</p>

<p class=MsoNormal style='text-align:justify'>7.� <b>Modulus:</b> this
operation is done to obtain the remainder only when division operation is
performed is any of the two numbers. In case if any of the input is selected as
zero either operand a or operand b, divide by zero is indicated by setting the
divide by zero flag that is the bit 2 of our flag register to 1.Modulus is
implemented using ROM. If the inputs operands are greater than 4, then the
overflow flag is set. Else the value is read from the ROM</p>

<p class=MsoNormal style='text-align:justify'>8.� <b>Power:</b> this operation
is used for finding the power of a given input .Power is implemented using ROM.
If the inputs operands are greater than 4, then the overflow flag is set. Else
the value is read from the ROM</p>

<p class=MsoNormal style='text-align:justify'>9.� <b>AND: </b>instruction
format � operand a &amp; operand b </p>

<p class=MsoNormal style='text-align:justify'>Function- operand A and operand B
are two 16 bit register inputs. This operator performs the bitwise and
operation and stores the result in register c.</p>

<p class=MsoNormal style='text-align:justify'>10.� <b>OR: </b>instruction
format � operand A ! Operand b</p>

<p class=MsoNormal style='text-align:justify'>Function- this operator performs
the bitwise or operation on two 16 bit input registers and stores the result in
32 bit output register c.</p>

<p class=MsoNormal style='text-align:justify'>11.� <b>INVERT:</b> instruction
format - ~ operand A (~operand B)</p>

<p class=MsoNormal style='text-align:justify'>Function- this operator performs
the bitwise invert operation. As seen from the instruction format any one
operand can be inverted at a time. </p>

<p class=MsoNormal style='text-align:justify'>12.� <b>NOR:</b> instruction
format - ~ (operand A! operand B) </p>

<p class=MsoNormal style='text-align:justify'>Function- This operator performs
bitwise nor operation on two 16 bits input registers.</p>

<p class=MsoNormal style='text-align:justify'>13.� <b>NAND:</b> instruction
format- ~ (operand A &amp; operand B)</p>

<p class=MsoNormal style='text-align:justify'>Function- This operator performs
bitwise nand operation on the inputs and stores the result in register c. As
seen from the instruction format this particular operator performs invert and
then an and function.</p>

<p class=MsoNormal style='text-align:justify'>14.� <b>XOR:</b> instruction
format- operand a ^ operand B</p>

<p class=MsoNormal style='text-align:justify'>Function- operand A and B are two
16 bits registers. This operator performs bitwise xor operation and put the
result output register result.</p>

<p class=MsoNormal style='text-align:justify'>15.� <b>XNOR:</b> instruction
format - ~ (operand A ^ operand B)</p>

<p class=MsoNormal style='text-align:justify'>Function- operand A and operand B
are two input 16 bit registers. This operator performs bitwise xnor operation
and stores the result in output register.</p>

<p class=MsoNormal style='text-align:justify'>16.� <b>Left Shift:</b>���
Operand A is the value which undergoes the left shift depending on the value
indicated by operand b.</p>

<p class=MsoNormal style='text-align:justify'>17.� <b>Right Shift:</b>� Operand
A is the value which undergoes the right shift depending on the value indicated
by operand b.</p>

<p class=MsoNormal style='text-align:justify'>18.� <b>Concatenation:</b> This
function concatenates operand a and operand b.</p>

<p class=MsoNormal style='text-align:justify'>19.� <b>Mux:</b>� A 16:1 mux is
implemented, where a is the input and b[4:1] correspond to the select lines and
c[1] is the output</p>

<p class=MsoNormal style='text-align:justify'>20.� <b>Demux:� </b>A 1:32 demux
is implemented, a[1] is the input, the select lines are b[5:1], can be max of 5
bits</p>

<p class=MsoNormal style='text-align:justify'>21.� <b>Encoder:</b>� A 5:32
binary encoder is a logic circuit that, given a 5-bit input word that contains
one active signal, generates and output word</p>

<p class=MsoNormal style='text-align:justify'>22.� <b>Decoder:</b>�� A 16:4
decoder is implemented, since a is 16 bit only, the output c is 4 bits wide.</p>

<p class=MsoNormal style='text-align:justify'>23.� <b>Counter:</b> Operand A is
taken as the initial value and Operand b is the no of counts, If b exceeds 16,�
counter exceed flags is set and count operation is� skipped else A is
incremented b times.</p>

<p class=MsoNormal style='text-align:justify'>24.� <b>Clear carry flag:</b>
Carry flag in the flag register is cleared.</p>

<p class=MsoNormal style='text-align:justify'>25.� <b>Compare:</b>� This
operation compares operand A and operand B and corresponding signal is
generated.</p>

<p class=MsoNormal style='text-align:justify'>A&gt;B � c[2:1] is set to 01</p>

<p class=MsoNormal style='text-align:justify'>A&lt;B � c[2:1] is set to 10</p>

<p class=MsoNormal style='text-align:justify'>A=B � c[2:1] is set to 11</p>

<p class=MsoNormal style='text-align:justify'>26.� <b>Increment By 1:</b>� The
addition operation performs the sum of operand A and 1and the output is 16 bits
wide. The flags that are affected are overflow flag and carry flag that is bit
1 of the flag register. The flag are set when the sum result of both inputs
exceeds the size of that of the resultant location.</p>

<p class=MsoNormal style='text-align:justify'>27.� <b>Decrement by 1:</b>� The
subtraction operation performs the sum of operand A and </p>

<p class=MsoNormal style='text-align:justify'>1and the output is 16 bits wide. </p>

<p class=MsoNormal style='text-align:justify'>The flags that are affected are
overflow flag and borrow flag that is bit 1 of the flag register. The flag are
set when the sum result of both inputs exceeds the size of that of the
resultant location.</p>

<p class=MsoNormal style='text-align:justify'>28.� <b>Two�s complement:</b>
This function performs two�s complement of operand A.</p>

<p class=MsoNormal style='text-align:justify'>29.� <b>Push:</b>� Operand A is
pushed onto the stack and top of stack (tos) is incremented by 1.</p>

<p class=MsoNormal style='text-align:justify'>30.� <b>Pop:</b>� Top of stack is
decremented by 1 and Operand A is popped of the stack and the output is
available at C.</p>

<p class=MsoNormal style='text-align:justify'>31.� <b>Clear stack:</b> Set�s
the top of stack to 1.</p>

<p class=MsoNormal style='text-align:justify'>If the operand value exceeds 31,
then the output is set as high impedance.� The output C is checked for zero, if
true then the Zero flag in the flag register is set.</p>

<p class=MsoNormal>&nbsp;</p>

<p class=MsoNormal>&nbsp;</p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:16.0pt;line-height:115%'>Flag/Status Register</span></b></p>

<p class=MsoNormal style='text-align:justify'>A Flag Register or status
register also called condition code register (CCR) is a collection of flag bits
for a processor.� Each operation will either set or reset only some flags. The
flag registers which are implemented are shown below.</p>

<p class=MsoNormal>&nbsp;</p>

<table class=MsoTableLightGridAccent3 border=1 cellspacing=0 cellpadding=0
 width="100%" style='width:100.0%;border-collapse:collapse;border:none'>
 <tr>
  <td width="14%" valign=top style='width:14.28%;border:solid #9BBB59 1.0pt;
  border-bottom:solid #9BBB59 2.25pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 7</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Counter
  Exceed Flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.28%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 6</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Stack
  underflow flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.28%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 5</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Stack
  overflow flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.3%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 4</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Carry/Borrow
  flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.28%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 3</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Zero Flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.28%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 2</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Divide by
  zero flag</span></b></p>
  </td>
  <td width="14%" valign=top style='width:14.3%;border-top:solid #9BBB59 1.0pt;
  border-left:none;border-bottom:solid #9BBB59 2.25pt;border-right:solid #9BBB59 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>flag 1</span></b></p>
  <p class=MsoNormal><b><span style='font-family:"Cambria","serif"'>Overflow
  flag</span></b></p>
  </td>
 </tr>
</table>

<p class=MsoNormal>&nbsp;</p>

</div>

</body>

</html>
