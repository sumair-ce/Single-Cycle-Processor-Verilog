`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:59 03/09/2024 
// Design Name: 
// Module Name:    ProgramCounter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(clk,rst,BranchSignal,JumpSignal,Jump_addr,PC,PCsrc,branch_address);
input clk,rst,BranchSignal,JumpSignal,PCsrc;
input [15:0]branch_address;
input [31:0] Jump_addr;
output reg [31:0] PC;


reg [31:0]temp;
reg allowMe;

always@(*) begin allowMe=BranchSignal && PCsrc; end
always@(*) begin temp={16'b0,branch_address}; end

always @(posedge clk or posedge rst)
begin
if(rst) begin PC<=0; end
else begin
	if(JumpSignal) begin
		PC<=PC+Jump_addr; end
	else begin=
		if(allowMe==1) begin PC<=PC+temp; end
		else begin PC<=PC+1; end
	end
end end

endmodule
