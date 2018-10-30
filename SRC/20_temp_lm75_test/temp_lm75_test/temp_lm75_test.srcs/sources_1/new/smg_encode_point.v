`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: alinx
// Engineer: lhj
// 
// Create Date: 2018/03/28 10:43:55
// Design Name: 
// Module Name: smg_encode_point
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
module smg_encode_point(
 input sys_clk,
 input rst_n,
 input [3:0]Number_Data,
 output [7:0]SMG_Data
);

 /***************************************/
 
 parameter _0 = 8'b0100_0000, _1 = 8'b0111_1001, _2 = 8'b0010_0100, 
             _3 = 8'b0011_0000, _4 = 8'b0001_1001, _5 = 8'b0001_0010, 
             _6 = 8'b0000_0010, _7 = 8'b0111_1000, _8 = 8'b0000_0000,
             _9 = 8'b0001_0000, _A= 8'b0000_1000,_B = 8'b0000_0011,_C= 8'b0100_0110,
             _D = 8'b0010_0001, _E= 8'b0000_0110,_F= 8'b0000_1110;
 
 /***************************************/
 
 reg [7:0]rSMG;

 always @ ( posedge sys_clk or negedge rst_n )
     if( !rst_n )
          begin
                rSMG <= 8'b1111_1111;
            end
    else 
           case( Number_Data )
               
                  4'd0 : rSMG <= _0;
                  4'd1 : rSMG <= _1;
                  4'd2 : rSMG <= _2;
                  4'd3 : rSMG <= _3;
                  4'd4 : rSMG <= _4;
                  4'd5 : rSMG <= _5;
                  4'd6 : rSMG <= _6;
                  4'd7 : rSMG <= _7;
                  4'd8 : rSMG <= _8;
                  4'd9 : rSMG <= _9;
                  4'ha : rSMG <= _A;
                  4'hb : rSMG <= _B;
                  4'hc : rSMG <= _C;
                  4'hd : rSMG <= _D;
                  4'he : rSMG <= _E;
                  4'hf : rSMG <= _F;
                  
             endcase
          
 /***************************************/
 
 assign SMG_Data = rSMG;
 
 /***************************************/
endmodule
