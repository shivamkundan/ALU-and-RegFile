//Shivam Kundan
//ECE329, Spring 2016
//Lab6, ALU File

/*This program implements an ALU with two 32-bit inputs, one 32-bit output, and a 4-bit opcode.*/

module ALU(clk,opcode,input1,input2,result);

input clk;
input [31:0]input1,input2;
input [3:0]opcode;
reg [31:0]Out;		//Internal register
output reg [31:0]result;

always@(posedge clk)
begin
	
	//Out is initially 0
	Out <= 32'b00000000000000000000000000000000;

	//Check for opcode
	case (opcode)
	0: Out <= (input1&input2);	//AND
	1: Out <= (input1|input2);	//OR
	2: Out <= (input1+input2);	//Add
	6: Out <= (input1-input2);	//Sub
	7: begin 						//Less than
		if(input1>input2) Out<=input2;
		else Out<=input1;
		end
	12: Out<=~(input1|input2);	//NOR
	13: Out<=~(input1&input2);	//NAND
	default: Out <= (input1);	//Useful for checking result of write operation
	endcase
	
	//Assign ouput to result
	result=Out;
end
endmodule
