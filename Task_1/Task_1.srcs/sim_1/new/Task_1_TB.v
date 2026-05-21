`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 09:49:04
// Design Name: 
// Module Name: Task_1_TB
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


module Task_1_TB;
    reg clk, rst, ctrl;
    wire [3:0] out;
    
    sequence_counter UUT (clk, rst, ctrl, out);
    
    initial $monitor("Mode = %b | Output = %d", ctrl, out);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        #1000;
        $finish;
    end
    initial begin
        rst = 1; ctrl = 0;
        #10 rst = 0;
        
        
        #95 rst = 1;
        #10 rst = 0;
        #40 ctrl = 1;
        
        #80 rst = 1;
        #30 rst = 0; ctrl = 0;
    end
endmodule
