//Shivam Kundan
//ECE329, Spring 2016
//Lab6, Register Fle


//This program implements a 32x32bit register file. 

module RegFile(read1,read2,write_reg, write_data, write_en, clk,data_out_1,data_out_2);

input clk, write_en;
input [4:0] read1,read2,write_reg;
input [31:0] write_data;
reg [31:0] reg_internal [31:0]; //Internal registers.
output reg [31:0]data_out_1,data_out_2;
integer i;	//Used for initializing registers

always@(posedge clk)
begin

	//All registers contain i initially
	for(i=0;i<32;i=i+1)
	begin
	reg_internal[i]=i;
	end
	
	//Write Operation
	if (write_en)
	begin
		reg_internal[write_reg] = write_data;
		data_out_1 = reg_internal[write_reg];					//data_out_1 outputs value written to register
		data_out_2 = 32'b00000000000000000000000000000000;	//Set to 0 for write operation
	end
	
	//Read Operation
	else
	begin
		data_out_1 = reg_internal[read1];
		data_out_2 = reg_internal[read2];
	end	
		
end
endmodule