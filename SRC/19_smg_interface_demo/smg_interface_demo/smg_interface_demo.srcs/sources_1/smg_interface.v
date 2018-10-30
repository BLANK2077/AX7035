module smg_interface
(
     input                   sys_clk,
	 input                   rst_n,
	 input [23:0]            Number_Sig,
	 output [7:0]            SMG_Data,
	 output [5:0]            Scan_Sig
);

    /******************************************/
	 
	 wire [3:0]Number_Data;
	 
	 smg_control_module U1
	 (
	      .sys_clk            (sys_clk        ),
		  .rst_n              ( rst_n         ),
		  .Number_Sig         ( Number_Sig    ),    // input - from top
		  .Number_Data        ( Number_Data   )   // output - to U2
	 );
	 
	 /******************************************/
	 
    smg_encode_module U2
	 (
	      .sys_clk             (sys_clk      ),
		  .rst_n               (rst_n        ),
		  .Number_Data         ( Number_Data ),   // input - from U2
		  .SMG_Data            ( SMG_Data    )          // output - to top
	 );
	 
	 /*******************************************/
	 
	 smg_scan_module U3
	 (
	      .sys_clk             (sys_clk      ),
		  .rst_n               ( rst_n       ),
		  .Scan_Sig            ( Scan_Sig    )  // output - to top
	 );
	 
	 /*******************************************/
	 
	 

endmodule
