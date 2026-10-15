`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:28:52 AM
// Design Name: 
// Module Name: Imm_Gen_testbench
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


module Imm_Gen_testbench;

    reg  [31:0] Instruction;
    wire [31:0] ImmOut;

    // Instantiate Unit Under Test (UUT)
    Imm_Gen uut (
        .Instruction(Instruction),
        .ImmOut(ImmOut)
    );

    initial begin
        
        // 1. Test I-Type (ADDI x1, x0, -10) -> Immediate = -10 (0xFFF)
        Instruction = 32'hFF600093; #10;

        // 2. Test S-Type (SW x2, 12(x1)) -> Immediate = 12
        Instruction = 32'h0020A623; #10;

        // 3. Test B-Type (BEQ x1, x2, 16) -> Immediate = 16
        Instruction = 32'h00208863; #10;

        // 4. Test U-Type (LUI x1, 0x12345) -> Immediate = 0x12345000
        Instruction = 32'h123450B7; #10;

        // 5. Test J-Type (JAL x1, -20) -> Immediate = -20
        Instruction = 32'hFFDFF0EF; #10;

        
        $finish;
    end

endmodule


