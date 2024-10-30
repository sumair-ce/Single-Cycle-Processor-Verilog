`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:11:24 03/12/2024 
// Design Name: 
// Module Name:    TModule 
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
module Tmodule(clk,clk2,reset,sw,ENABLE,LEDOUT);

input clk,clk2,reset;
input [2:0] sw;
wire [31:0] Tresult,JUMPADDRESS;
wire [31:0] read1,read2;
wire [31:0] PCC;
wire [15:0] CONSTANT,immed;
wire ZEROFLAG;
output  [3:0] ENABLE;
output [6:0] LEDOUT;

wire [31:0] in,writeDatafromMEM,Tresult2,Tresult3;
wire [4:0] RSS,RTT,RDD; 
wire [5:0] OPP,SHAMTT,FTNN;
wire REE,WEE;
wire [1:0] ALUOPP,Mem_toReg;
wire Reg_Dst,ALU_src,Reg_Write,Mem_Read,Mem_Write,Bra_nch,Ju_mp;

// Program Counter 
ProgramCounter p1(.clk(clk), .rst(reset), .PC(PCC), .BranchSignal(Bra_nch), .JumpSignal(Ju_mp),.Jump_addr(JUMPADDRESS),.PCsrc(ZEROFLAG),.branch_address(CONSTANT));

// Instruction Memory
InstructionMemory i1(.PC(PCC),.out_instruction(in),.clk(clk));

// Decoder 
Decoder d1(.instruction(in), .clk(clk), .constant(CONSTANT),.imme(immed),.OP(OPP), .RS(RSS) , .RT(RTT), .RD(RDD), .SHAMT(SHAMTT), .FTN(FTNN), .RE(REE), .WE(WEE), .ALUOP(ALUOPP), .JumpAddress(JUMPADDRESS));

// Register File
RegisterFile r1(.MemtoReg_signal(Mem_toReg),.RegWriteSignal(Reg_Write),.RegDestination(Reg_Dst),.op(OPP),.rs(RSS),.rt(RTT),.rd(RDD),.re(REE),.we(WEE),.clk(clk),.shamt(SHAMTT),.ftn(FTNN), .writeData(Tresult),.writeData2(writeDatafromMEM),.writeData4(Tresult2),.writeData3(Tresult3),.read_data_1(read1), .read_data_2(read2));

// ALU
ALU a1(.in_1(read1),.Opcod(OPP), .in_2(read2), .result(Tresult),.result2(Tresult2), .ALUop(ALUOPP), .zeroflag(ZEROFLAG),.ALUsource(ALU_src), .offset(CONSTANT));

//control unit
ControlUnit c1(.Inst_opcode(OPP),.RegDst(Reg_Dst),.ALUsrc(ALU_src),.MemtoReg(Mem_toReg),.RegWrite(Reg_Write),.MemRead(Mem_Read),.MemWrite(Mem_Write),.Branch(Bra_nch),.Jump(Ju_mp));

//Data Memory 
DataMemory m1(.MemWriteSignal(Mem_Write),.MemReadSignal(Mem_Read),.MemAddress(Tresult2),.MemWriteData(read2),.MemReadData(writeDatafromMEM));


//seven segment
SevenSegment s1(.Clk(clk2), .inst(in), .alu_in(Tresult), .pc_in(PCC), .switch(sw), .enable(ENABLE), .LED_out(LEDOUT));

endmodule


