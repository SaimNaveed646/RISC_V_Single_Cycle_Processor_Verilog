`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:52:28 AM
// Design Name: 
// Module Name: Instruction_RAM_testbench
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


module Instruction_RAM_testbench;

    // Testbench Inputs
    reg        clk;
    reg        enable;
    reg [31:0] Addr;

    // Testbench Output
    wire [31:0] Instruction;

    // Instantiate Unit Under Test (UUT)
    Instruction_RAM uut (
        .clk(clk),
        .enable(enable),
        .Addr(Addr),
        .Instruction(Instruction)
    );

    // Clock Generation (10ns Period)
    always #5 clk = ~clk;

    initial begin
        // Inputs Initialize Karein
        clk = 0;
        enable = 0;
        Addr = 0;

        //dummy instruction
        uut.ram[0] = 32'h00500113; // Address 0  : addi x2, x0, 5
        uut.ram[1] = 32'h00A00193; // Address 4  : addi x3, x0, 10
        uut.ram[2] = 32'h003100B3; // Address 8  : add x1, x2, x3
        uut.ram[3] = 32'h0020A623; // Address 12 : sw x2, 12(x1)

       
        // 1. Test: RAM Disabled (Output 0 hona chahiye)
        #10;
        enable = 0;
        Addr = 32'd0;

        // 2. Test: Enable RAM & Fetch Instruction 0 (PC = 0)
        #10;
        enable = 1;
        Addr = 32'd0;

        // 3. Test: Fetch Instruction 1 (PC = 4)
        #10;
        Addr = 32'd4;

        // 4. Test: Fetch Instruction 2 (PC = 8)
        #10;
        Addr = 32'd8;

        // 5. Test: Fetch Instruction 3 (PC = 12)
        #10;
        Addr = 32'd12;

        // 6. Test: Disable RAM again
        #10;
        enable = 0;

        #20;
        
        $finish;
    end

endmodule
