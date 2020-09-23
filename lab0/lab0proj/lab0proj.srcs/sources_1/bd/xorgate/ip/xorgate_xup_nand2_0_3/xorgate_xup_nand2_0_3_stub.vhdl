-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Fri Sep 18 16:43:05 2020
-- Host        : vm-40-Xilinx running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top xorgate_xup_nand2_0_3 -prefix
--               xorgate_xup_nand2_0_3_ xorgate_xup_nand2_0_1_stub.vhdl
-- Design      : xorgate_xup_nand2_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorgate_xup_nand2_0_3 is
  Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    y : out STD_LOGIC
  );

end xorgate_xup_nand2_0_3;

architecture stub of xorgate_xup_nand2_0_3 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a,b,y";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xup_nand2,Vivado 2018.3";
begin
end;
