reg_file--changs.v

module reg_file(
	input rst, clk, wr_en,
	input [1:0] rd0_addr, rd1_addr, wr_addr,
	input [8:0] wr_data,
	output [8:0] rd0_data, rd1_data
	);

	reg [8:0] REG [3:0];

	// reading
	assign rd0_data = REG[rd0_addr];
	assign rd1_data = REG[rd1_addr];
	
	// writing
	always@(posedge clk, negedge rst)
	begin
		if(!rst)
			begin
				REG[0] <= 0;
				REG[1] <= 0;
				REG[2] <= 0;
				REG[3] <= 0;
			end
		else if(wr_en)
			begin
				REG[wr_addr] <= wr_data;
			end
	end

endmodule
