`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/28 10:41:23
// Design Name: 
// Module Name: smg_encode_sel
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


module smg_encode_sel
(
input [5:0] Scan_Sig,
input[7:0]  SMG_Data_1,
input[7:0]  SMG_Data_2,
output[7:0] SMG_Data
);

/***************************************/

reg [7:0]rSMG;

always @ (* )
begin
   case( Scan_Sig )
       
          6'b011_111 :  rSMG <=SMG_Data_1;
          6'b101_111 :  rSMG <=SMG_Data_1;
          6'b110_111:   rSMG <=SMG_Data_1;
          6'b111_011 :  rSMG <=SMG_Data_1;
          6'b111_101:   rSMG <=SMG_Data_2;
          6'b111_110:   rSMG <=SMG_Data_1;
          default:      rSMG <=rSMG;
      endcase
 end
  assign SMG_Data=rSMG;            
endmodule
