-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../../../../AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk_clk_wiz.v" \
  "../../../../../../../AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

