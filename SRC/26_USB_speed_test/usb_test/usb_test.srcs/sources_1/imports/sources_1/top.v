module top
(
    input          sys_clk,
    input          rst_n,
	input          ft_clk,
	input          ft_rxf_n,  //Data available
	input          ft_txe_n,  //Space available
	output         ft_oe_n,
	output         ft_rd_n,
	output         ft_wr_n,
	output         ft_siwu_n,
	inout[7:0]     ft_data
);
assign ft_siwu_n = 1'b1;
ft232h ft232h_m0
(
    .sys_clk   (sys_clk ),
	.ft_clk    (ft_clk  ), 
	.rst       (~rst_n  ), 
	.ft_rxf_n  (ft_rxf_n), //Data available
	.ft_txe_n  (ft_txe_n), //Space available
	.ft_oe_n   (ft_oe_n ), 
	.ft_rd_n   (ft_rd_n ), 
	.ft_wr_n   (ft_wr_n ), 
	.ft_data   (ft_data )
);
endmodule