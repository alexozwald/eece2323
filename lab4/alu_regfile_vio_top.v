`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 04:43:08 PM
// Design Name: 
// Module Name: alu_regfile_vio_top
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


module alu_regfile_vio_top(
    input clk,
    input reset,
    output [7:0] led
    );
    
    wire [7:0] alu_input1, alu_input2, alu_input2_instr_src;
    wire [7:0] alu_output;
    wire [2:0] ALUOp;
    wire       alu_ovf;
    wire       take_branch;

    wire RegWrite;//Write enable

    wire [1:0] regfile_ReadAddress1;//source register1 address
    wire [1:0] regfile_ReadAddress2;//source register2 address
    wire [1:0] regfile_WriteAddress;//destination register address
    wire [8:0] regfile_WriteData;//result data
    wire [8:0] regfile_ReadData1;//source register1 data
    wire [8:0] regfile_ReadData2;//source register2 data
    
    wire ALUSrc1, ALUSrc2;
    reg [8:0] zero_register = 0;
	
	// Assign LEDs
    assign led = alu_output;

   // Instantiate Muxes here
    alu_regfile ALU_RegFile (
        .ReadData1(regfile_ReadData1),
        .ReadData2(regfile_ReadData2),
        .ALUsrc1(ALUSrc1),
        .ALUsrc2(ALUSrc2),
        .ALUop(ALUOp),
        .Instr_i(alu_input2_instr_src), // BREAK

        .rst(reset),
        .clk(clk),
        .wr_en(RegWrite),
        .rd0_addr(regfile_ReadAddress1),
        .rd1_addr(regfile_ReadAddress2),
        .wr_addr(regfile_WriteAddress),
        .wr_data(regfile_WriteData), // BREAK

        .input_1(alu_input1),
        .input_2(alu_input2),
        .result(alu_output),
        .ovf(alu_ovf),
        .take_branch(take_branch)
        );

   // Instantiate VIO module here
    vio_0 vio (
        .clk(clk),                // input wire clk
        .probe_in0(alu_output),    // input wire [7 : 0] probe_in0
        .probe_in1(alu_ovf),    // input wire [0 : 0] probe_in1
        .probe_in2(take_branch),    // input wire [0 : 0] probe_in2
        .probe_in3(regfile_ReadData1),    // input wire [8 : 0] probe_in3
        .probe_in4(regfile_ReadData2),    // input wire [8 : 0] probe_in4
        .probe_in5(alu_input1),    // input wire [7 : 0] probe_in5
        .probe_in6(alu_input2),    // input wire [7 : 0] probe_in6

        .probe_out0(alu_input2_instr_src),  // output wire [7 : 0] probe_out0
        .probe_out1(ALUOp),  // output wire [2 : 0] probe_out1
        .probe_out2(ALUSrc1),  // output wire [0 : 0] probe_out2
        .probe_out3(ALUSrc2),  // output wire [0 : 0] probe_out3
        .probe_out4(RegWrite),  // output wire [0 : 0] probe_out4
        .probe_out5(regfile_ReadAddress1),  // output wire [1 : 0] probe_out5
        .probe_out6(regfile_ReadAddress2),  // output wire [1 : 0] probe_out6
        .probe_out7(regfile_WriteAddress),  // output wire [1 : 0] probe_out7
        .probe_out8(regfile_WriteData)  // output wire [8 : 0] probe_out8
        );
   
endmodule
