`timescale 1ns / 1ps

module alu_regfile(
	output [8:0] ReadData1,
	output [8:0] ReadData2,

	input ALUsrc1,
	input ALUsrc2,
	input [2:0] ALUop,
	input [7:0] Instr_i,
	
	input rst,
	input clk,
	input wr_en,
	input [1:0] rd0_addr,
	input [1:0] rd1_addr,
	input [1:0] wr_addr,
	input [8:0] wr_data,
	
	output [7:0] input_1,
	output [7:0] input_2,
	output [7:0] result,
	output ovf,
	output take_branch);

	reg_file reg_file(
		.rst(rst),
		.clk(clk),
		.wr_en(wr_en),
		.rd0_addr(rd0_addr),
		.rd1_addr(rd1_addr),
		.wr_addr(wr_addr),
		.wr_data(wr_data),
		.rd0_data(ReadData1),
		.rd1_data(ReadData2));
	
	// Initialize ALU & properly link comopnents
	eightbit_alu eightbit_alu(
		.a(input_1),
		.b(input_2),
		.sel(ALUop),
		.f(result),
		.ovf(ovf),
		.take_branch(take_branch));

	assign input_1 = ALUsrc1 ? 8'b00000000 : ReadData1;
	assign input_2 = ALUsrc2 ? Instr_i : ReadData2;

endmodule
