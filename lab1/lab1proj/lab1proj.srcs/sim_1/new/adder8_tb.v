`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 11:58:54 AM
// Design Name: 
// Module Name: adder8_tb
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


module adder8_tb ();
    reg signed [7:0] a;
    reg signed [7:0] b;
    wire signed [7:0] f;
    wire ovf;
    
    eightbit_adder uut
        (.a(a),
         .b(b),
         .f(f),
         .ovf(ovf));
         
     // Test Vectors
     initial
       begin
         #10  a = 8'd0; b = 8'd0;
         #10  a = 8'd12; b = 8'd34;
         #10  a = -8'd12; b = -8'd34;
         #10  a = 8'd100; b = -8'd50;
         #10  a = -8'd100; b = 8'd50;
         #10  a = 8'd100; b = 8'd100;
         #10  a = -8'd100; b = -8'd100;
         
       end
         
         
    
endmodule
