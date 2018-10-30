############## NET - IOSTANDARD ##################
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
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
#####################HDMI_IN###############################
set_property PACKAGE_PIN N5 [get_ports hdmi_ddc_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_ddc_scl_io]

set_property PACKAGE_PIN L6 [get_ports hdmi_ddc_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_ddc_sda_io]

set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_in_n]

set_property PACKAGE_PIN K4 [get_ports TMDS_clk_hdmi_in_p]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_in_p]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[0]}]

set_property PACKAGE_PIN M1 [get_ports {TMDS_data_hdmi_in_p[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[0]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[1]}]

set_property PACKAGE_PIN P2 [get_ports {TMDS_data_hdmi_in_p[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[1]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[2]}]


set_property PACKAGE_PIN R1 [get_ports {TMDS_data_hdmi_in_p[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[2]}]

set_property PACKAGE_PIN P6 [get_ports {HDMI_hdmi_in_OEN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {HDMI_hdmi_in_OEN[0]}]

set_property PACKAGE_PIN M5 [get_ports hdmi_hdmi_in_hpd]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_hdmi_in_hpd]
 ######################HDMI_OUT#########################
 set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_out_n]
 
 set_property PACKAGE_PIN E1 [get_ports TMDS_clk_hdmi_out_p]
 set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_out_p]
 
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[0]}]
 
 set_property PACKAGE_PIN G1 [get_ports {TMDS_data_hdmi_out_p[0]}]
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[0]}]
 
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[1]}]
  
 set_property PACKAGE_PIN H2 [get_ports {TMDS_data_hdmi_out_p[1]}]
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[1]}]
 
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[2]}]
 
 set_property PACKAGE_PIN K1 [get_ports {TMDS_data_hdmi_out_p[2]}]
 set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[2]}]
 
 set_property PACKAGE_PIN M6 [get_ports {HDMI_hdmi_out_OEN[0]}]
 set_property IOSTANDARD LVCMOS33 [get_ports {HDMI_hdmi_out_OEN[0]}]