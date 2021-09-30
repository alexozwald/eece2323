## Clock signal from ENET Controller pin
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name clk125_pin -period 8.00 -waveform {0 4} [get_ports { clk }];

#Button Clock input PYNQ-Z2 board BTN1
set_property PACKAGE_PIN D20 [get_ports top_pb_clk];	# BTN1 of the board					
	set_property IOSTANDARD LVCMOS33 [get_ports top_pb_clk]
	
#Reset on PYNQ-Z2 board BTN0
set_property PACKAGE_PIN D19 [get_ports rst_general];	# BTN0 of the board					
	set_property IOSTANDARD LVCMOS33 [get_ports rst_general]
    
##7 segment display
set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[0] }]; 
set_property -dict { PACKAGE_PIN Y17   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[1] }];
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[2] }];
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[3] }];
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[4] }];
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[5] }];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[6] }];
#set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { seg7_output[7] }];

## 7 segment display enable
set_property -dict { PACKAGE_PIN F19   IOSTANDARD LVCMOS33 } [get_ports { disp_en[0] }];
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { disp_en[1] }];
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { disp_en[2] }];
set_property -dict { PACKAGE_PIN W10   IOSTANDARD LVCMOS33 } [get_ports { disp_en[3] }];
