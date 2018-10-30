############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property CONFIG_MODE SPIx4 [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 

create_clock -period 20 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk}]
set_property PACKAGE_PIN Y18 [get_ports {sys_clk}]

set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN F20 [get_ports {rst_n}]

set_property IOSTANDARD LVCMOS33 [get_ports {error}]
set_property PACKAGE_PIN F19 [get_ports {error}]

set_property IOSTANDARD LVCMOS33 [get_ports {init_calib_complete}]
set_property PACKAGE_PIN E21 [get_ports {init_calib_complete}]

set_property PACKAGE_PIN K14 [get_ports key]
set_property IOSTANDARD LVCMOS33 [get_ports key]
#############################AN831 J9##################################
set_property PACKAGE_PIN D16 [get_ports wm8731_scl]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_scl]
set_property PACKAGE_PIN E16 [get_ports wm8731_sda]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_sda]
set_property PACKAGE_PIN F14 [get_ports wm8731_dacdat]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_dacdat]
set_property PACKAGE_PIN F13 [get_ports wm8731_bclk]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_bclk]
set_property PACKAGE_PIN E14 [get_ports wm8731_adcdat]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_adcdat]
set_property PACKAGE_PIN E13 [get_ports wm8731_daclrc]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_daclrc]
set_property PACKAGE_PIN D15 [get_ports wm8731_adclrc]
set_property IOSTANDARD LVCMOS33 [get_ports wm8731_adclrc]