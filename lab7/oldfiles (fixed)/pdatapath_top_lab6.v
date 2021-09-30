`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Majid Sabbagh (sabbagh.m@husky.neu.edu)
// 
// Create Date: 08/17/2014 02:18:36 PM
// Design Name: 
// Module Name: eightbit_alu_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module pdatapath_top(
		input wire clk,
		input wire top_pb_clk,
		input wire rst_general,
		output [7:0] led
	);

	wire [7:0] alu_1st_input, alu_2nd_input;
	wire [7:0] alu_output;
	wire [2:0] ALUOp;
	wire       alu_ovf_flag;
	wire       alu_take_branch_output;
	
	wire [15:0] instruction;
	//insturction fields
	wire [3:0] opcode;
	wire [1:0] rs_addr;
	wire [1:0] rt_addr;
	wire [1:0] rd_addr;
	wire [7:0] immediate;
	//control signals
	wire RegDst;
	wire RegWrite;
	wire ALUSrc1;
	wire ALUSrc2;
	wire MemWrite;
	wire MemToReg;

	wire [1:0] regfile_write_address;//destination register address
	wire [8:0] regfile_write_data;//result data
	wire [8:0] read_data1;//source register1 data
	wire [8:0] read_data2;//source register2 data

	wire [8:0] alu_result;
	wire [8:0] zero_register;
	wire [8:0] data_mem_out;

	wire pb_clk_debounced;

	
	assign alu_result = {alu_ovf_flag, alu_output};
	assign led = alu_result;
	debounce debounce_clk(
		.clk_in(clk),
		.rst_in(rst_general),
		.sig_in(top_pb_clk),
		.sig_debounced_out(pb_clk_debounced)
	);
	
	
	//Instantiate Your instruction decoder here
	decoder decode (
		.instruction(instruction),
		.opcode(opcode),
		.rs_addr(rs_addr),
		.rt_addr(rt_addr),
		.rd_addr(rd_addr),
		.immediate(immediate),
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc1(ALUSrc1),
		.ALUSrc2(ALUSrc2),
		.ALUOp(ALUOp),
		.MemWrite(MemWrite),
		.MemToReg(MemToReg)
		);

 
	//Instantiate Your alu-regfile here
	alu_regfile ALU_RegFile (
		.ReadData1(read_data1),
		.ReadData2(read_data2),
		.ALUsrc1(ALUSrc1),
		.ALUsrc2(ALUSrc2),
		.ALUop(ALUOp),
		.Instr_i(immediate),
		.zero_register(zero_register),

		.rst(rst_general),
		.clk(pb_clk_debounced),
		.wr_en(RegWrite),
		.rd0_addr(rs_addr),
		.rd1_addr(rt_addr),
		.wr_addr(regfile_write_address),
		.wr_data(regfile_write_data),

		.input_1(alu_1st_input),
		.input_2(alu_2nd_input),
		.result(alu_result),
		.ovf(alu_ovf_flag),
		.take_branch(alu_take_branch_output)
		);

	//Instantiate Your data memory here
	data_memory datamem (
		.rst(rst_general),
		.clk(pb_clk_debounced),
		.write_enable(MemWrite),
		.addr(alu_output),  // ALU_RESULT or ALU_OUTPUT ??
		.write_data(read_data2),
		.read_data(data_mem_out)
		);
	
	//Mux for regfile_write_data (MemToReg)
	assign regfile_write_data = MemToReg ? data_mem_out : alu_result;
	
	//Mux for regfile_write_address (RegDst)
	assign regfile_write_address = RegDst ? rt_addr : rd_addr;
	
	//Instantiate Your VIO core here
	vio_0 vio (
		.clk(clk),							//inputwireclk

		.probe_in0(regfile_write_data),		//[8:0]WriteData
		.probe_in1(read_data1),				//[7:0]ReadData1
		.probe_in2(read_data2),				//[7:0]ReadData2
		.probe_in3(alu_1st_input),			//[7:0]input1
		.probe_in4(alu_2nd_input),			//[7:0]input2
		.probe_in5(alu_take_branch_output),	//[0:0]take_branch
		.probe_in6(alu_ovf_flag),			//[0:0]alu_ovf
		.probe_in7(opcode),					//[3:0]opcode
		.probe_in8(alu_output),				//[7:0]alu_out
		.probe_in9(data_mem_out),			//[8:0]DataMemOut

		.probe_out0(instruction)            //[15:0]instruction
		);

endmodule
