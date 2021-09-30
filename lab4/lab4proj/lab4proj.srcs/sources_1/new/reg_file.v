`timescale 1ns / 1ps

module reg_file(
	//inputs
	input rst, // rst=reset OR clr=clear
	input clk,
	input wr_en,
	input [1:0] rd0_addr,
	input [1:0] rd1_addr,
	input [1:0] wr_addr,
	input [8:0] wr_data, //piped from ALU
	//outputs
	output reg [8:0] rd0_data,
	output reg [8:0] rd1_data);

	reg [8:0] mem[3:0];
	integer i;

	always@(negedge clk)
	begin
		if(rst)
			for (i=0; i<4; i=i+1)
				mem [i] = 0;
		else if(wr_en)
			mem[wr_addr] = wr_data;
		else
		  begin
            rd0_data = mem[rd0_addr];
            rd1_data = mem[rd1_addr];		
		  end
	end

endmodule
