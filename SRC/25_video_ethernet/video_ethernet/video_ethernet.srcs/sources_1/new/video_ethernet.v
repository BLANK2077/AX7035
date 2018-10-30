`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/03 09:20:29
// Design Name: 
// Module Name: video_ethernet
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module video_ethernet(
input                       sys_clk,
input                       key,
input                       rst_n,
//COMS1
inout                       cmos1_scl,          //cmos i2c clock
inout                       cmos1_sda,          //cmos i2c data
input                       cmos1_vsync,        //cmos vsync
input                       cmos1_href,         //cmos hsync refrence,data valid
input                       cmos1_pclk,         //cmos pxiel clock
input   [9:0]               cmos1_db,           //cmos data
output                      cmos1_rst_n,        //cmos reset
//COMS2      
inout                       cmos2_scl,          //cmos i2c clock
inout                       cmos2_sda,          //cmos i2c data
input                       cmos2_vsync,        //cmos vsync
input                       cmos2_href,         //cmos hsync refrence,data valid
input                       cmos2_pclk,         //cmos pxiel clock
input   [9:0]               cmos2_db,           //cmos data
output                      cmos2_rst_n,        //cmos reset
/*******************************ethernet***********************/
output                      e_mdc,                      //MDIO的时钟信号，用于读写PHY的寄存器
inout                       e_mdio,                     //MDIO的数据信号，用于读写PHY的寄存器      
output                      e_reset,                   
output   [3:0]              rgmii_txd,                  //RGMII 发?数捿
output                      rgmii_txctl,                //RGMII 发?数据有效信叿
output                      rgmii_txc,                  //125Mhz ethernet rgmii tx clock
input    [3:0]              rgmii_rxd,                  //RGMII 接收数据
input                       rgmii_rxctl,                //RGMII 接收数据有效信号
input                       rgmii_rxc               //125Mhz ethernet gmii rx clock
    );
wire                        clk_50m;
wire[9:0]                   cmos1_lut_index;
wire[31:0]                  cmos1_lut_data;
wire[9:0]                   cmos2_lut_index;
wire[31:0]                  cmos2_lut_data; 
    
wire   [ 7:0]   gmii_txd;
wire            gmii_tx_en;
wire            gmii_tx_er;
wire            gmii_tx_clk;
wire            gmii_crs;
wire            gmii_col;
wire   [ 7:0]   gmii_rxd;
wire            gmii_rx_dv;
wire            gmii_rx_er;
wire            gmii_rx_clk;
wire  [ 1:0]    speed_selection; // 1x gigabit, 01 100Mbps, 00 10mbps
wire            duplex_mode;     // 1 full, 0 half

assign cmos1_rst_n = 1'b1;
assign cmos2_rst_n = 1'b1;
wire reg_conf_done_coms1;
wire reg_conf_done_coms2;
wire reg_conf_done;

//MDIO config
assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;
miim_top miim_top_m0(
.reset_i            (1'b0),
.miim_clock_i       (gmii_tx_clk),
.mdc_o              (e_mdc),
.mdio_io            (e_mdio),
.link_up_o          (),                  //link status
.speed_o            (),                  //link speed
.speed_override_i   (2'b11)              //11: autonegoation
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

//I2C master controller
i2c_config i2c_config_m0(
	.rst                        (~rst_n                   ),
	.clk                        (sys_clk                  ),
	.clk_div_cnt                (16'd500                  ),
	.i2c_addr_2byte             (1'b1                     ),
	.lut_index                  (cmos1_lut_index          ),
	.lut_dev_addr               (cmos1_lut_data[31:24]    ),
	.lut_reg_addr               (cmos1_lut_data[23:8]     ),
	.lut_reg_data               (cmos1_lut_data[7:0]      ),
	.error                      (                         ),
	.done                       (                         ),
	.i2c_scl                    (cmos1_scl                ),
	.i2c_sda                    (cmos1_sda                )
);
//configure look-up table
lut_ov5640_rgb565_800_600 lut_ov5640_rgb565_800_600_m0(
	.lut_index                  (cmos1_lut_index          ),
	.lut_data                   (cmos1_lut_data           )
);

//I2C master controller
i2c_config i2c_config_m1( 
	.rst                        (~rst_n                   ),
	.clk                        (sys_clk                  ),
	.clk_div_cnt                (16'd500                  ),
	.i2c_addr_2byte             (1'b1                     ),
	.lut_index                  (cmos2_lut_index          ),
	.lut_dev_addr               (cmos2_lut_data[31:24]    ),
	.lut_reg_addr               (cmos2_lut_data[23:8]     ),
	.lut_reg_data               (cmos2_lut_data[7:0]      ),
	.error                      (                         ),
	.done                       (                         ),
	.i2c_scl                    (cmos2_scl                ),
	.i2c_sda                    (cmos2_sda                )
);
//configure look-up table
lut_ov5640_rgb565_800_600 lut_ov5640_rgb565_800_600_m1(
	.lut_index                  (cmos2_lut_index           ),
	.lut_data                   (cmos2_lut_data            )
);


//CMOS 图像信号按键切换
wire cmos_pclk;
wire cmos_vsync;
wire cmos_href;
wire [7:0] cmos_db;
cmos_select	cmos_select_inst(
	.clk                    (sys_clk),
	.reset_n                (rst_n),	
	.key1                   (key),
	
	.cmos_pclk              (cmos_pclk),
    .cmos_vsync             (cmos_vsync),        
    .cmos_href              (cmos_href),
    .cmos_d                 (cmos_db),	
	
	.cmos1_pclk             (cmos1_pclk),
    .cmos1_vsync            (cmos1_vsync),        
    .cmos1_href             (cmos1_href),
    .cmos1_d                (cmos1_db[9:2]),
    	
	.cmos2_pclk             (cmos2_pclk),
	.cmos2_vsync            (cmos2_vsync),		
	.cmos2_href             (cmos2_href),
	.cmos2_d                (cmos2_db[9:2])
);

wire       cmos_vsync_delay;
wire       cmos_href_delay;
wire [7:0] cmos_data_delay;


camera_delay camera_delay_inst
(
   .cmos_pclk          (cmos_pclk),              //cmos pxiel clock
   .cmos_href          (cmos_href),              //cmos hsync refrence
   .cmos_vsync         (cmos_vsync),             //cmos vsync
   .cmos_data          (cmos_db),              //cmos data

   .cmos_href_delay    (cmos_href_delay),              //cmos hsync refrence
   .cmos_vsync_delay   (cmos_vsync_delay),             //cmos vsync
   .cmos_data_delay    (cmos_data_delay)             //cmos data
) ;

//////////////////// CMOS FIFO/////////////////// 
wire [10 : 0] fifo_data_count;
wire [7:0] fifo_data;
wire fifo_rd_en;

camera_fifo camera_fifo_inst (
  .rst                      (cmos_vsync),   // input rst
  .wr_clk                   (cmos_pclk),                   // input wr_clk
  .din                      (cmos_data_delay),                   // input [7 : 0] din
  .wr_en                    (cmos_href_delay),                    // input wr_en
  
  .rd_clk                   (gmii_rx_clk),                         // input rd_clk
  .rd_en                    (fifo_rd_en),                    // input rd_en
  .dout                     (fifo_data),                     // output [7 : 0] dout
  .full                     (          ),                     // output full
  .empty                    (          ),                    // output empty
  .rd_data_count            (fifo_data_count)                // output [10 : 0] rd_data_count
);


mac_test mac_test0
(
 .gmii_tx_clk            (gmii_tx_clk),
 .gmii_rx_clk            (gmii_rx_clk) ,
 .rst_n                  (     rst_n ),
 
 .cmos_vsync              (cmos_vsync),
 .cmos_href               (cmos_href),
 .reg_conf_done           (reg_conf_done),
 .fifo_data               (fifo_data),           //FIFO璇诲嚭鐨?8bit鏁版嵁/
 .fifo_data_count         (fifo_data_count),     //(fifo_rdusedw),     //FIFO涓殑鏁版嵁鏁伴噺
 .fifo_rd_en              (fifo_rd_en),          //FIFO璇讳娇鑳? 
 
 
 .udp_send_data_length   (16'd1024), 
 .gmii_rx_dv             (gmii_rx_dv),
 .gmii_rxd               (gmii_rxd  ),
 .gmii_tx_en             (gmii_tx_en ),
 .gmii_txd               (gmii_txd )
 
);	

reset reset_m0
(
	.clk(sys_clk),
	.key1(rst_n),
	.rst_n(e_reset)
);
endmodule
