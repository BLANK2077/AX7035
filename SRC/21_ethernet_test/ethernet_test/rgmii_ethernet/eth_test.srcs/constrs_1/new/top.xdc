############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
############## clock and reset define##################
create_clock -period 20.000 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN Y18 [get_ports sys_clk]
#################resetsetting###############################
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
set_property PACKAGE_PIN F20 [get_ports rst_n]
############## key define##############################
set_property PACKAGE_PIN K14 [get_ports key]
set_property IOSTANDARD LVCMOS33 [get_ports key]
############# NET - IOSTANDARD ##################

set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_rxd[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgmii_txd[*]}]
set_property SLEW FAST [get_ports {rgmii_txd[*]}]

set_property IOSTANDARD LVCMOS33 [get_ports e_mdc]
set_property IOSTANDARD LVCMOS33 [get_ports e_mdio]
set_property IOSTANDARD LVCMOS33 [get_ports e_reset]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_rxctl]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_txc]
set_property IOSTANDARD LVCMOS33 [get_ports rgmii_txctl]
set_property SLEW FAST [get_ports rgmii_txc]
set_property SLEW FAST [get_ports rgmii_txctl]

set_property PACKAGE_PIN J20 [get_ports {rgmii_rxd[3]}]
set_property PACKAGE_PIN J17 [get_ports {rgmii_rxd[2]}]
set_property PACKAGE_PIN M15 [get_ports {rgmii_rxd[1]}]
set_property PACKAGE_PIN K19 [get_ports {rgmii_rxd[0]}]
set_property PACKAGE_PIN L20 [get_ports {rgmii_txd[3]}]
set_property PACKAGE_PIN L18 [get_ports {rgmii_txd[2]}]
set_property PACKAGE_PIN M20 [get_ports {rgmii_txd[1]}]
set_property PACKAGE_PIN J21 [get_ports {rgmii_txd[0]}]
set_property PACKAGE_PIN K17 [get_ports e_mdc]
set_property PACKAGE_PIN K16 [get_ports e_mdio]
set_property PACKAGE_PIN L15 [get_ports e_reset]
set_property PACKAGE_PIN K18 [get_ports rgmii_rxc]
set_property PACKAGE_PIN M21 [get_ports rgmii_rxctl]
set_property PACKAGE_PIN L14 [get_ports rgmii_txc]
set_property PACKAGE_PIN L19 [get_ports rgmii_txctl]

create_clock -period 8.000 -name rx_clk [get_ports rgmii_rxc]


