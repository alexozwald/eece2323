`timescale 1ns / 1ps

module data_memory(
	//inputs
	input rst, // rst=reset OR clr=clear
	input clk,
	input write_enable,
	input [7:0] addr,
	input [8:0] write_data,
	output reg [8:0] read_data);

	reg [8:0] MEM[31:0];	// shrunk from 256-bit depth for fpga
	integer i;

	always@(posedge clk)
	begin
		// reset
		if (rst) begin
			for (i=0; i<32; i=i+1)	// shrunk from 256-bit depth for fpga
				MEM [i] = 0;
		end
		// write
		else if (write_enable) begin
			MEM[addr] <= write_data;
		end
		// read
		else begin
				read_data <= MEM[addr];
		end
	end

endmodule
