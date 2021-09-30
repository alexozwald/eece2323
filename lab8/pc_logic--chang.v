module pc_logic(
	input clk,
	input rst,
	input take_branch,
	input [7:0] offset,
	output [7:0] pc);

	reg [7:0] pc;
	always @(posedge clk, posedge rst)
	begin
		if (rst) begin
			pc <= 0;
			end
		else if(take_branch) begin
			pc <= pc + offset;
			end
		else begin
			pc <= pc+1;
			end
	end
endmodule
