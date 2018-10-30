############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property CONFIG_MODE SPIx4 [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 
############## clock and reset define##################
create_clock -period 20 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk}]
set_property PACKAGE_PIN Y18 [get_ports {sys_clk}]

set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN F20 [get_ports {rst_n}]

############## SD define##################
set_property IOSTANDARD LVCMOS33 [get_ports sd_dclk]
set_property PACKAGE_PIN N15 [get_ports sd_dclk]

set_property IOSTANDARD LVCMOS33 [get_ports sd_ncs]
set_property PACKAGE_PIN N13 [get_ports sd_ncs]

set_property IOSTANDARD LVCMOS33 [get_ports sd_mosi]
set_property PACKAGE_PIN P15 [get_ports sd_mosi]

set_property IOSTANDARD LVCMOS33 [get_ports sd_miso]
set_property PACKAGE_PIN P16 [get_ports sd_miso]
############## led define##################
set_property PACKAGE_PIN F19 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN E21 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

set_property PACKAGE_PIN D20 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]

set_property PACKAGE_PIN C20 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
############## key define##################
set_property PACKAGE_PIN K14 [get_ports key]
set_property IOSTANDARD LVCMOS33 [get_ports key]



