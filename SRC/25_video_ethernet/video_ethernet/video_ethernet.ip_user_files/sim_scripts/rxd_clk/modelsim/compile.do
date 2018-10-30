vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../ipstatic" "+incdir+../../../ipstatic" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" "+incdir+../../../ipstatic" \
"../../../../../../../AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk_clk_wiz.v" \
"../../../../../../../AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk.v" \

vlog -work xil_defaultlib \
"glbl.v"

