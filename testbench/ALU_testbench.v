`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:09:38 AM
// Design Name: 
// Module Name: ALU_testbench
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


`timescale 1ns / 1ps

module ALU_testbench;

    // Inputs
    reg  [31:0] A;
    reg  [31:0] B;
    reg  [3:0]  ALUOperation;

    // Outputs
    wire [31:0] ALUResult;
    wire        Zero;

    // Instantiate ALU Module
    ALU uut (
        .A(A),
        .B(B),
        .ALUOperation(ALUOperation),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    initial begin
      
        // 1. ADD Test: 15 + 10 = 25
        A = 32'd15; B = 32'd10; ALUOperation = 4'b0010; #10;

        // 2. SUB Test: 20 - 20 = 0 (Zero flag High hona chahiye)
        A = 32'd20; B = 32'd20; ALUOperation = 4'b0011; #10;

        // 3. AND Test: 12 & 5
        A = 32'd12; B = 32'd5;  ALUOperation = 4'b0000; #10;

        // 4. OR Test: 12 | 5
        A = 32'd12; B = 32'd5;  ALUOperation = 4'b0001; #10;

        // 5. SLL Test: Shift Left 4 by 2 bits = 16
        A = 32'd4;  B = 32'd2;  ALUOperation = 4'b0101; #10;

        // 6. SLT Test (Signed): -5 < 10 (Result = 1)
        A = -32'd5; B = 32'd10; ALUOperation = 4'b1000; #10;

        // 7. BEQ Test: Compare 10 and 10 (Zero flag = 1)
        A = 32'd10; B = 32'd10; ALUOperation = 4'b1010; #10;

       
        $finish;
    end

endmodule