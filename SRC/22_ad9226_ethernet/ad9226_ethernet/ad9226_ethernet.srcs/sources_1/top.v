//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: lhj                                                                 //
//                                                                              //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2018/01/11     lhj          1.0         Original
//*******************************************************************************/

module top(
	input                       sys_clk,
	input                       rst_n,

	output                      ad9226_clk_ch0,
    input[11:0]                 ad9226_data_ch0,
    output                      e_reset,
    output                      e_mdc,                      //MDIO的时钟信号，用于读写PHY的寄存器
    inout                       e_mdio,                     //MDIO的数据信号，用于读写PHY的寄存器
                                
    output   [3:0]              rgmii_txd,                  //RGMII 发?数捿
    output                      rgmii_txctl,                //RGMII 发?数据有效信叿
    output                      rgmii_txc,                  //125Mhz ethernet rgmii tx clock
    input    [3:0]              rgmii_rxd,                  //RGMII 接收数据
    input                       rgmii_rxctl,                //RGMII 接收数据有效信号
    input                       rgmii_rxc,                 //125Mhz ethernet gmii rx clock
	
    inout [15:0]                ddr3_dq,
    inout [1:0]                 ddr3_dqs_n,
    inout [1:0]                 ddr3_dqs_p,
    output [13:0]               ddr3_addr,
    output [2:0]                ddr3_ba,
    output                      ddr3_ras_n,
    output                      ddr3_cas_n,
    output                      ddr3_we_n,
    output                      ddr3_reset_n,
    output[0:0]                 ddr3_ck_p,
    output[0:0]                 ddr3_ck_n,
    output[0:0]                 ddr3_cke,
    output[0:0]                 ddr3_cs_n,
    output[1:0]                 ddr3_dm,
    output[0:0]                 ddr3_odt
	
);
parameter MEM_DATA_BITS          = 64;             //external memory user interface data width
parameter ADDR_BITS              = 25;             //external memory user interface address width
parameter BUSRT_BITS             = 10;             //external memory user interface burst width
wire                            wr_burst_data_req;
wire                            wr_burst_finish;
wire                            rd_burst_finish;
wire                            rd_burst_req;
wire                            wr_burst_req;
wire[BUSRT_BITS - 1:0]          rd_burst_len;
wire[BUSRT_BITS - 1:0]          wr_burst_len;
wire[ADDR_BITS - 1:0]           rd_burst_addr;
wire[ADDR_BITS - 1:0]           wr_burst_addr;
wire                            rd_burst_data_valid;
wire[MEM_DATA_BITS - 1 : 0]     rd_burst_data;
wire[MEM_DATA_BITS - 1 : 0]     wr_burst_data;
wire                            read_req;
wire                            read_req_ack;
wire                            read_en;
wire[15:0]                      read_data;
wire                            write_en;
wire[15:0]                      write_data;
wire                            write_req;
wire                            write_req_ack;
wire                            video_clk;         //video pixel clock
wire                            video_clk5x;

wire                            ui_clk;
wire                            ui_clk_sync_rst;
wire                            init_calib_complete;
// Master Write Address
wire [3:0]                      s00_axi_awid;
wire [63:0]                     s00_axi_awaddr;
wire [7:0]                      s00_axi_awlen;    // burst length: 0-255
wire [2:0]                      s00_axi_awsize;   // burst size: fixed 2'b011
wire [1:0]                      s00_axi_awburst;  // burst type: fixed 2'b01(incremental burst)
wire                            s00_axi_awlock;   // lock: fixed 2'b00
wire [3:0]                      s00_axi_awcache;  // cache: fiex 2'b0011
wire [2:0]                      s00_axi_awprot;   // protect: fixed 2'b000
wire [3:0]                      s00_axi_awqos;    // qos: fixed 2'b0000
wire [0:0]                      s00_axi_awuser;   // user: fixed 32'd0
wire                            s00_axi_awvalid;
wire                            s00_axi_awready;
// master write data
wire [63:0]                     s00_axi_wdata;
wire [7:0]                      s00_axi_wstrb;
wire                            s00_axi_wlast;
wire [0:0]                      s00_axi_wuser;
wire                            s00_axi_wvalid;
wire                            s00_axi_wready;
// master write response
wire [3:0]                      s00_axi_bid;
wire [1:0]                      s00_axi_bresp;
wire [0:0]                      s00_axi_buser;
wire                            s00_axi_bvalid;
wire                            s00_axi_bready;
// master read address
wire [3:0]                      s00_axi_arid;
wire [63:0]                     s00_axi_araddr;
wire [7:0]                      s00_axi_arlen;
wire [2:0]                      s00_axi_arsize;
wire [1:0]                      s00_axi_arburst;
wire [1:0]                      s00_axi_arlock;
wire [3:0]                      s00_axi_arcache;
wire [2:0]                      s00_axi_arprot;
wire [3:0]                      s00_axi_arqos;
wire [0:0]                      s00_axi_aruser;
wire                            s00_axi_arvalid;
wire                            s00_axi_arready;
// master read data
wire [3:0]                      s00_axi_rid;
wire [63:0]                     s00_axi_rdata;
wire [1:0]                      s00_axi_rresp;
wire                            s00_axi_rlast;
wire [0:0]                      s00_axi_ruser;
wire                            s00_axi_rvalid;
wire                            s00_axi_rready;
wire                            clk_200MHz;


