############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
############## clock  define##################
create_clock -period 10.000 [get_ports ft_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ft_clk]
set_property PACKAGE_PIN J19 [get_ports ft_clk]

create_clock -period 20.000 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN Y18 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]
set_property PACKAGE_PIN F20 [get_ports {rst_n}]
############## usb define##################
set_property PACKAGE_PIN K22 [get_ports {ft_data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[0]}]

set_property PACKAGE_PIN K21 [get_ports {ft_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[1]}]

set_property PACKAGE_PIN J22 [get_ports {ft_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[2]}]

set_property PACKAGE_PIN H18 [get_ports {ft_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[3]}]

set_property PACKAGE_PIN H22 [get_ports {ft_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[4]}]

set_property PACKAGE_PIN J15 [get_ports {ft_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[5]}]

set_property PACKAGE_PIN H20 [get_ports {ft_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[6]}]

set_property PACKAGE_PIN G20 [get_ports {ft_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_data[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports ft_oe_n]
set_property PACKAGE_PIN G18 [get_ports ft_oe_n]

set_property IOSTANDARD LVCMOS33 [get_ports ft_rd_n]
set_property PACKAGE_PIN L21 [get_ports ft_rd_n]

set_property IOSTANDARD LVCMOS33 [get_ports ft_rxf_n]
set_property PACKAGE_PIN H19 [get_ports ft_rxf_n]

set_property IOSTANDARD LVCMOS33 [get_ports ft_txe_n]
set_property PACKAGE_PIN H15 [get_ports ft_txe_n]

set_property IOSTANDARD LVCMOS33 [get_ports ft_wr_n]
set_property PACKAGE_PIN G17 [get_ports ft_wr_n]

set_property IOSTANDARD LVCMOS33 [get_ports ft_siwu_n]
set_property PACKAGE_PIN H17 [get_ports ft_siwu_n]