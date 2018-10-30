set_property SRC_FILE_INFO {cfile:d:/zynq7020/course_s1/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xdc rfile:../HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xdc id:1 order:EARLY scoped_inst:video_pll_m0/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.2
