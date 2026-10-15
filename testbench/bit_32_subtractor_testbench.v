`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 04:31:09 PM
// Design Name: 
// Module Name: bit_32_subtractor_testbench
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



module bit_32_subtractor_testbench;

    reg  [31:0] A, B;
    reg         Bin;

    wire [31:0] Diff;
    wire        Bout;

    bit_32_subtractor uut (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .Bout(Bout)
    );

    initial begin
        $monitor("A=%h B=%h Bin=%b | Diff=%h Bout=%b",
                 A, B, Bin, Diff, Bout);

        A = 32'd20;
        B = 32'd10;
        Bin = 0;
        #10;

        A = 32'd10;
        B = 32'd20;
        Bin = 0;
        #10;

        A = 32'hFFFFFFFF;
        B = 32'd1;
        Bin = 0;
        #10;

        A = 32'd10;
        B = 32'd5;
        Bin = 1;
        #10;

        $finish;
    end

endmodule
