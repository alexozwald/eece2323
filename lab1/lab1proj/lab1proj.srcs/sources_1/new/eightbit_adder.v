`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 11:39:48 AM
// Design Name: 
// Module Name: eightbit_adder
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


module eightbit_adder(

    input [7:0] a,
    input [7:0] b,
    output [7:0] f,
    output ovf
    );
    
    assign f = a + b;
    assign ovf = (a[7] && b[7] && ~f[7]) || (~a[7] && ~b[7] && f[7]);

endmodule
