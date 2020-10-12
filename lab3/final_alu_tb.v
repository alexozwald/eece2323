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
		sel = 0;
		repeat (8)
		begin
	        a  = -8'd1;	b = -8'd1;		#10;
	        a = 8'd0;	b = 8'd0;		#10;
	        a = -8'd1;	b = 8'd0;		#10;
	        a = 8'd100;	b = 8'd100;		#10;
	        a = -8'd69;	b = -8'd115;	#10;
	        sel = sel + 1;
		end
	end

endmodule
