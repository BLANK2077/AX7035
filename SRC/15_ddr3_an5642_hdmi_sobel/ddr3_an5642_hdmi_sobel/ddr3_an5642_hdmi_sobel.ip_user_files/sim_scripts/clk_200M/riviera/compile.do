vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ddr3_an5642_an070_lcd.srcs/sources_1/ip/clk_200M" "+incdir+../../../../ddr3_an5642_an070_lcd.srcs/sources_1/ip/clk_200M" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ddr3_an5642_an070_lcd.srcs/sources_1/ip/clk_200M" "+incdir+../../../../ddr3_an5642_an070_lcd.srcs/sources_1/ip/clk_200M" \
"../../../../ddr3_an5642_an070_lcd.srcs/sources_1/ip/clk_200M/clk_200M_sim_netlist.v" \

vlog -work xil_defaultlib \
"glbl.v"

