############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
############## clock and reset define##################
create_clock -period 20.000 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN Y18 [get_ports sys_clk]

set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN F20 [get_ports rst_n]
##########################################################
set_property PACKAGE_PIN N22 [get_ports sda]
set_property PACKAGE_PIN M22 [get_ports scl]
set_property IOSTANDARD LVCMOS33 [get_ports sda]
set_property IOSTANDARD LVCMOS33 [get_ports scl]
#######################digital tube setting######################
set_property PACKAGE_PIN J5 [get_ports {SMG_Data[0]}]
set_property PACKAGE_PIN M3 [get_ports {SMG_Data[1]}]
set_property PACKAGE_PIN J6 [get_ports {SMG_Data[2]}]
set_property PACKAGE_PIN H5 [get_ports {SMG_Data[3]}]
set_property PACKAGE_PIN G4 [get_ports {SMG_Data[4]}]
set_property PACKAGE_PIN K6 [get_ports {SMG_Data[5]}]
set_property PACKAGE_PIN K3 [get_ports {SMG_Data[6]}]
set_property PACKAGE_PIN H4 [get_ports {SMG_Data[7]}]

set_property PACKAGE_PIN M2 [get_ports {Scan_Sig[0]}]
set_property PACKAGE_PIN N4 [get_ports {Scan_Sig[1]}]
set_property PACKAGE_PIN L5 [get_ports {Scan_Sig[2]}]
set_property PACKAGE_PIN L4 [get_ports {Scan_Sig[3]}]
set_property PACKAGE_PIN M16 [get_ports {Scan_Sig[4]}]
set_property PACKAGE_PIN M17 [get_ports {Scan_Sig[5]}]

set_property IOSTANDARD LVCMOS33 [get_ports {SMG_Data[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Scan_Sig[*]}]

set_property PULLUP true [get_ports sda]
set_property PULLUP true [get_ports scl]
