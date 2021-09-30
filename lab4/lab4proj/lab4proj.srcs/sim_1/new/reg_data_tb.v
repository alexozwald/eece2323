`timescale 1ns / 1ps

module reg_file_tb();
	// Inputs
	reg rst, clk, wr_en;
	reg [1:0] rd0_addr, rd1_addr, wr_addr;
	reg [8:0] wr_data; //piped from alu
	// Outputs
	wire [8:0] rd0_data, rd1_data;

	// Initiate the Unit Under Test (UUT)
	reg_file uut (
		.rst(rst),
		.clk(clk),
		.wr_en(wr_en),
		.rd0_addr(rd0_addr),
		.rd1_addr(rd1_addr),
		.wr_addr(wr_addr),
		.wr_data(wr_data), //piped from ALU
		.rd0_data(rd0_data),
		.rd1_data(rd1_data));

	// Initialize Inputs (stimulus)
	initial
	// 1) Initial pulse for rst (clr?)
	begin
		#0
		rst = 0;
		#5
		rst = 1;
		#5
		rst = 0;
	end

	// 2) Clock signal
	initial
	begin
		clk  = 1;
		forever #5  clk = ~clk;
	end

	// 3) Values for other inputs
	initial
	begin
		$monitor("%d  ", $time, , " rst=%b ", rst, " clk=%b ", clk, " wr_en=%b ", wr_en, " rd0_addr=%d ", rd0_addr, " rd1_addr=%d ", rd1_addr, " wr_addr=%d ", wr_addr, " wr_data=%d ", wr_data, " rd0_data=%d ", rd0_data, " rd1_data=%d ", rd1_data);
		#0 // Initially
		rd0_addr = 0;
		rd1_addr = 0;
		wr_en = 0;
		wr_addr = 0;
		wr_data = 9'd0;
        
        // Test Things
		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd0;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd1;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd2;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd3;
		#10 wr_en = 0;	rd0_addr = 0;	rd1_addr = 1;
		#10 wr_en = 0;	rd0_addr = 2;	rd1_addr = 3;
		
		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd20;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd21;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd22;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd23;
		#10 wr_en = 0;	rd0_addr = 0;	rd1_addr = 1;
		#10 wr_en = 0;	rd0_addr = 2;	rd1_addr = 3;

		#10 wr_en = 1;	wr_addr = 0;	wr_data = 9'd175;
		#10 wr_en = 1;	wr_addr = 1;	wr_data = 9'd12;
		#10 wr_en = 1;	wr_addr = 2;	wr_data = 9'd511;
		#10 wr_en = 1;	wr_addr = 3;	wr_data = 9'd255;
		#10 wr_en = 0;	rd0_addr = 1;	rd1_addr = 0;
		#10 wr_en = 0;	rd0_addr = 3;	rd1_addr = 2;
		
		#10 $finish;
	end


endmodule
