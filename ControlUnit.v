`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:14 03/16/2024 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(Inst_opcode,RegDst,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump);
input [5:0]Inst_opcode;
output reg RegDst,ALUsrc,RegWrite,MemRead,MemWrite,Branch,Jump;
output reg [1:0] MemtoReg;


always @(*) begin
	case(Inst_opcode)
		6'b000000: //R type
			begin RegDst<=1; ALUsrc<=0; MemtoReg<=2'b00; RegWrite<=1; MemRead<=0; MemWrite<=0; Branch<=0; Jump<=0; end
		6'b000001: //beq 
			begin RegDst<=1; ALUsrc<=0; MemtoReg<=2'b00; RegWrite<=0; MemRead<=0; MemWrite<=0; Branch<=1; Jump<=0; end
		6'b000010: //lw
			begin RegDst<=0; ALUsrc<=1; MemtoReg<=2'b01; RegWrite<=1; MemRead<=1; MemWrite<=0; Branch<=0; Jump<=0; end
		6'b000011: //sw
			begin RegDst<=0; ALUsrc<=1; MemtoReg<=2'b00; RegWrite<=0; MemRead<=0; MemWrite<=1; Branch<=0; Jump<=0; end
		6'b000100: //j
			begin RegDst<=0; ALUsrc<=1; MemtoReg<=2'b00; RegWrite<=0; MemRead<=0; MemWrite<=0; Branch<=0; Jump<=1; end
	endcase
end

endmodule
