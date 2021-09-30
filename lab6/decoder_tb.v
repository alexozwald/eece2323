module decoder_tb();

	// inputs
	reg [15:0] instruction;
	// outputs
	wire [3:0] opcode;
	wire [1:0] rs_addr, rt_addr, rd_addr;
	wire [7:0] immediate;
	wire [2:0] ALUOp;
	wire RegDst, RegWrite, ALUSrc1, ALUSrc2, MemWrite, MemToReg;


	decoder uut (
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
		.MemToReg(MemToReg));


	initial
	begin
		instruction = 16'b0000_01_10_00_010000;#10; // load reg[1] <= mem[2+0x10]
		instruction = 16'b0001_01_10_00_010001;#10; // store mem[2+0x11] <= reg[1]
		instruction = 16'b0010_00_01_10_000000;#10; // add reg[2] <= reg[0] + reg[1]
		instruction = 16'b0011_00_11_01_000000;#10; // addi reg[3] <= reg[0] + 0x40
		instruction = 16'b0100_00_01_10_000000;#10; // inv reg[2] <= ~reg[1]
		instruction = 16'b0101_00_01_10_000000;#10; // and reg[2] <= reg[0] & reg[1]
		instruction = 16'b0110_01_11_00_001111;#10; // andi reg[3] <= reg[1] & 0xF
		instruction = 16'b0111_00_01_10_000000;#10; // or reg[2] <= reg[0] | reg[1]
		instruction = 16'b1000_01_11_11_110000;#10; // ori reg[3] <= reg[1] | 0xF0
		instruction = 16'b1001_01_11_00_000011;#10; // sra reg[3] <= reg[1] << 0x3;
		instruction = 16'b1010_01_11_00_000001;#10; // sll reg[3] <= reg[1] >>> 0x1;
		instruction = 16'b1011_00_10_01_000000;#10; // beq pc+0x40 <= reg[0] == reg[2]
		instruction = 16'b1100_00_10_01_000000;#10; // bne pc-0xC0 <= reg[0] != reg[2]
		instruction = 16'b1101_00_11_00_000000;#10; // clr reg[3] <= 0
		$finish;
		$monitor("%d instruction=%h opcode=%b immediate=%h rs_addr=%h rt_addr=%h rd_addr=%h | RegWrite=%d RegDst=%d ALUSrc1=%d ALUSrc2=%d ALUOp=%d MemWrite=%d MemToReg=%d",
			$time, instruction, opcode, immediate, rs_addr, rt_addr, rd_addr, RegWrite, RegDst, ALUSrc1, ALUSrc2, ALUOp, MemWrite, MemToReg);
	end

endmodule
