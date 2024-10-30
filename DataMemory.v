`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:19:31 03/16/2024 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(MemWriteSignal,MemReadSignal,MemAddress,MemWriteData,MemReadData);
input MemWriteSignal,MemReadSignal;
input [31:0] MemAddress,MemWriteData;
output reg [31:0] MemReadData;

reg [31:0] dataMem [15:0];

initial begin
$readmemh("datamem.txt", dataMem,0,15);
end

always @(MemWriteSignal or MemAddress) begin
	if(MemWriteSignal) begin dataMem[MemAddress]<= MemWriteData; end
end

always @(MemReadSignal or MemAddress) begin
	if(MemReadSignal) begin MemReadData<= dataMem[MemAddress]; end
end

endmodule
