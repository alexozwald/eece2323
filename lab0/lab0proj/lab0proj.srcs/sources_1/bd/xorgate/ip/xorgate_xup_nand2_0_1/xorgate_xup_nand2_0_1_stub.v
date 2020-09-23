// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Sep 18 16:43:06 2020
// Host        : vm-40-Xilinx running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               Z:/Desktop/EECE2323/lab0/lab0proj/lab0proj.srcs/sources_1/bd/xorgate/ip/xorgate_xup_nand2_0_1/xorgate_xup_nand2_0_1_stub.v
// Design      : xorgate_xup_nand2_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xup_nand2,Vivado 2018.3" *)
module xorgate_xup_nand2_0_1(a, b, y)
/* synthesis syn_black_box black_box_pad_pin="a,b,y" */;
  input a;
  input b;
  output y;
endmodule
