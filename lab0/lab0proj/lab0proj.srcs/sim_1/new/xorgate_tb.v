`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2020 04:10:46 PM
// Design Name: 
// Module Name: xorgate_tb
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


module xorgate_tb();

    //Inputs
    reg a=1'b0;
    reg b=1'b0;
    //Output
    wire c;
    
    //Instantiate the Unit Under Test (UUT)
    xorgate_wrapper UUT
        (.a(a),
         .b(b),
         .c(c)
         );
         
    //Initialize Inputs (Stimulus)
    initial
        begin
            
            #200; // -------------------- Current time: 200ns
            a=1'b1;
            
            #100; // -------------------- Current time: 300ns
            a=1'b0;
            b=1'b1;
            
            #100; // -------------------- Current time: 400ns
            a=1'b1;
            
            #150; // -------------------- Current time: 550ns
            a=1'b0;
            b=1'b0;
    
    end

endmodule
