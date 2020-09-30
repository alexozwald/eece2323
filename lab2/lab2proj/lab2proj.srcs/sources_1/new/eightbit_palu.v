`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2020 09:09:14 PM
// Design Name: 
// Module Name: eightbit_palu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// / Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module eightbit_palu(

	input signed[7:0] a,
	input signed[7:0] b,
	input [1:0] s,
	output reg [7:0] f,
	output reg ovf);

	wire [7:0] op1; // a + b
	wire [7:0] op2; // bitwise inversion of b
	wire [7:0] op3; // bitwise AND of a and b
	wire [7:0] op4; // bitwise OR of a and b

	assign op1 = a + b;
	assign op2 = ~b;
	assign op3 = a & b;
	assign op4 = a | b;

	always @(s or op1 or op2 or op3 or op4)
		case(s)
			2'b00: begin
				f = op1;
				ovf = (a[7] && b[7] && ~f[7]) || (~a[7] && ~b[7] && f[7]);
			end
			2'b01: begin
				f = op2;
				ovf = 0;
			end
			2'b10: begin
				f = op3;
				ovf = 0;
			end
			2'b11: begin
				f = op4;
				ovf = 0;
			end
			default:  begin
				f = 0;
				ovf = 0;
			end
		endcase

endmodule
