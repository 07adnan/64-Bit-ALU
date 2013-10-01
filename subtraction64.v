task subtraction64;
input [63:0]a,b;
input carry_in;
output [63:0] c;

begin
{carry_out,c[63:0]}=a-b-carry_in;
end
endtask