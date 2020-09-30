`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2018 01:23:31 PM
// Design Name: 
// Module Name: palu_unit_tb
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


module palu_unit_tb ();
	// Inputs
	reg signed [7:0] a;
	reg signed [7:0] b;
	reg [1:0] s;
	// Outputs
	wire signed [7:0] f;
	wire ovf;

	// Initiate the Unit Under Test (UUT)
	eightbit_palu uut (
		.a(a),
		.b(b),
		.s(s),
		.f(f),
		.ovf(ovf));

	// Initialize Inputs (stimulus)
	initial
	begin
		#0
		a = 8'd0;  b = 8'd0;  s = 0;  #10;
		a = 8'd5;  b = 8'd6;  s = 0;  #10;
		a = -8'd100;  b = 8'd25;  s = 0;  #10;
		a = 8'd100;  b = 8'd100;  s = 0;  #10;
		a = -8'd100;  b = -8'd100;  s = 0;  #10;
		a = 8'd75;  b = 8'd100;  s = 0;  #10;

		#20
		a = -8'd1;  b = 8'd0;  s = 1;  #10;
		a = 8'd0;  b = -8'd1;  s = 1;  #10;
		a = 8'd1;  b = 8'd1;  s = 1;  #10;

		#20
		a = -8'd1;  b = -8'd1;  s = 2;  #10;
		a = -8'd1;  b = 8'd49;  s = 2;  #10;
		a = 8'd0;  b = 8'd0;  s = 2;  #10;

		#20
		a = -8'd1;  b = 8'd0;  s = 3;  #10;
		a = 8'd0;  b = 8'd1;  s = 3;  #10;
		a = 8'd0;  b = 8'd0;  s = 3;  #10;
	end

endmodule