wire                            ad_data_req ;
wire                            ad_data_ack ;
wire                            ad_sample_req ;
wire                            ad_sample_ack ;
wire [31:0]                     sample_len  ;


wire [7:0]                      gmii_txd;
wire                            gmii_tx_en;
wire                            gmii_tx_er;
wire                            gmii_tx_clk;
wire                            gmii_crs;
wire                            gmii_col;
wire [7:0]                      gmii_rxd;
wire                            gmii_rx_dv;
wire                            gmii_rx_er;
wire                            gmii_rx_clk;
wire [1:0]                      speed_selection; // 1x gigabit, 01 100Mbps, 00 10mbps
wire                            duplex_mode;     // 1 full, 0 half

wire                            adc_clk;
wire                            adc0_buf_wr;
wire [10:0]                     adc0_buf_addr;
wire [15:0]                     adc0_buf_data;
                                
wire [11:0]                     fifo_data_count;
wire [7:0]                      fifo_data;
wire                            fifo_rd_en;
                                
wire                            eth_rst_n ;

wire [15:0]                     read_usedw ;
wire                            write_finish ;

assign speed_selection = 2'b10;
assign duplex_mode     = 1'b1;

assign ad9226_clk_ch0 = adc_clk ;

 clk_200M clk_ref_m0
