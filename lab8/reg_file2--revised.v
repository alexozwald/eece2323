`timescale 1ns / 1ps

module reg_file(
	input clk, rst,
	input wr_en, // write enable
	input [1:0] rd0_addr, rd1_addr, // read addrs
	input [1:0] wr_addr, // write addr
	input [8:0] wr_data, //write data
	output [8:0] rd0_data, rd1_data); // read data

	reg [8:0] mem[3:0];
	integer i;

	assign rd0_data = mem[rd0_addr];
	assign rd1_data = mem[rd1_addr];

	always@(posedge clk)
	begin
		if(rst)
			for (i=0; i<4; i=i+1)
				mem [i] <= 0;
		else if(wr_en)
			begin
				mem[wr_addr] <= wr_data;
			end
	end

endmodule
