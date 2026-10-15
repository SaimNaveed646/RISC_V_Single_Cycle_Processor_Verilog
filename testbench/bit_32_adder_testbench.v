`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 04:24:04 PM
// Design Name: 
// Module Name: bit_32_adder_testbench
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

module bit_32_adder_testbench;

    reg  [31:0] A, B;
    reg         Cin;
    wire [31:0] Sum;
    wire        Cout;

    bit_32_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
       

        A = 32'd10;
        B = 32'd20;
        Cin = 0;
        #10;

        A = 32'hFFFFFFFF;
        B = 32'd1;
        Cin = 0;
        #10;

        A = 32'h0000FFFF;
        B = 32'h00000001;
        Cin = 1;
        #10;

        A = 32'hFFFFFFFF;
        B = 32'hFFFFFFFF;
        Cin = 1;
        #10;

        $finish;
    end

endmodule