(
// Clock out ports
.clk_out1(clk_200MHz),     // output clk_out1
.clk_out2(),     // output clk_out2
// Status and control signals
.reset(1'b0), // input reset
.locked(  ),       // output locked
// Clock in ports
.clk_in1(sys_clk));      // input clk_in1

video_pll video_pll_m0
(
  .clk_in1                    (sys_clk          ),
  .clk_out1                   (adc_clk          ),
  .clk_out2                   (                 ),
  .reset                      (1'b0             ),
  .locked                     (                 )
);

miim_top miim_top_m0
(
 .reset_i                (1'b0),
 .miim_clock_i           (gmii_tx_clk),
 .mdc_o                  (e_mdc),
 .mdio_io                (e_mdio),
 .link_up_o              (),                  //link status
 .speed_o                (),                  //link speed
 .speed_override_i       (2'b11)              //11: autonegoation
);
	
util_gmii_to_rgmii util_gmii_to_rgmii_m0(
	.reset(1'b0),
	
	.rgmii_td(rgmii_txd),
	.rgmii_tx_ctl(rgmii_txctl),
	.rgmii_txc(rgmii_txc),
	.rgmii_rd(rgmii_rxd),
	.rgmii_rx_ctl(rgmii_rxctl),
	.gmii_rx_clk(gmii_rx_clk),
	.gmii_txd(gmii_txd),
	.gmii_tx_en(gmii_tx_en),
	.gmii_tx_er(1'b0),
	.gmii_tx_clk(gmii_tx_clk),
	.gmii_crs(gmii_crs),
	.gmii_col(gmii_col),
	.gmii_rxd(gmii_rxd),
    .rgmii_rxc(rgmii_rxc),//add
	.gmii_rx_dv(gmii_rx_dv),
	.gmii_rx_er(gmii_rx_er),
	.speed_selection(speed_selection),
	.duplex_mode(duplex_mode)
	);

 reset reset_m0
  (
      .clk(sys_clk),
      .key1(rst_n),
      .rst_n(e_reset)
  );
eth_top eth_top_inst
    (
    
      .rst_n                   (rst_n   ),    
      
      .fifo_data               (read_data),           //FIFO读出皿8bit数据/
      .fifo_data_count         (read_usedw),          //FIFO中的数据数量
      .fifo_rd_en              (read_en),             //FIFO读使胿
      
      .read_req_ack            (read_req_ack   ),
      .read_req                (read_req       ),
      .ad_sample_req           (ad_sample_req  ),
      .ad_sample_ack           (ad_sample_ack  ),
      .sample_len              (sample_len  ),
      .gmii_tx_clk             (gmii_tx_clk),
      .gmii_rx_clk             (gmii_rx_clk) ,
      .gmii_rx_dv              (gmii_rx_dv),
      .gmii_rxd                (gmii_rxd  ),
      .gmii_tx_en              (gmii_tx_en ),
      .gmii_txd                (gmii_txd )
      
    );

ad9226_sample ad9226_sample_m0
 (
   .adc_clk                (adc_clk                    ),
   .rst                    (~rst_n                     ),
   .adc_data               (ad9226_data_ch0            ),
   .adc_buf_wr             (write_en                   ),
   .adc_buf_data           (write_data                 ),
   .sample_len             (sample_len                 ),
   .ad_sample_req          (ad_sample_req              ),
   .ad_sample_ack          (ad_sample_ack              ),
   .write_req              (write_req                  ),
   .write_req_ack          (write_req_ack              )
 );



//video frame data read-write control
frame_read_write frame_read_write_m0
(
	.rst                        (~rst_n                   ),
	.mem_clk                    (ui_clk                   ),
	.rd_burst_req               (rd_burst_req             ),
	.rd_burst_len               (rd_burst_len             ),
	.rd_burst_addr              (rd_burst_addr            ),
	.rd_burst_data_valid        (rd_burst_data_valid      ),
	.rd_burst_data              (rd_burst_data            ),
	.rd_burst_finish            (rd_burst_finish          ),
	.read_clk                   (gmii_tx_clk              ),
	.read_req                   (read_req    ),
	.read_req_ack               (read_req_ack             ),
	.read_finish                (                         ),
	.read_addr_0                (24'd0                    ), //The first frame address is 0
	.read_addr_1                (24'd2073600              ), //The second frame address is 24'd2073600 ,large enough address space for one frame of video
	.read_addr_2                (24'd4147200              ),
	.read_addr_3                (24'd6220800              ),
	.read_addr_index            (2'd0                     ),
	.read_len                   (sample_len/4             ),//frame size 
	.read_en                    (read_en                  ),
	.read_data                  (read_data                ),
    .read_usedw                 (read_usedw               ),
    
	.wr_burst_req               (wr_burst_req             ),
	.wr_burst_len               (wr_burst_len             ),
	.wr_burst_addr              (wr_burst_addr            ),
	.wr_burst_data_req          (wr_burst_data_req        ),
	.wr_burst_data              (wr_burst_data            ),
	.wr_burst_finish            (wr_burst_finish          ),
	.write_clk                  (adc_clk                ),
	.write_req                  (write_req                ),
	.write_req_ack              (write_req_ack            ),
	.write_finish               (write_finish             ),
	.write_addr_0               (24'd0                    ),
	.write_addr_1               (24'd2073600              ),
	.write_addr_2               (24'd4147200              ),
	.write_addr_3               (24'd6220800              ),
	.write_addr_index           (2'd0                     ),
	.write_len                  (sample_len/4             ), //frame size  
	.write_en                   (write_en                 ),
	.write_data                 (write_data               )
);
ddr3 u_ddr3 (
	// Memory interface ports
	.ddr3_addr                      (ddr3_addr), 
	.ddr3_ba                        (ddr3_ba), 
	.ddr3_cas_n                     (ddr3_cas_n), 
	.ddr3_ck_n                      (ddr3_ck_n), 
	.ddr3_ck_p                      (ddr3_ck_p),
	.ddr3_cke                       (ddr3_cke),  
	.ddr3_ras_n                     (ddr3_ras_n), 
	.ddr3_reset_n                   (ddr3_reset_n), 
	.ddr3_we_n                      (ddr3_we_n),  
	.ddr3_dq                        (ddr3_dq),  
	.ddr3_dqs_n                     (ddr3_dqs_n),  
	.ddr3_dqs_p                     (ddr3_dqs_p),  
	.init_calib_complete            (init_calib_complete),  
	 
	.ddr3_cs_n                      (ddr3_cs_n),  
	.ddr3_dm                        (ddr3_dm),  
	.ddr3_odt                       (ddr3_odt),  
	// Application interface ports
	.ui_clk                         (ui_clk), 
	.ui_clk_sync_rst                (ui_clk_sync_rst),  // output			ui_clk_sync_rst
	.mmcm_locked                    (),  // output			mmcm_locked
	.aresetn                        (1'b1),  // input			aresetn
	.app_sr_req                     (1'b0),  // input			app_sr_req
	.app_ref_req                    (1'b0),  // input			app_ref_req
	.app_zq_req                     (1'b0),  // input			app_zq_req
	.app_sr_active                  (),  // output			app_sr_active
	.app_ref_ack                    (),  // output			app_ref_ack
	.app_zq_ack                     (),  // output			app_zq_ack
	// Slave Interface Write Address Ports
	.s_axi_awid                     (s00_axi_awid),  // input [0:0]			s_axi_awid
	.s_axi_awaddr                   (s00_axi_awaddr),  // input [29:0]			s_axi_awaddr
	.s_axi_awlen                    (s00_axi_awlen),  // input [7:0]			s_axi_awlen
	.s_axi_awsize                   (s00_axi_awsize),  // input [2:0]			s_axi_awsize
	.s_axi_awburst                  (s00_axi_awburst),  // input [1:0]			s_axi_awburst
	.s_axi_awlock                   (s00_axi_awlock),  // input [0:0]			s_axi_awlock
	.s_axi_awcache                  (s00_axi_awcache),  // input [3:0]			s_axi_awcache
	.s_axi_awprot                   (s00_axi_awprot),  // input [2:0]			s_axi_awprot
	.s_axi_awqos                    (s00_axi_awqos),  // input [3:0]			s_axi_awqos
	.s_axi_awvalid                  (s00_axi_awvalid),  // input			s_axi_awvalid
	.s_axi_awready                  (s00_axi_awready),  // output			s_axi_awready
	// Slave Interface Write Data Ports
	.s_axi_wdata                    (s00_axi_wdata),  // input [63:0]			s_axi_wdata
	.s_axi_wstrb                    (s00_axi_wstrb),  // input [7:0]			s_axi_wstrb
	.s_axi_wlast                    (s00_axi_wlast),  // input			s_axi_wlast
	.s_axi_wvalid                   (s00_axi_wvalid),  // input			s_axi_wvalid
	.s_axi_wready                   (s00_axi_wready),  // output			s_axi_wready
	// Slave Interface Write Response Ports
	.s_axi_bid                      (s00_axi_bid),  // output [0:0]			s_axi_bid
	.s_axi_bresp                    (s00_axi_bresp),  // output [1:0]			s_axi_bresp
	.s_axi_bvalid                   (s00_axi_bvalid),  // output			s_axi_bvalid
	.s_axi_bready                   (s00_axi_bready),  // input			s_axi_bready
	// Slave Interface Read Address Ports
	.s_axi_arid                     (s00_axi_arid),  // input [0:0]			s_axi_arid
	.s_axi_araddr                   (s00_axi_araddr),  // input [29:0]			s_axi_araddr
	.s_axi_arlen                    (s00_axi_arlen),  // input [7:0]			s_axi_arlen
	.s_axi_arsize                   (s00_axi_arsize),  // input [2:0]			s_axi_arsize
	.s_axi_arburst                  (s00_axi_arburst),  // input [1:0]			s_axi_arburst
	.s_axi_arlock                   (s00_axi_arlock),  // input [0:0]			s_axi_arlock
	.s_axi_arcache                  (s00_axi_arcache),  // input [3:0]			s_axi_arcache
	.s_axi_arprot                   (s00_axi_arprot),  // input [2:0]			s_axi_arprot
	.s_axi_arqos                    (s00_axi_arqos),  // input [3:0]			s_axi_arqos
	.s_axi_arvalid                  (s00_axi_arvalid),  // input			s_axi_arvalid
	.s_axi_arready                  (s00_axi_arready),  // output			s_axi_arready
	// Slave Interface Read Data Ports
	.s_axi_rid                      (s00_axi_rid),  // output [0:0]			s_axi_rid
	.s_axi_rdata                    (s00_axi_rdata),  // output [63:0]			s_axi_rdata
	.s_axi_rresp                    (s00_axi_rresp),  // output [1:0]			s_axi_rresp
	.s_axi_rlast                    (s00_axi_rlast),  // output			s_axi_rlast
	.s_axi_rvalid                   (s00_axi_rvalid),  // output			s_axi_rvalid
	.s_axi_rready                   (s00_axi_rready),  // input			s_axi_rready
	// System Clock Ports
	.sys_clk_i                      (clk_200MHz),
	.sys_rst                        (rst_n) // input sys_rst
);

aq_axi_master u_aq_axi_master
	(
	  .ARESETN                     (~ui_clk_sync_rst                          ),
	  .ACLK                        (ui_clk                                    ),
	  .M_AXI_AWID                  (s00_axi_awid                              ),
	  .M_AXI_AWADDR                (s00_axi_awaddr                            ),
	  .M_AXI_AWLEN                 (s00_axi_awlen                             ),
	  .M_AXI_AWSIZE                (s00_axi_awsize                            ),
	  .M_AXI_AWBURST               (s00_axi_awburst                           ),
	  .M_AXI_AWLOCK                (s00_axi_awlock                            ),
	  .M_AXI_AWCACHE               (s00_axi_awcache                           ),
	  .M_AXI_AWPROT                (s00_axi_awprot                            ),
	  .M_AXI_AWQOS                 (s00_axi_awqos                             ),
	  .M_AXI_AWUSER                (s00_axi_awuser                            ),
	  .M_AXI_AWVALID               (s00_axi_awvalid                           ),
	  .M_AXI_AWREADY               (s00_axi_awready                           ),
	  .M_AXI_WDATA                 (s00_axi_wdata                             ),
	  .M_AXI_WSTRB                 (s00_axi_wstrb                             ),
	  .M_AXI_WLAST                 (s00_axi_wlast                             ),
	  .M_AXI_WUSER                 (s00_axi_wuser                             ),
	  .M_AXI_WVALID                (s00_axi_wvalid                            ),
	  .M_AXI_WREADY                (s00_axi_wready                            ),
	  .M_AXI_BID                   (s00_axi_bid                               ),
	  .M_AXI_BRESP                 (s00_axi_bresp                             ),
	  .M_AXI_BUSER                 (s00_axi_buser                             ),
	  .M_AXI_BVALID                (s00_axi_bvalid                            ),
	  .M_AXI_BREADY                (s00_axi_bready                            ),
	  .M_AXI_ARID                  (s00_axi_arid                              ),
	  .M_AXI_ARADDR                (s00_axi_araddr                            ),
	  .M_AXI_ARLEN                 (s00_axi_arlen                             ),
	  .M_AXI_ARSIZE                (s00_axi_arsize                            ),
	  .M_AXI_ARBURST               (s00_axi_arburst                           ),
	  .M_AXI_ARLOCK                (s00_axi_arlock                            ),
	  .M_AXI_ARCACHE               (s00_axi_arcache                           ),
	  .M_AXI_ARPROT                (s00_axi_arprot                            ),
	  .M_AXI_ARQOS                 (s00_axi_arqos                             ),
	  .M_AXI_ARUSER                (s00_axi_aruser                            ),
	  .M_AXI_ARVALID               (s00_axi_arvalid                           ),
	  .M_AXI_ARREADY               (s00_axi_arready                           ),
	  .M_AXI_RID                   (s00_axi_rid                               ),
	  .M_AXI_RDATA                 (s00_axi_rdata                             ),
	  .M_AXI_RRESP                 (s00_axi_rresp                             ),
	  .M_AXI_RLAST                 (s00_axi_rlast                             ),
	  .M_AXI_RUSER                 (s00_axi_ruser                             ),
	  .M_AXI_RVALID                (s00_axi_rvalid                            ),
	  .M_AXI_RREADY                (s00_axi_rready                            ),
	  .MASTER_RST                  (1'b0                                     ),
	  .WR_START                    (wr_burst_req                             ),
	  .WR_ADRS                     ({wr_burst_addr,3'd0}                     ),
	  .WR_LEN                      ({wr_burst_len,3'd0}                      ),
	  .WR_READY                    (                                         ),
	  .WR_FIFO_RE                  (wr_burst_data_req                        ),
	  .WR_FIFO_EMPTY               (1'b0                                     ),
	  .WR_FIFO_AEMPTY              (1'b0                                     ),
	  .WR_FIFO_DATA                (wr_burst_data                            ),
	  .WR_DONE                     (wr_burst_finish                          ),
	  .RD_START                    (rd_burst_req                             ),
	  .RD_ADRS                     ({rd_burst_addr,3'd0}                     ),
	  .RD_LEN                      ({rd_burst_len,3'd0}                      ),
	  .RD_READY                    (                                         ),
	  .RD_FIFO_WE                  (rd_burst_data_valid                      ),
	  .RD_FIFO_FULL                (1'b0                                     ),
	  .RD_FIFO_AFULL               (1'b0                                     ),
	  .RD_FIFO_DATA                (rd_burst_data                            ),
	  .RD_DONE                     (rd_burst_finish                          ),
	  .DEBUG                       (                                         )
);
endmodule