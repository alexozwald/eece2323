`timescale 1ns / 1ps

module data_memory(
	//inputs
	input rst, // rst=reset OR clr=clear
	input clk,
	input write_enable,
	input [7:0] addr,
	input [8:0] write_data,
	output reg [8:0] read_data);

	reg [8:0] MEM[7:0];
	integer i;

	always@(addr)
	begin
		if(rst)
			for (i=0; i<128; i=i+1)
				MEM [i] = 0;
		else if(write_enable)
			MEM[addr] = write_data;
		else
			read_data <= MEM[addr];
	end

endmodule
