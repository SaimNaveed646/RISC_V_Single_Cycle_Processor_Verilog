`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:23:34 AM
// Design Name: 
// Module Name: Register_File_testbench
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


module Register_File_testbench;



    // Inputs
    reg        clk;
    reg        reset;
    reg        RegWrite;
    reg  [4:0] ReadReg1;
    reg  [4:0] ReadReg2;
    reg  [4:0] WriteReg;
    reg  [31:0] WriteData;

    // Outputs
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;

    // Instantiate Unit Under Test (UUT)
    Register_File uut (
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite),
        .ReadReg1(ReadReg1),
        .ReadReg2(ReadReg2),
        .WriteReg(WriteReg),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    // Clock Generation (10ns Period)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        RegWrite = 0;
        ReadReg1 = 0;
        ReadReg2 = 0;
        WriteReg = 0;
        WriteData = 0;

       
        // Reset Pulse
        #10 reset = 0;

        // Test 1: Write 100 to Register 5 ($5)
        #10;
        RegWrite = 1; WriteReg = 5'd5; WriteData = 32'd100;
        
        // Test 2: Write 250 to Register 10 ($10)
        #10;
        RegWrite = 1; WriteReg = 5'd10; WriteData = 32'd250;

        // Test 3: Read Register 5 ($5) and Register 10 ($10) simultaneously
        #10;
        RegWrite = 0; ReadReg1 = 5'd5; ReadReg2 = 5'd10;

        // Test 4: Attempt to Write to Register 0 ($0)
        #10;
        RegWrite = 1; WriteReg = 5'd0; WriteData = 32'd9999;

        // Test 5: Verify Register 0 ($0) remains 0
        #10;
        RegWrite = 0; ReadReg1 = 5'd0; ReadReg2 = 5'd5;

        #20;
        
        $finish;
    end

endmodule


