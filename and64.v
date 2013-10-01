//module and_64(a,b,c)
	task and64;
	input [63:0]a,b;
	output [63:0]c;
	

	c=a&b;
	endtask
	
//endmodule