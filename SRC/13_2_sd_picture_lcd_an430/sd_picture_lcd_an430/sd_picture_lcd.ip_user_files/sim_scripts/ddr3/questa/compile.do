vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_addr_decode.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_read.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg_bank.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_top.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_write.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_ar_channel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_aw_channel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_b_channel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_arbiter.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_fsm.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_translator.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_fifo.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_incr_cmd.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_r_channel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_simple_fifo.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wrap_cmd.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wr_cmd_fsm.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_w_channel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axic_register_slice.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_register_slice.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_upsizer.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_a_upsizer.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_and.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_and.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_or.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_or.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_command_fifo.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel_static.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_r_upsizer.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_w_upsizer.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_clk_ibuf.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_infrastructure.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_iodelay_ctrl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_tempmon.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_mux.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_row_col.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_select.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_cntrl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_common.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_compare.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_mach.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_queue.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_state.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_col_mach.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_mc.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_cntrl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_common.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_mach.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_round_robin_arb.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_buf.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_dec_fix.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_gen.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_merge_enc.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_fi_xor.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v4_0_memc_ui_top_axi.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v4_0_mem_intfc.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_group_io.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_lane.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_calib_top.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_if_post_fifo.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy_wrapper.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_of_pre_fifo.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_4lanes.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_init.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_cntlr.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_data.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_edge.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_lim.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_mux.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_po_cntlr.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_samp.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_oclkdelay_cal.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_prbs_rdlvl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_rdlvl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_tempmon.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_top.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrcal.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl_off_delay.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_prbs_gen.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_skip_calib_tap.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_cc.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_edge_store.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_meta.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_pd.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_tap_base.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_top.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_cmd.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_rd_data.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_top.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_wr_data.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3_mig_sim.v" \
"../../../../sd_picture_lcd.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3.v" \

vlog -work xil_defaultlib \
"glbl.v"
