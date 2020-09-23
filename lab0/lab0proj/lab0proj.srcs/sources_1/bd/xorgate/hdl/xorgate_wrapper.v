//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Fri Sep 18 16:42:08 2020
//Host        : vm-40-Xilinx running 64-bit major release  (build 9200)
//Command     : generate_target xorgate_wrapper.bd
//Design      : xorgate_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xorgate_wrapper
   (a,
    b,
    c);
  input a;
  input b;
  output c;

  wire a;
  wire b;
  wire c;

  xorgate xorgate_i
       (.a(a),
        .b(b),
        .c(c));
endmodule
