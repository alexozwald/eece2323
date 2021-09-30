`timescale 1ns / 1ps

module alu_reg_file_tb();
	
	reg rst, clk, wr_en, ALUsrc1, ALUsrc2;
	reg [1:0] rd0_addr, rd1_addr, wr_addr;
	reg [2:0] ALUop;
	reg [7:0] Instr_i;
	reg [8:0] wr_data;
	wire ovf, take_branch;
	wire [7:0] result, input_1, input_2;
	wire [8:0] rd0_data, rd1_data, ReadData1, ReadData2;


	alu_regfile uut(
		.ReadData1(ReadData1),
		.ReadData2(ReadData2),
		.ALUsrc1(ALUsrc1),
		.ALUsrc2(ALUsrc2),
		.ALUop(ALUop),
		.Instr_i(Instr_i), // BREAK

		.rst(rst),
		.clk(clk),
		.wr_en(wr_en),
		.rd0_addr(rd0_addr),
		.rd1_addr(rd1_addr),
		.wr_addr(wr_addr),
		.wr_data(wr_data), // BREAK

		.input_1(input_1),
		.input_2(input_2),
		.result(result),
		.ovf(ovf),
		.take_branch(take_branch));

	reg_file reg_file_tb(rst,clk,wr_en,rd0_addr,rd1_addr,wr_addr,wr_data,rd0_data,rd1_data);

	// 1) Initial pulse for rst (reset)
	initial
	begin 
		#0  rst = 0;
		#5  rst = 1;
		#5  rst = 0;  // semicolon after #10 ???
	end

	// 2) Clock signal
	initial
	begin
		#0 clk  = 1;
		forever #5  clk = ~clk;
	end

	// 3) All Other Tests
	initial
	begin

		ALUsrc1=0; ALUsrc2=0;  // ReadData1 && ReadData2
		 ALUop = 3'b000; // a + b;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd1;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd2;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd3;
		#10 wr_en = 0;	rd0_addr = 0;	rd1_addr = 1;
		#10 wr_en = 0;	rd0_addr = 2;	rd1_addr = 3;

		 ALUop = 3'b001; // ~b;
		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd20;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd21;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd22;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd23;
		#10 wr_en = 0;	rd0_addr = 0;	rd1_addr = 1;
		#10 wr_en = 0;	rd0_addr = 2;	rd1_addr = 3;

		 ALUop = 3'b010; // a & b;
		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd175;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd12;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd511;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd255;
		#10 wr_en = 0;	rd0_addr = 1;	rd1_addr = 0;
		#10 wr_en = 0;	rd0_addr = 3;	rd1_addr = 2;

		ALUsrc1=0; ALUsrc2=1; // ReadData1 && Instr_i
		 ALUop = 3'b011; // a | b;
		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd399;
		#10 wr_en = 0;	rd0_addr = 0;	Instr_i = 8'd42;

		 ALUop = 3'b100; // a >>> 1;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd425;
		#10 wr_en = 0;	rd0_addr = 1;	Instr_i = 8'd200;

		 ALUop = 3'b101; // a << 1;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd1;
		#10 wr_en = 0;	rd0_addr = 2;	Instr_i = 8'd23;

		 ALUop = 3'b110; // 0;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd1;
		#10 wr_en = 0;	rd0_addr = 3;	Instr_i = 8'd23;

		#10	ALUsrc1=1; ALUsrc2=0; // zero_register && ReadData2
		 ALUop = 3'b110; // 0;
		#10	Instr_i = 8'd255;

		 ALUop = 3'b111; // 0;
		#10	Instr_i = 8'd255;

		#10 $finish;
		
	end

endmodule
