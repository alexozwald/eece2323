## Switches
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {sel[0]}] 
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {sel[1]}]

## Buttons
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {in2_ctrl[0]}]
set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {in2_ctrl[1]}]
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {in1_ctrl[0]}]
set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {in1_ctrl[1]}]

## Use to test the lowest 4 bits
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[0]}]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[3]}]
set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[4]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[5]}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[6]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[7]}] 
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports ovf_ctrl]


## Use to test the highest 4 bits
#set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33} [get_ports ovf_ctrl]
#set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[0]}]
#set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[1]}]
#set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[2]}]
#set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[3]}] 
#set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[4]}]
#set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[5]}]
#set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[6]}]
#set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {out_ctrl[7]}]