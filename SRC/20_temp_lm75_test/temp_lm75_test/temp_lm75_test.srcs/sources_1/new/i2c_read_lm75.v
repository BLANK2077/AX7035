`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/03/14 18:14:43
// Design Name: 
// Module Name: i2c_read_lm75
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
// *************************************************************/
`define     SCL_POS          (cnt==3'd0)      
`define     SCL_HIG          (cnt==3'd1)
`define     SCL_NEG          (cnt==3'd2)     
`define     SCL_LOW          (cnt==3'd3)  
`define    DEVICE_READ        8'b1001_0001    //read device addr
//************************************************************/
module i2c_read_lm75
(
 input              sys_clk,
 input              rst_n,
 output             scl, 
 inout              sda,      
 output reg[16:0]       data
  );                       
//--------------------------------------------       
reg[2:0] cnt;  
reg[7:0] cnt_delay;    
reg scl_r;      
always @ (posedge sys_clk or negedge rst_n)
    if(!rst_n) cnt_delay <= 8'd0;
    else if(cnt_delay == 8'd199) cnt_delay <= 8'd0;   
    else cnt_delay <= cnt_delay+1'b1;

always @ (posedge sys_clk or negedge rst_n) 
begin
    if(!rst_n) cnt <= 3'd5;
    else begin
        case (cnt_delay)
            9'd49:     cnt <= 3'd1;
            9'd99:     cnt <= 3'd2; 
            9'd149:    cnt <= 3'd3;  
            9'd199:    cnt <= 3'd0; 
            default:   cnt <= 3'd5;
            endcase
        end
end
 
always @ (posedge sys_clk or negedge rst_n)
    if(!rst_n) scl_r <= 1'b0;
    else if(cnt==3'd0) scl_r <= 1'b1;
       else if(cnt==3'd2) scl_r <= 1'b0;
assign scl = scl_r;   
//---------------------------------------------               
reg[7:0] db_r;    
reg[15:0] read_data;  
//---------------------------------------------
parameter     IDLE      = 4'd0;
parameter     START     = 4'd1;
parameter     ADDR      = 4'd2;
parameter     ACK1      = 4'd3;
parameter     DATA1     = 4'd4;
parameter     ACK2      = 4'd5;
parameter     DATA2     = 4'd6;
parameter     NACK      = 4'd7;
parameter     STOP      = 4'd8;

reg[3:0] cstate;    
reg sda_r; 
reg sda_link;         
reg[3:0] num;  
reg[25:0] tim;
always @ (posedge sys_clk or negedge rst_n) 
    if(!rst_n) tim<=26'd0;
    else tim<=tim+1'b1;

always @ (posedge sys_clk or negedge rst_n) begin
    if(!rst_n) begin
            cstate <= IDLE;
            sda_r <= 1'b1;
            sda_link <= 1'b0;
            num <= 4'd0;
            read_data <= 16'd0;
        end
    else       
        case (cstate)
            IDLE:    begin
                    sda_link <= 1'b1;    
                    sda_r <= 1'b1;
                    if(tim[25]) begin 
                        db_r <= `DEVICE_READ; 
                        cstate <= START;        
                        end
                    else cstate <= IDLE;  
                end
            START: 
            begin  
             if(`SCL_HIG)
                   begin
                        sda_link <= 1'b1;  
                        sda_r <= 1'b0;        
                        cstate <= ADDR;
                        num <= 4'd0;
                        end
                    else cstate<=START;
                end
            ADDR:    begin
                    if(`SCL_LOW) begin
                            if(num == 4'd8) begin    
                                    num <= 4'd0; 
                                    sda_r <= 1'b1;
                                    sda_link <= 1'b0;  
                                    cstate <= ACK1;
                                end
                            else begin
                                    cstate <= ADDR;
                                    num <= num+1'b1;
                                    case (num)
                                        4'd0: sda_r <= db_r[7];
                                        4'd1: sda_r <= db_r[6];
                                        4'd2: sda_r <= db_r[5];
                                        4'd3: sda_r <= db_r[4];
                                        4'd4: sda_r <= db_r[3];
                                        4'd5: sda_r <= db_r[2];
                                        4'd6: sda_r <= db_r[1];
                                        4'd7: sda_r <= db_r[0];
                                        default: ;
                                        endcase
                                end
                        end
                    else cstate <= ADDR;
                end
              ACK1: begin 
                     if(!sda_r &&(`SCL_HIG))
                     begin
                     cstate<=DATA1;
                     end
                     else if(`SCL_NEG)
                      begin
                       cstate<=DATA1;
                      end
                      else cstate <= ACK1;
                     end
            DATA1:    begin
                            if(`SCL_HIG) begin
                                    num <= num+1'b1;    
                                    case (num)
                                        4'd0: read_data[15] <= sda;
                                        4'd1: read_data[14] <= sda;  
                                        4'd2: read_data[13] <= sda; 
                                        4'd3: read_data[12] <= sda; 
                                        4'd4: read_data[11] <= sda; 
                                        4'd5: read_data[10] <= sda; 
                                        4'd6: read_data[9]  <= sda; 
                                        4'd7: read_data[8]  <= sda; 
                                        default: ;
                                        endcase                                                          
                                    end
                            else if((`SCL_NEG) && (num==4'd8)) begin
                                num <= 4'd0;
                                sda_link <= 1'b1;    
                                sda_r<=1'b1;
                                cstate <= ACK2;
                                end
                            else cstate <= DATA1;
                    end    
              ACK2: begin
                    if(`SCL_LOW) begin
                       sda_r <= 1'b0; 
                        end
                    else if(`SCL_NEG)begin 
                        cstate <= DATA2;
                        sda_link <= 1'b0; 
                        sda_r<=1'b1;    
                   end    
                    else cstate <= ACK2;
                end
            DATA2:    begin
                                        
                        if(`SCL_HIG) begin    
                                num <= num+1'b1;    
                                case (num)
                                    4'd0: read_data[7] <= sda;
                                    4'd1: read_data[6] <= sda;  
                                    4'd2: read_data[5] <= sda; 
                                    4'd3: read_data[4] <= sda; 
                                    4'd4: read_data[3] <= sda; 
                                    4'd5: read_data[2] <= sda; 
                                    4'd6: read_data[1] <= sda; 
                                    4'd7: read_data[0] <= sda; 
                                    default: ;
                                    endcase                                                                     
                            end
                        else if((`SCL_LOW) && (num==4'd8)) begin
                            num <= 4'd0; 
                            sda_link <= 1'b1;       
                            sda_r<=1'b1;        
                            cstate <= NACK;
                            end
                        else cstate <= DATA2;
            end    
            
            NACK: begin
                    if(`SCL_LOW) begin
                     sda_r <= 1'b0; 
                     cstate <= STOP;                    
                        end
                    else cstate <= NACK;
                end                
            STOP:  begin if(`SCL_HIG) begin
                    sda_r <= 1'b1;
                    cstate <= IDLE;
                    end
                    else cstate <= STOP;end
            default: cstate <= IDLE;
            endcase
end

assign sda = sda_link ? sda_r:1'bz;

wire [15:0] data_conv;
wire[31:0]data_conv1;
wire[31:0]data_conv2;
assign data_conv = read_data[15] ? ~read_data[15:0]+1'b1 : read_data[15:0];
assign data_conv1=data_conv*125;
assign data_conv2=data_conv1/3200;//100*32
  //sign+转换膈的数据
always @ (posedge sys_clk or negedge rst_n) 
    if(!rst_n) data<=17'd0;
    else data <={read_data[15],data_conv2[15:0]};
endmodule
