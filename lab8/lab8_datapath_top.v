`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
// Company: Northeastern University
// 
// Create Date: 10/15/2020 09:47:58 PM
// Module Name: pdatapath_top
/////////////////////////////////////////////////////////////////////

module Lab8_Datapath(
		input wire clk,
		input wire top_pb_clk,
		input wire rst_general,
		output [3:0] disp_en,
		output [6:0] seg7_output
		);
	
	wire [7:0] alu_input1, alu_input2;
	wire [7:0] alu_output;
	wire [2:0] ALUOp;
	wire       alu_ovf;
	wire       take_branch;
	
	
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
	wire [7:0] zero_register;
	wire [8:0] data_mem_out;

	wire pb_clk_debounced;
	wire [7:0] pc;

	assign zero_register = 8'b0;//ZERO constant
	assign alu_result = {alu_ovf, alu_output};


	// Debounce
	debounce debounce_clk(
			.clk_in(clk),
			.rst_in(rst_general),
			.sig_in(top_pb_clk),
			.sig_debounced_out(pb_clk_debounced)
			);

	// 7-Segment display module
	Adaptor_display display(
			.clk(clk), 					// system clock
			.input_value(alu_output),	// 8-bit input [7:0] value to display
			.disp_en(disp_en),			// output [3:0] 7 segment display enable
			.seg7_output(seg7_output));	// output [6:0] 7 segment signals

	/* Instantiate all other modules */
	pc_logic pclogic_branching (
		.clk(pb_clk_debounced),
		.rst(rst_general),
		.take_branch(take_branch),
		.offset(immediate),
		.pc(pc));

	instr_mem (
		.a(pc),					// input wire [7 : 0] a
		.spo(instruction)		// output wire [15 : 0] spo
		);

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

		.input_1(alu_input1),
		.input_2(alu_input2),
		.result(alu_output),
		.ovf(alu_ovf),
		.take_branch(take_branch)
		);

	/*	USING IP INSTEAD FOR FULL 256 DEPTH DESPITE MISSING RESET BTN
	data_memory datamem (
		.rst(rst_general),
		.clk(pb_clk_debounced),
		.write_enable(MemWrite),
		.addr(alu_output),
		.write_data(read_data2),
		.read_data(data_mem_out)
		);
	*/
	data_mem (
		.a(alu_output),				// input wire [7 : 0] a
		.d(read_data2),				// input wire [8 : 0] d
		.clk(pb_clk_debounced),		// input wire clk
		.we(MemWrite),				// input wire we
		.spo(data_mem_out)			// output wire [8 : 0] spo
		);

	assign regfile_write_data = MemToReg ? data_mem_out : alu_result;
	assign regfile_write_address = RegDst ? rt_addr : rd_addr;

	vio_0 vio (
		.clk(clk),							// input wire clk

		.probe_in0(alu_output),				// [7:0] alu_out
		.probe_in1(alu_ovf),				// [0:0] alu_ovf
		.probe_in2(take_branch),			// [0:0] take_branch
		.probe_in3(read_data1),				// [8:0] ReadData1
		.probe_in4(read_data2),				// [8:0] ReadData2
		.probe_in5(alu_input1),				// [7:0] input1
		.probe_in6(alu_input2),				// [7:0] input2
		.probe_in7(regfile_write_data),		// [8:0] WriteData
		.probe_in8(data_mem_out),			// [8:0] DataMemOut
		.probe_in9(opcode),					// [3:0] opcode
		.probe_in10(rs_addr),				// [1:0] rs_addr
		.probe_in11(rt_addr),				// [1:0] rt_addr
		.probe_in12(rd_addr),				// [1:0] rd_addr
		.probe_in13(immediate),				// [7:0] immediate
		.probe_in14(RegDst),				// [0:0] RegDst
		.probe_in15(RegWrite),				// [0:0] RegWrite
		.probe_in16(ALUSrc1),				// [0:0] ALUSrc1
		.probe_in17(ALUSrc2),				// [0:0] ALUSrc2
		.probe_in18(ALUOp),					// [2:0] ALUOp
		.probe_in19(MemWrite),				// [0:0] MemWrite
		.probe_in20(MemToReg),				// [0:0] MemToReg
		.probe_in21(pc),					// [7:0] pc
		.probe_in22(instruction)			// [15:0] instruction
		);

endmodule
