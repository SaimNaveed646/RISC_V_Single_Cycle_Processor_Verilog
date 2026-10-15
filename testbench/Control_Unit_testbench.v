`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:03:56 AM
// Design Name: 
// Module Name: Control_Unit_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit_testbench;

    // Testbench Inputs (Reg Type)
    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;

    // Testbench Outputs (Wire Type)
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [3:0] ALUOperation;

    // Instantiate Unit Under Test (UUT)
    Control_Unit uut (
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOperation(ALUOperation)
    );

    initial begin
        
        // 1. Test R-Type: ADD instruction
        opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0000000;
        #10;

        // 2. Test R-Type: SUB instruction
        opcode = 7'b0110011; funct3 = 3'b000; funct7 = 7'b0100000;
        #10;

        // 3. Test R-Type: AND instruction
        opcode = 7'b0110011; funct3 = 3'b111; funct7 = 7'b0000000;
        #10;

        // 4. Test I-Type: ADDI instruction
        opcode = 7'b0010011; funct3 = 3'b000; funct7 = 7'b0000000;
        #10;

        // 5. Test Load: LW instruction
        opcode = 7'b0000011; funct3 = 3'b010; funct7 = 7'b0000000;
        #10;

        // 6. Test Store: SW instruction
        opcode = 7'b0100011; funct3 = 3'b010; funct7 = 7'b0000000;
        #10;

        // 7. Test Branch: BEQ instruction
        opcode = 7'b1100011; funct3 = 3'b000; funct7 = 7'b0000000;
        #10;

        // 8. Test Branch: BNE instruction
        opcode = 7'b1100011; funct3 = 3'b001; funct7 = 7'b0000000;
        #10;

        // 9. Test JAL instruction
        opcode = 7'b1101111; funct3 = 3'b000; funct7 = 7'b0000000;
        #10;

        
        $finish;
    end

endmodule


