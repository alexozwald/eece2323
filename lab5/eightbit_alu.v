`timescale 1ns / 1ps

module eightbit_alu(
	input [7:0] a,
	input [7:0] b,
	input [2:0] sel,
	output reg [7:0] f,
	output reg ovf,
	output reg take_branch);

	/* 
	 * List of Supported Operations
	 * 1. a + b		(add)
	 * 2. ~b		(invert b)
	 * 3. a & b		(bitwise and)
	 * 4. a | b		(bitwise or)
	 * 5. a >>> 1	(right shift)
	 * 6. a << 1	(left shift)
	 * 7. a == b	(if a=b; take_branch)
	 * 8. a != b	(if a!=b; take_branch)
	*/

	always @(a or b or sel)
		case(sel)
			3'b000: begin
				f = a + b;
				ovf = (a[7] & b[7] & ~f[7]) | (~a[7] & ~b[7] & f[7]);
				take_branch = 0;
				end
			3'b001: begin
				f = ~b;
				ovf = 0;
				take_branch = 0;
				end
			3'b010: begin
				f = a & b;
				ovf = 0;
				take_branch = 0;
				end
			3'b011: begin
				f = a | b;
				ovf = 0;
				take_branch = 0;
				end
			3'b100: begin
				f = a >>> 1;
				ovf = 0;
				take_branch = 0;
				end
			3'b101: begin 
				f = a << 1;
				ovf = 0;
				take_branch = 0;
				end
			3'b110:begin
				f = 0;
				ovf = 0;
				take_branch = (a == b);
				end
			3'b111: begin
				f = 0;
				ovf = 0;
				take_branch = (a != b);
				end
			default: begin
				f=0;
				ovf = 0;
				take_branch = 0;
				end
		endcase
endmodule
