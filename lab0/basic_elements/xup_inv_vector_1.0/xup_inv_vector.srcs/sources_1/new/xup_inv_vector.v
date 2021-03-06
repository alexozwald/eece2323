`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: xup_inv_vector
//////////////////////////////////////////////////////////////////////////////////
module xup_inv_vector #(parameter SIZE = 4 , DELAY = 3)(
    input [SIZE-1:0] a,
    output [SIZE-1:0] y
    );
    
    assign #DELAY y = ~a;
    
endmodule
