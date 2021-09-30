`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 09:47:58 PM
// Design Name: 
// Module Name: pdatapath_top
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

module Lab8_Datapath(
		input wire clk,
		input wire top_pb_clk,
        input wire rst_general,
		output [3:0] disp_en,
		output [6:0] seg7_output
    );
	
	wire [7:0] alu_input1, alu_input2;
    wire [7:0] alu_output;
    wire [2:0] ALUOp;
    wire       alu_ovf;
    wire       take_branch;
	
    
    wire [15:0] instruction;
    //insturction fields
    wire [3:0] opcode;
    wire [1:0] rs_addr;
    wire [1:0] rt_addr;
    wire [1:0] rd_addr;
    wire [7:0] immediate;
    //control signals
    wire RegDst;
    wire RegWrite;
    wire ALUSrc1;
    wire ALUSrc2;
    wire MemWrite;
    wire MemToReg;

    wire [1:0] regfile_write_address;//destination register address
    wire [8:0] regfile_write_data;//result data
    wire [8:0] read_data1;//source register1 data
    wire [8:0] read_data2;//source register2 data

    wire [8:0] alu_result;
    wire [7:0] zero_register;
    wire [8:0] data_mem_out;

    wire pb_clk_debounced;
	wire [7:0] pc;

	assign zero_register = 8'b0;//ZERO constant
	assign alu_result = {alu_ovf, alu_output};


		// Debounce
		debounce debounce_clk(
						.clk_in(clk),
						.rst_in(rst_general),
						.sig_in(top_pb_clk),
						.sig_debounced_out(pb_clk_debounced)
						);		
  
		// 7-Segment display module
	   	Adaptor_display display(.clk(clk), 				// system clock
							.input_value(alu_output),		// 8-bit input [7:0] value to display
							.disp_en(disp_en),			// output [3:0] 7 segment display enable
							.seg7_output(seg7_output));		// output [6:0] 7 segment signals
							
		/* Instantiate all other modules */
    
endmodule
