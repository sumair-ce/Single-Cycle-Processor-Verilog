`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:15 03/23/2024
// Design Name:   Tmodule
// Module Name:   E:/Academics/CSA/Projects/Lab04/tb_TModule.v
// Project Name:  Lab04
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Tmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_TModule;

	// Inputs
	reg clk;
	reg clk2;
	reg reset;
	reg [2:0] sw;

	// Outputs
	wire [3:0] ENABLE;
	wire [6:0] LEDOUT;

	// Instantiate the Unit Under Test (UUT)
	Tmodule uut (
		.clk(clk), 
		.clk2(clk2), 
		.reset(reset), 
		.sw(sw), 
		.ENABLE(ENABLE), 
		.LEDOUT(LEDOUT)
	);

	always begin #1 clk=~clk; end

	initial begin
		// Initialize Inputs
		clk = 0;
		reset=1;
		// Wait 100 ns for global reset to finish
		#1;
		reset=0;
		
		
		
		
        
		  
		// Add stimulus here

	end      
endmodule

