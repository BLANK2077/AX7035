set_property SRC_FILE_INFO {cfile:d:/AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk.xdc rfile:../../../../../../AX7325/exa_test_microblaze/test_hello_led_ddr/test_hello_led_ddr.srcs/sources_1/bd/mref/csi_rx_4lane/rxd_clk/rxd_clk.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.08
