`timescale 1ns / 1ps

module pc_logic(
	input clk, rst,
	input take_branch,
	input [7:0] offset,
	output reg [7:0] pc);
	
	reg condition;

	always@ (posedge clk)
	begin
	    condition <= (pc + offset > 8'd127) ^ (pc + offset < -8'd128);
        pc <= ((rst | condition) ? 8'd0 : (pc + (take_branch ? 1 : offset)));
	   
	   /*  MUXES PREFERRED
		// reset or too high
		if (rst | condition) begin
			pc <= 8'd0;
		end
		// regulaar or branch
        if (~condition) begin
            pc <= pc + (take_branch ?  1 : offset );
        end
        */

        /* IF-STATEMENT HEAVY
		// reset
		if (rst) begin
			pc <= 0;
		end
		// branching
		else if (take_branch) begin
			pc <= pc + offset;
		end
		// regular
		else begin
			pc <= pc + 1;
		end
        */
	end
	
endmodule
