// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Oct 11 19:48:37 2020
// Host        : vm-2-Xilinx running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.3" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_out0, 
  probe_out1, probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[7:0],probe_in1[0:0],probe_in2[0:0],probe_out0[7:0],probe_out1[7:0],probe_out2[2:0]" */;
  input clk;
  input [7:0]probe_in0;
  input [0:0]probe_in1;
  input [0:0]probe_in2;
  output [7:0]probe_out0;
  output [7:0]probe_out1;
  output [2:0]probe_out2;
endmodule
