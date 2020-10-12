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


module eightbit_alu_top(
        input clk,
		output wire [7:0] led
    );
    
    wire [7:0] alu_1st_input, alu_2nd_input;
    wire [7:0] alu_output;
    wire [2:0] alu_operation_sel;
    wire       alu_ovf_flag, alu_take_branch;

    assign led = alu_output;
	
	//Instantiate the eightbit_alu module here	
    eightbit_alu alu(
        .sel(alu_operation_sel),
        .a(alu_1st_input),
        .b(alu_2nd_input),
        .f(alu_output),
        .ovf(alu_ovf_flag),
        .take_branch(alu_take_branch)
        );

    //Instantiate the VIO core here
    //Find the instantiate template from Sources Pane, IP sources -> Instantiation Template -> vio_0.veo (double click to open the file)
    vio_0 vio (
      .clk(clk),                // input wire clk
      .probe_in0(probe_in0),    // input wire [7 : 0] probe_in0
      .probe_in1(probe_in1),    // input wire [0 : 0] probe_in1
      .probe_in2(probe_in2),    // input wire [0 : 0] probe_in2
      .probe_out0(probe_out0),  // output wire [7 : 0] probe_out0
      .probe_out1(probe_out1),  // output wire [7 : 0] probe_out1
      .probe_out2(probe_out2)  // output wire [2 : 0] probe_out2
      );
endmodule
