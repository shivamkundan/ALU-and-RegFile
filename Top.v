//Shivam Kundan
//ECE329, Spring 2016
//Lab6, Top Module

/*Top module for simplified MIPS datapath.*/

module Lab6_Top(
    input [31:0] inst,	//32-bit instruction
	 input clk
    );
	 
wire [31:0]res, dout1,dout2;

//Instantiate register file
RegFile Reg0 (
	.clk(clk),
	.write_en(inst[30]),
	.read1(inst[25:21]),
	.read2(inst[20:16]),
	.write_data (res),
	.write_reg(inst[15:11]),
	.data_out_1(dout1),
	.data_out_2(dout2)
	);
	
//Instantiate ALU
ALU A0 (
	.clk(clk),
	.input1(dout1),
	.input2(dout2),
	.opcode(inst[29:26]),
	.result(res)
	);
	
endmodule
