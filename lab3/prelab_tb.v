`timescale 1ns / 10ps

module alu_unit_tb ();
	// Inputs
	reg signed [7:0] a;
	reg signed [7:0] b;
	reg [2:0] sel;
	// Outputs
	wire signed [7:0] f;
	wire ovf;
	wire take_branch;

	// Initiate the Unit Under Test (UUT)
	eightbit_alu uut (
		.a(a),
		.b(b),
		.sel(sel),
		.f(f),
		.ovf(ovf),
		.take_branch(take_branch));

	// Initialize Inputs (stimulus)
	initial
	begin
		#0
		sel = 3'b000;
		repeat (8)
		begin
			a = 8'b00000000;  b = 8'b00000000;  #10; // 0	0
			a = 8'b00000001;  b = 8'b11111111;  #10; // 1	-1
			a = 8'b10101010;  b = 8'b10101010;  #10; // -86	-86
			a = 8'b10101010;  b = 8'b01010101;  #10; // -86	85
			a = 8'b01100100;  b = 8'b01100100;  #10; // 100	100
			sel = sel + 1;
		end
	end

endmodule
