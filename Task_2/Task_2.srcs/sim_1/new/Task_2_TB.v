`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 00:36:01
// Design Name: 
// Module Name: Task_2_TB
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


module Task_2_TB;
    reg clk, in, rst;
    wire out;
    
    sequence_recognizer UUT (clk, rst, in, out);
    
    initial $monitor("input = %b, edge = %b", in, out);
    initial begin
        forever #5 clk = ~clk;
    end
    initial begin
        #200;
        $finish;
    end
    initial begin
        rst = 1; in = 0; clk = 0;
        #10 rst = 0;
        
        #30 in = 1;
        #10 in = 0;
        #10 in = 1;
        #50 in = 0;
    end
endmodule
