`timescale 1ns / 1ps

module pc_logic(
	input clk, rst,
	input take_branch,
	input [7:0] offset,
	output reg [7:0] pc);
	
	always@ (posedge clk, negedge rst)
	begin
        pc <= (rst ? 0 : (pc + (take_branch ? 1 : offset)));
	end
	
endmodule
