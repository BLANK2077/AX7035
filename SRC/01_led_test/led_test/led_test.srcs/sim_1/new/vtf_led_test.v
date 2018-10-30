`timescale 100ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: vtf_led_test
//////////////////////////////////////////////////////////////////////////////////

module vtf_led_test;
	// Inputs
	reg sys_clk;
	reg rst_n;

	// Outputs
	wire [3:0] led;

	// Instantiate the Unit Under Test (UUT)
	led_test uut (
		.sys_clk(sys_clk), 		
		.rst_n(rst_n), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		sys_clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#1000;
          rst_n = 1;        
		// Add stimulus here
		#20000;
      //  $stop;
	 end
   
    always #25 sys_clk = ~ sys_clk;   //5ns一个周期，产生200MHz时钟源
   
endmodule
