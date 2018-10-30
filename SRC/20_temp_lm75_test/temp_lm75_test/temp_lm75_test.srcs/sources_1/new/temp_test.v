`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 17:28:04
// Design Name: 
// Module Name: temp_test
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


module temp_test
(
   input sys_clk,
   input rst_n,
   output scl, 
   inout sda,   
   output[5:0] Scan_Sig,
   output[7:0] SMG_Data
);
wire done;
wire[16:0] data;
i2c_read_lm75 U0
(
    .sys_clk        (sys_clk         ),
    .rst_n          (rst_n           ),
    .scl            (scl             ),
    .sda            (sda             ),
    .data           (data            )
);
wire[31:0]Data_Temp1;
wire[31:0]Data_Temp2;
wire[31:0]Data_Temp3;
wire[16:0]Data_Temp;
wire[19:0] bcd_Temp;
hextobcd U1
(//temp converse
    .clk                (sys_clk     ),
    .hex                (data        ),
    .dec                (bcd_Temp    )
);
 smg_interface U2
(
    .sys_clk            (sys_clk     ),
    .rst_n              (rst_n       ),
    .sign               (data[16]    ),
    .Number_Sig         (bcd_Temp    ), // input - from U1
    .SMG_Data           (SMG_Data    ),     // output - to top
    .Scan_Sig           (Scan_Sig    )      // output - to top
);
endmodule 
