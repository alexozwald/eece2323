## 
##  This is the XDC file for DLD labs controller.
##

## Clock signal from H16 pin
set_property PACKAGE_PIN H16 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name clk125_pin -period 8.00 -waveform {0 4} [get_ports clk]

#Reset on PYNQ-Z2 board
set_property PACKAGE_PIN D19 [get_ports rst_general];	# BTN0 of the board					
	set_property IOSTANDARD LVCMOS33 [get_ports rst_general]