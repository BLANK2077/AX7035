
`timescale 1 ps / 1 ps

module top
(
input sys_clk,
input rst_n,
inout hdmi_ddc_scl_io,//HDMIIN
inout hdmi_ddc_sda_io,
output hdmi_hdmi_in_hpd,
output[0:0] HDMI_hdmi_in_OEN,
input TMDS_clk_hdmi_in_n,
input TMDS_clk_hdmi_in_p,
input[2:0] TMDS_data_hdmi_in_n,
input[2:0] TMDS_data_hdmi_in_p,

output [0:0]HDMI_hdmi_out_OEN,//HDMIOUT       
output TMDS_clk_hdmi_out_n,
output TMDS_clk_hdmi_out_p,
output [2:0]TMDS_data_hdmi_out_n,
output [2:0]TMDS_data_hdmi_out_p
    );
wire hdmi_ddc_scl_i;
wire hdmi_ddc_scl_o;
wire hdmi_ddc_scl_t;
wire hdmi_ddc_sda_i;
wire hdmi_ddc_sda_o;
wire hdmi_ddc_sda_t;
wire clk_200mhz;
wire[23:0] vid_pData;
wire vid_pVDE;
wire vid_pHSync;
wire vid_pVSync;

reg[23:0] vid_pData_d0;
reg vid_pVDE_d0;
reg vid_pHSync_d0;
reg vid_pVSync_d0;


reg[23:0] vid_pData_d1;
reg vid_pVDE_d1;
reg vid_pHSync_d1;
reg vid_pVSync_d1;


wire PixelClk;
wire peripheral_aresetn;
wire SerialClk;
reg hdmi_hpd_r;
wire vid_io_in_reset;
wire aPixelClkLckd;
assign HDMI_hdmi_in_OEN = 1'b0;
assign hdmi_hdmi_in_hpd = hdmi_hpd_r;
always@(posedge clk_200mhz or negedge rst_n)
begin
    if( rst_n == 1'b0)
        hdmi_hpd_r <= 1'b0;
    else
        hdmi_hpd_r <= 1'b1;
end
IOBUF hdmi_ddc_scl_iobuf
(
	.I(hdmi_ddc_scl_o),
	.IO(hdmi_ddc_scl_io),
	.O(hdmi_ddc_scl_i),
	.T(hdmi_ddc_scl_t)
);
IOBUF hdmi_ddc_sda_iobuf
(
	.I(hdmi_ddc_sda_o),
	.IO(hdmi_ddc_sda_io),
	.O(hdmi_ddc_sda_i),
	.T(hdmi_ddc_sda_t)
); 
dvi2rgb
#(
	.kEmulateDDC(1'b1),
	.kRstActiveHigh(1'b0),
	.kAddBUFG(1'b1),
	.kClkRange(1),
	.kEdidFileName("900p_edid.txt"),
	.kIDLY_TapValuePs(78),
	.kIDLY_TapWidth(5)
)
dvi2rgb_m0(
	.TMDS_Clk_p(TMDS_clk_hdmi_in_p),
	.TMDS_Clk_n(TMDS_clk_hdmi_in_n),
	.TMDS_Data_p(TMDS_data_hdmi_in_p),
	.TMDS_Data_n(TMDS_data_hdmi_in_n),
	
	.RefClk(clk_200mhz),
	.aRst(1'b0),
	.aRst_n(rst_n),
	
	.vid_pData(vid_pData),
	.vid_pVDE(vid_pVDE), 
	.vid_pHSync(vid_pHSync), 
	.vid_pVSync(vid_pVSync), 
	.PixelClk(PixelClk),
	
	.SerialClk(SerialClk),
	.aPixelClkLckd(aPixelClkLckd),
	
	.DDC_SDA_I(hdmi_ddc_sda_i),
	.DDC_SDA_O(hdmi_ddc_sda_o), 
	.DDC_SDA_T(hdmi_ddc_sda_t), 
	.DDC_SCL_I(hdmi_ddc_scl_i),
	.DDC_SCL_O(hdmi_ddc_scl_o),  
	.DDC_SCL_T(hdmi_ddc_scl_t), 
	
	.pRst(1'b0),
	.pRst_n(rst_n)
  );

always@(posedge PixelClk)
 begin
    vid_pData_d0 <= vid_pData;
    vid_pVDE_d0 <= vid_pVDE;
    vid_pHSync_d0 <= vid_pHSync;
    vid_pVSync_d0 <= vid_pVSync;


    vid_pData_d1 <= vid_pData_d0;
    vid_pVDE_d1 <= vid_pVDE_d0;
    vid_pHSync_d1 <= vid_pHSync_d0;
    vid_pVSync_d1 <= vid_pVSync_d0;

 end  
assign HDMI_hdmi_out_OEN = 1'b1;
        
  
  clk_ref clk_refm0
 (
  // Clock out ports
     .clk_out1(clk_200mhz),       // output clk_out1
  // Status and control signals
     .reset(1'b0),               // input reset
     .locked(),                  // output locked
 // Clock in ports
     .clk_in1(sys_clk));        // input clk_in1
   rgb2dvi
    #(
     .kGenerateSerialClk(1'b1),
     .kClkRange(1),     
     .kRstActiveHigh(1'b1)
   )
   rgb2dvi_m0 (
     // DVI 1.0 TMDS video interface
     .TMDS_Clk_p(TMDS_clk_hdmi_out_p),
     .TMDS_Clk_n(TMDS_clk_hdmi_out_n),
     .TMDS_Data_p(TMDS_data_hdmi_out_p),
     .TMDS_Data_n(TMDS_data_hdmi_out_n),
          
     //Auxiliary signals 
     .aRst(1'b0), //asynchronous reset; must be reset when RefClk is not within spec
     .aRst_n(1'b1), //-asynchronous reset; must be reset when RefClk is not within spec
      
     // Video in
     .vid_pData(vid_pData_d1),
     .vid_pVDE(vid_pVDE_d1),
     .vid_pHSync(vid_pHSync_d1),
     .vid_pVSync(vid_pVSync_d1),
     .PixelClk(PixelClk),
    
     .SerialClk(SerialClk)// 5x PixelClk
    ); 
endmodule

