`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:38 03/08/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] in_1, in_2,
    input [1:0] ALUop,
	 input [15:0] offset,
	 input [5:0] Opcod,
    output reg [31:0] result,
    output reg [31:0] result2,
    output reg zeroflag,
    input ALUsource
);

reg [31:0] offset_temp;
always @(*) begin
offset_temp <= {16'b0, offset};
end


always @(*) begin
	if (ALUsource==1'b0) begin
    case (ALUop)
        2'b00: begin result = in_1 + in_2; result2=32'hxxxxxxxx; end
        2'b01: begin result = in_2 - in_1; result2=32'hxxxxxxxx; end
        2'b10: begin result = in_1 * in_2; result2=32'hxxxxxxxx; end
        2'b11: begin result = ~ in_1; result2=32'hxxxxxxxx; end
        default: result = 32'hxxxxxxxx;
    endcase end
	  
	 else if (ALUsource==1'b1) begin
		result2 = in_1 + offset_temp; result=32'hxxxxxxxx;
	 end
	 
end

always @(result,result2) begin
    zeroflag = (result == 0) ? 1'b1 : 1'b0;
end

endmodule



