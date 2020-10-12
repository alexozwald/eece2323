## Clock signal from ENET Controller pin
set_property PACKAGE_PIN H16 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name clk125_pin -period 8.00 -waveform {0 4} [get_ports clk]

#Reset on PYNQ-Z2 board
#set_property PACKAGE_PIN D19 [get_ports reset];	# BTN0 of the board					
#	set_property IOSTANDARD LVCMOS33 [get_ports reset]

## LEDs maps to LDA (led[0]) to LDF (led[5]), led6 to LD2 and led7 to LD3
set_property PACKAGE_PIN B20 [get_ports {led[0]}];	#RPIO_12_R, connector Pin 32, FPGA Signal name RP_IO19					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN W8 [get_ports {led[1]}];	#RPIO_13_R, connector Pin 33, FPGA Signal name RP_IO12					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U8 [get_ports {led[2]}];	#RPIO_22_R, connector Pin 15, FPGA Signal name RP_IO05					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN W6 [get_ports {led[3]}];	#RPIO_23_R, connector Pin 16, FPGA Signal name RP_IO09					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN Y7 [get_ports {led[4]}];	#RPIO_24_R, connector Pin 18, FPGA Signal name RP_IO11					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN F20 [get_ports {led[5]}];	#RPIO_25_R, connector Pin 22, FPGA Signal name RP_IO17					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN N16 [get_ports {led[6]}];	#LD2					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN M14 [get_ports {led[7]}];	#LD3					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]