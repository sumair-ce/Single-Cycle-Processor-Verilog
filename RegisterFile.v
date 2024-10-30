`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:16 03/15/2024 
// Design Name: 
// Module Name:    Registerfile 
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
module  RegisterFile #(parameter N=32, Depth=16)(MemtoReg_signal,RegWriteSignal,RegDestination,clk,op,rs,rt,rd,re,we,shamt,ftn, writeData,writeData2,,writeData3,writeData4,read_data_1, read_data_2);
input [4:0] rs,rt,rd;
input [5:0] op,shamt,ftn;
input [N-1:0] writeData,writeData2,writeData3,writeData4;
input re,we,clk,RegDestination,RegWriteSignal;
input [1:0] MemtoReg_signal;
output reg [N-1:0] read_data_1, read_data_2;
reg [N-1:0] registerfile [Depth-1:0];

reg [4:0] temp_reg;

initial begin
$readmemh("regfile.txt", registerfile,0,15);
end

/*always @(*) begin
  // Read operations
  read_data_1 <= registerfile[rs];
  read_data_2 <= registerfile[rt];

  // Write operations (conditioned on clock edge)
  if (RegWriteSignal) begin
    if (MemtoReg_signal==2'b01) begin
      registerfile[rt] <= writeData2;
    end
	 else if(MemtoReg_signal==2'b00) begin
      registerfile[rd] <= writeData;
    end
	 else if (MemtoReg_signal==2'b10)begin
	   registerfile[rt] <= writeData3;
		end
  end
end*/

always @(*) begin
if (RegDestination) begin
temp_reg=rd;
end
else begin temp_reg =rt; end
end

    always @(*) begin
        // Read operations
        read_data_1 <= registerfile[rs];
        read_data_2 <= registerfile[rt];

        // Write operations
        if (RegWriteSignal) begin
            case (MemtoReg_signal)
                2'b01: registerfile[temp_reg] <= writeData2;
                2'b00: registerfile[temp_reg] <= writeData;
                2'b10: registerfile[temp_reg] <= writeData3;
                default: registerfile[temp_reg] <= writeData; // Default to writing to rd
            endcase
        end
    end

/*if (op==6'b000000) begin registerfile[temp_reg] <= writeData; end
									  else if (op==6'b000110) begin registerfile[temp_reg] <= writeData4; end
							  end*/

endmodule
