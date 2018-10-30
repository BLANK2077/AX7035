-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../ad7606_ethernet.srcs/sources_1/ip/clk_200M/clk_200M_clk_wiz.v" \
  "../../../../ad7606_ethernet.srcs/sources_1/ip/clk_200M/clk_200M.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

