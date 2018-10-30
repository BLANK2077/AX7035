vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_addr_decode.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_read.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg_bank.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_top.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_write.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_ar_channel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_aw_channel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_b_channel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_arbiter.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_fsm.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_translator.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_fifo.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_incr_cmd.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_r_channel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_simple_fifo.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wrap_cmd.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wr_cmd_fsm.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_axi_mc_w_channel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axic_register_slice.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_register_slice.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_upsizer.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_a_upsizer.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_and.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_and.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_or.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_or.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_command_fifo.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel_static.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_r_upsizer.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/axi/mig_7series_v4_0_ddr_w_upsizer.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_clk_ibuf.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_infrastructure.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_iodelay_ctrl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/clocking/mig_7series_v4_0_tempmon.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_mux.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_row_col.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_arb_select.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_cntrl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_common.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_compare.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_mach.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_queue.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_bank_state.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_col_mach.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_mc.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_cntrl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_common.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_rank_mach.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/controller/mig_7series_v4_0_round_robin_arb.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_buf.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_dec_fix.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_gen.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_ecc_merge_enc.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ecc/mig_7series_v4_0_fi_xor.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v4_0_memc_ui_top_axi.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ip_top/mig_7series_v4_0_mem_intfc.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_group_io.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_lane.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_calib_top.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_if_post_fifo.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy_wrapper.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_of_pre_fifo.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_4lanes.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_init.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_cntlr.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_data.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_edge.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_lim.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_mux.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_po_cntlr.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_samp.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_oclkdelay_cal.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_prbs_rdlvl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_rdlvl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_tempmon.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_top.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrcal.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl_off_delay.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_prbs_gen.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_ddr_skip_calib_tap.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_cc.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_edge_store.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_meta.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_pd.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_tap_base.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/phy/mig_7series_v4_0_poc_top.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_cmd.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_rd_data.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_top.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ui/mig_7series_v4_0_ui_wr_data.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3_mig_sim.v" \
"../../../../audio_record_play.srcs/sources_1/ip/ddr3/ddr3/user_design/rtl/ddr3.v" \

vlog -work xil_defaultlib \
"glbl.v"

