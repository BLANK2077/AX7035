
module ft232h
(   input          sys_clk,
	input          ft_clk,
	input          rst,
	input          ft_rxf_n,  //Data available
	input          ft_txe_n,  //Space available
	output         ft_oe_n,
	output reg     ft_rd_n,
	output         ft_wr_n,
	inout[7:0]     ft_data
);
localparam IDLE   = 0;
localparam READ   = 1;
localparam WRITE  = 2;

reg[3:0]           state;
reg                buf_wr;
reg[7:0]           buf_data;
wire[7:0]          ft_data_out;
wire[9:0]          rd_data_count;
wire[9:0]          wr_data_count;
wire               buf_empty;
wire               buf_full;
wire               buf_rd;

reg               ft_oe_n_d0;
assign ft_oe_n = (state == READ) ? 1'b0 : 1'b1;

assign ft_data = (ft_oe_n == 1'b0) ? 8'hzz : ft_data_out;
assign ft_wr_n = (state == WRITE && ft_txe_n == 1'b0 && buf_empty == 1'b0) ? 1'b0 : 1'b1;
assign buf_rd =  (state == WRITE && ft_txe_n == 1'b0 && buf_empty == 1'b0) ? 1'b1 : 1'b0;
 reg[5:0] cnt_clr;
 reg aclr;
 always@(posedge ft_clk or posedge rst)
 begin
     if(rst == 1'b1)
         cnt_clr<= 6'b0;
     else if(cnt_clr>10)
         aclr<=1'b0;
     else begin
         aclr <= 1'b1;
         cnt_clr<=cnt_clr+1'b1;
         end
 end
 wire pll_clk;
 clk_wiz_0 instance_name
    (
      // Clock out ports
      .clk_out1(pll_clk),     // output clk_out1
      // Status and control signals
      .reset(1'b0),          // input reset
      .locked(),            // output locked
      // Clock in ports
      .clk_in1(sys_clk));   // input clk_in1
ft_buf ft_buf_m0(
      .rst(1'b0   ),                      // input wire rst
      .wr_clk(ft_clk),                    // input wire wr_clk
      .rd_clk(ft_clk),                   // input wire rd_clk
      .din(buf_data ),                   // input wire [7 : 0] din
      .wr_en(buf_wr),                    // input wire wr_en
      .rd_en(buf_rd),                    // input wire rd_en
      .dout(ft_data_out),                    // output wire [7 : 0] dout
      .full(buf_full ),                    // output wire full
      .empty(buf_empty),                  // output wire empty
      .rd_data_count(rd_data_count ),  // output wire [9 : 0] rd_data_count
      .wr_data_count(wr_data_count )  // output wire [9 : 0] wr_data_count
       );
always@(posedge ft_clk or posedge rst)
begin
	if(rst == 1'b1)
		ft_oe_n_d0 <= 1'b0;
	else 
		ft_oe_n_d0 <= ft_oe_n;
end

always@(posedge ft_clk or posedge rst)
begin
	if(rst == 1'b1)
		buf_wr <= 1'b0;
	else if(state == READ)
		buf_wr <= ~ft_oe_n_d0 & ~ft_rxf_n;
	else
		buf_wr <= 1'b0;
end

always@(posedge ft_clk or posedge rst)
begin
	if(rst == 1'b1)
		buf_data <= 8'd0;
	else if(state == READ)
		buf_data <= ft_data;
end

always@(posedge ft_clk or posedge rst)
begin
	if(rst == 1'b1)
		ft_rd_n <= 1'b1;
	else if(ft_rxf_n == 1'b1)
		ft_rd_n <= 1'b1;
	else if(state == READ)
		ft_rd_n <= 1'b0;
		
end
always@(posedge ft_clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		state <= IDLE;
	end
	else
		case(state)
			IDLE:
			begin
				if(ft_rxf_n == 1'b0)
				begin
					state <= READ;
				end
				else if(ft_txe_n == 1'b0 && buf_empty == 1'b0)
				begin
					state <= WRITE;
				end
			end
			READ:
			begin
				if(ft_rxf_n == 1'b1)
				begin
					state <= IDLE;
				end
			end
			WRITE:
			begin
				if(ft_txe_n == 1'b1 || buf_empty == 1'b1)
				begin
					state <= IDLE;
				end
			end
			default:
				state <= IDLE;
		endcase
end

ila_0 ila (
       .clk(pll_clk), // input wire clk              
       .probe0(ft_rd_n), // input wire [0:0]  probe0  
       .probe1(ft_wr_n), // input wire [0:0]  probe1 
       .probe2(ft_oe_n), // input wire [0:0]  probe2 
       .probe3(ft_rxf_n), // input wire [0:0]  probe3 
       .probe4(ft_txe_n), // input wire [0:0]  probe4
       .probe5(buf_wr), // input wire [0:0]  probe4ft_data
       .probe6(buf_rd), // input wire [0:0]  probe4ft_data
       .probe7(buf_data), // input wire [0:0]  probe4ft_data
       .probe8(ft_data_out), // input wire [0:0]  probe4ft_data
       .probe9(state), // input wire [0:0]  probe4ft_data
       .probe10(buf_empty), // input wire [0:0]  probe4ft_data
       .probe11(rd_data_count), // input wire [0:0]  probe4ft_data
       .probe12(wr_data_count), // input wire [0:0]  probe4ft_data
       .probe13(ft_clk) // input wire [0:0]  probe4ft_data
           );                 
endmodule