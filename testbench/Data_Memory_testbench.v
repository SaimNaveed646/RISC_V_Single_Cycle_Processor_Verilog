`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:59:29 AM
// Design Name: 
// Module Name: Data_Memory_testbench
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


module Data_Memory_testbench;

    reg        clk;
    reg        MemRead;
    reg        MemWrite;
    reg [31:0] Address;
    reg [31:0] WriteData;

    wire [31:0] ReadData;

    // Instantiate Unit Under Test (UUT)
    Data_Memory uut (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Address(Address),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    // Clock Generation (10ns Period)
    always #5 clk = ~clk;

    initial begin
        // Inputs Initialize Karein
        clk = 0;
        MemRead = 0;
        MemWrite = 0;
        Address = 0;
        WriteData = 0;

        

        // 1. Test: Initial Idle State (No Read, No Write)
        #10;
        MemRead = 0; MemWrite = 0; Address = 32'd16;

        // 2. Test: Store Word (SW) - Address 16 par 500 Write karein
        #10;
        MemWrite = 1; MemRead = 0; Address = 32'd16; WriteData = 32'd500;

        // 3. Test: Store Word (SW) - Address 20 par 1050 Write karein
        #10;
        MemWrite = 1; MemRead = 0; Address = 32'd20; WriteData = 32'd1050;

        // 4. Test: Disable Write
        #10;
        MemWrite = 0; WriteData = 32'd0;

        // 5. Test: Load Word (LW) - Address 16 se Read karein (Expected Output = 500)
        #10;
        MemRead = 1; Address = 32'd16;

        // 6. Test: Load Word (LW) - Address 20 se Read karein (Expected Output = 1050)
        #10;
        MemRead = 1; Address = 32'd20;

        // 7. Test: Read from unwritten Address 24 (Expected Output = 0)
        #10;
        MemRead = 1; Address = 32'd24;

        // 8. Test: MemRead disable karne par output 0 hona chahiye
        #10;
        MemRead = 0; Address = 32'd16;

        #20;
        $finish;
    end

endmodule

