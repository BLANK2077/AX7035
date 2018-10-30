//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
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
  
//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/7/24    meisq         1.0         Original
//*************************************************************************/
`timescale 1ps/1ps
module top
(
	input                              rst_n,	                //reset input
	input                              key,                   //record play button
	output[3:0]                        led,
	input                              wm8731_bclk,            //audio bit clock
	input                              wm8731_daclrc,          //DAC sample rate left right clock
	output                             wm8731_dacdat,          //DAC audio data output 
	input                              wm8731_adclrc,          //ADC sample rate left right clock
	input                              wm8731_adcdat,          //ADC audio data input
	inout                              wm8731_scl,             //I2C clock
	inout                              wm8731_sda,             //I2C data
	output                             sd_ncs,                 //SD card chip select (SPI mode)
    output                             sd_dclk,                //SD card clock
    output                             sd_mosi,                //SD card controller data output
    input                              sd_miso,                //SD card controller data input	
	//system clocks
	input                              sys_clk
);
wire[9:0]                       lut_index;
wire[31:0]                      lut_data;
wire[3:0]                       state_code;
assign led = state_code;

//I2C master controller
i2c_config i2c_config_m0(
	.rst                        (~rst_n                   ),
	.clk                        (sys_clk                 ),
	.clk_div_cnt                (16'd99                   ),//99:100Khz
	.i2c_addr_2byte             (1'b0                     ),
	.lut_index                  (lut_index                ),
	.lut_dev_addr               (lut_data[31:24]          ),
	.lut_reg_addr               (lut_data[23:8]           ),
	.lut_reg_data               (lut_data[7:0]            ),
	.error                      (                         ),
	.done                       (                         ),
	.i2c_scl                    (wm8731_scl               ),
	.i2c_sda                    (wm8731_sda               )
);
//configure look-up table
lut_wm8731 lut_wm8731_m0(
	.lut_index                  (lut_index                ),
	.lut_data                   (lut_data                 )
);
//with a led display of state_code
// 0(4'b0000):SD card is initializing
// 1(4'b0001):wait for the button to press
// 2(4'b0010):looking for the WAV file
// 3(4'b0011):playing
sd_card_audio  sd_card_audio_m0(
	.clk                        (sys_clk                 ),
	.rst_n                      (rst_n                    ),
	.key1                       (key                      ),
	.state_code                 (state_code               ),
	.bclk                       (wm8731_bclk              ),
	.daclrc                     (wm8731_daclrc            ),
	.dacdat                     (wm8731_dacdat            ),
	.adclrc                     (wm8731_adclrc            ),
	.adcdat                     (wm8731_adcdat            ),
	.sd_ncs                     (sd_ncs                   ),
	.sd_dclk                    (sd_dclk                  ),
	.sd_mosi                    (sd_mosi                  ),
	.sd_miso                    (sd_miso                  )
);

endmodule
