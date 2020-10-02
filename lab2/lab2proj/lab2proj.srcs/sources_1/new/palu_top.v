`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Tlalit Bruno
// 
// Create Date: 08/17/2014 02:18:36 PM
// Design Name: 
// Module Name: palu_top
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


module palu_top(
		//Inputs from switches and buttons for testing the circuit on the board
		input wire [1:0] sel,//SW1-0 from the PYNQ board as ALU select bus
		input wire [1:0] in1_ctrl,//BTN3-2 from the PYNQ board as in1 control
		input wire [1:0] in2_ctrl,//BTN1-0 from the PYNQ board as in2 control
		//Output the ALU result on LEDS
		output wire [7:0] out_ctrl,
		output wire ovf_ctrl
    );
    
    wire [7:0] palu_1st_input, palu_2nd_input;
    wire [7:0] palu_output;
    wire [1:0] alu_operation_sel;
    wire       palu_ovf_flag;
    
    // Test the lower 4 bits
    assign palu_1st_input = {5'b00000, in1_ctrl[1], 1'b0, in1_ctrl[0]};
    assign palu_2nd_input = {5'b00001, in2_ctrl[1], 1'b0, in2_ctrl[0]};
    
    // Test the higher 4 bits
//    assign palu_1st_input = {in1_ctrl[1], 1'b0, in1_ctrl[0], 5'b10000};
//    assign palu_2nd_input = {in2_ctrl[1], 1'b0, in2_ctrl[0], 5'b00000};
    
    assign alu_operation_sel = sel; //assign the SW1-0 from the zedboard to the ALU operation select bus


	assign out_ctrl = palu_output;
	assign ovf_ctrl = palu_ovf_flag;
	
	//Instantiate the eightbit_palu module here	
    eightbit_palu palu(
        .s(alu_operation_sel),
        .a(palu_1st_input),
        .b(palu_2nd_input),
        .f(palu_output),
        .ovf(palu_ovf_flag)
        );
        

endmodule