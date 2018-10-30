`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 15:36:29
// Design Name: 
// Module Name: smg_interface_demo
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
module smg_interface_demo(
    input                  sys_clk,
	input                  rst_n,
	output [7:0]           SMG_Data,
	output [5:0]           Scan_Sig
);

/******************************/ 
wire [23:0]Number_Sig;
demo_control_module U1
 (
     .sys_clk          ( sys_clk      ),
     .rst_n            ( rst_n        ),
     .Number_Sig       ( Number_Sig   ) // output - to U2
 );
 
/******************************/ 
 
 smg_interface U2
 (
     .sys_clk            ( sys_clk    ),
     .rst_n              ( rst_n      ),
     .Number_Sig         ( Number_Sig ), // input - from U1
     .SMG_Data           ( SMG_Data   ),     // output - to top
     .Scan_Sig           ( Scan_Sig   )      // output - to top
 );
 
/******************************/ 
endmodule
