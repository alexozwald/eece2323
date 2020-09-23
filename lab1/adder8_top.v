`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2015 01:40:59 PM
// Design Name: 
// Module Name: adder8_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Revision 1.00 - File updated for PYNQ-Z2 board
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adder8_top(
	//Inputs to test the adder
	input wire [2:0] in1_ctrl,//input 1 control
	input wire [2:0] in2_ctrl,//input 2 control
	//Output the result using leds
	output wire [7:0] out_ctrl,
	output wire ovf_ctrl	
);

	wire [7:0] adder_1st_input, adder_2nd_input;
	wire [7:0] adder_output;
	wire       adder_ovf_flag;
    
    // Test for the lowest 4 bits
    assign adder_1st_input = {4'b0000, in1_ctrl[2], in1_ctrl[1], in1_ctrl[0], 1'b1};
    assign adder_2nd_input = {4'b0000, in2_ctrl[2], in2_ctrl[1], in2_ctrl[0], 1'b0};
    
    // Test for the highest 4 bits
//    assign adder_1st_input = {in1_ctrl[2], in1_ctrl[1], in1_ctrl[0], 5'b10000};
//    assign adder_2nd_input = {in2_ctrl[2], in2_ctrl[1], in2_ctrl[0], 5'b00000};

    assign out_ctrl = adder_output;
    assign ovf_ctrl = adder_ovf_flag;
    
    eightbit_adder adder8 (
        .a(adder_1st_input),
        .b(adder_2nd_input),
        .f(adder_output),
        .ovf(adder_ovf_flag)
        );        
        
endmodule