module smg_interface
(
     input                   sys_clk,
	 input                   rst_n,
	 input                   sign,
	 input [23:0]            Number_Sig,
	 output [7:0]            SMG_Data,
	 output [5:0]            Scan_Sig
);

    /******************************************/
	 
	 wire [3:0]Number_Data;
	 wire[7:0] SMG_Data_1; 
	 wire[7:0] SMG_Data_2;   
	 smg_control_module U1
	 (
	      .sys_clk            ( sys_clk         ),
		  .rst_n              ( rst_n           ),
		  .Number_Sig         ({sign,Number_Sig}),    // input - from top
		  .Number_Data        ( Number_Data     )   // output - to U2
	 );
	 
	 /******************************************/
	 
    smg_encode_module U2
	 (
	      .sys_clk             ( sys_clk       ),
		  .rst_n               ( rst_n         ),
		  .Number_Data         ( Number_Data   ),   // input - from U2
		  .SMG_Data            ( SMG_Data_1    )          // output - to top
	 );
	 
    smg_encode_point U3
  (
       .sys_clk             ( sys_clk         ),
       .rst_n               ( rst_n           ),
       .Number_Data         ( Number_Data     ),   // input - from U2
       .SMG_Data            ( SMG_Data_2      )          // output - to top
  );
	 /*******************************************/
	 
 smg_scan_module U4
 (
      .sys_clk             ( sys_clk         ),
      .rst_n               ( rst_n           ),
      .Scan_Sig            ( Scan_Sig        )  // output - to top
 );
smg_encode_sel U5
 (
     .Scan_Sig              (Scan_Sig       ),
     .SMG_Data_1            (SMG_Data_1     ),
     .SMG_Data_2            (SMG_Data_2     ),
     .SMG_Data              (SMG_Data       )
 ); 
/*******************************************/	 	
endmodule
