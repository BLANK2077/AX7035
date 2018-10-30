module top
(
    input         sys_clk,
	input          ft_clk,
	input          ft_rxf_n,  //Data available
	input          ft_txe_n,  //Space available
	output         ft_oe_n,
	output         ft_rd_n,
	output         ft_wr_n,
  //  output[1:0]    led,
	inout[7:0]     ft_data
);

wire[7:0]  ft_datain;
ft232h ft232h_m0
(
   .sys_clk    (sys_clk),
	.ft_clk    (ft_clk  ), 
	.rst       (1'b0    ), 
	.ft_rxf_n  (ft_rxf_n), //Data available
	.ft_txe_n  (ft_txe_n), //Space available
	.ft_oe_n   (ft_oe_n ), 
	.ft_rd_n   (ft_rd_n ), 
	.ft_wr_n   (ft_wr_n ), 
	.ft_data   (ft_data )
//	.buf_data   (ft_datain )
);

endmodule
/*module ft232h_simple(
	rst_n,
	ft_rd_n,
	ft_wr_n,
	ft_oe_n,
	ft_rxf_n,
	ft_txe_n,
	ft_siwu_n,
	ft_data,
	ft_clk);
// sys port
input wire rst_n;

output wire ft_rd_n;
output wire ft_wr_n;
output wire ft_oe_n;
output wire ft_siwu_n;

input wire ft_rxf_n;
input wire ft_txe_n;
input wire ft_clk;

inout wire [7:0] ft_data;

/*assign ft_siwu_n = 1'b1;
assign ft_oe_n = 1'b0;
assign ft_rd_n = 1'b1;

reg [7:0] dataReg;
reg wr_nReg;
reg last_txe_n;

assign ft_data = dataReg;
assign ft_wr_n = wr_nReg;

always @(negedge rst_n or posedge ft_clk)
if (~rst_n)
	last_txe_n <= 1'b1;
else
	last_txe_n <= ft_txe_n;

always @(negedge rst_n or posedge ft_clk)
if (~rst_n)
	dataReg <= 8'b0;
else
	if (~last_txe_n & ~ft_txe_n)
		dataReg <= dataReg + 8'b1;

always @(negedge rst_n or posedge ft_clk)
if (~rst_n)
	wr_nReg <= 1'b1;
else
	if (~ft_txe_n)
		wr_nReg <= 1'b0;
	else
		wr_nReg <= 1'b1;
	
	assign ft_siwu_n = 1'b1;
    assign ft_oe_n = 1'b1;
    assign ft_wr_n = 1'b1;
    
    reg [7:0] dataReg;
    reg rd_nReg;
    reg last_rxf_n;
    
  //  assign dataReg=ft_data;
    assign ft_rd_n =rd_nReg;
    
    always @(negedge rst_n or posedge ft_clk)
    if (~rst_n)
        last_rxf_n <= 1'b1;
    else
        last_rxf_n <= ft_rxf_n;
    
    always @(negedge rst_n or posedge ft_clk)
    if (~rst_n)
        dataReg <= 8'b0;
    else
        if (~last_rxf_n & ~ft_rxf_n)
            dataReg <= ft_data;
    
    always @(negedge rst_n or posedge ft_clk)
    if (~rst_n)
        rd_nReg <= 1'b1;
    else
        if (~ft_rxf_n)
            rd_nReg <= 1'b0;
        else
            rd_nReg <= 1'b1;
endmodule*/