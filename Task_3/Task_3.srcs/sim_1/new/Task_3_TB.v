`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 10:31:23
// Design Name: 
// Module Name: Task_3_TB
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

module top_string_mode_tb;
    reg clk;
    reg btn0;
    reg btn1;
    reg btn2;
    reg btn3;
    wire [3:0] led;

    top_string_mode uut (
        .clk(clk),
        .btn0(btn0),
        .btn1(btn1),
        .btn2(btn2),
        .btn3(btn3),
        .led(led)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk  = 0;
        btn0 = 1;
        btn1 = 0; btn2 = 0; btn3 = 0;
        
        #40;
        btn0 = 0;
        
        #20;
        btn1 = 1; #20 btn1 = 0;
        #200;

        #20;
        btn3 = 1; #20 btn3 = 0;
        #100;

        #20;
        btn2 = 1; #20 btn2 = 0;
        #200;

        #20;
        btn0 = 1; #20 btn0 = 0;
        
        #50;
        $finish;
    end

    initial begin
        $monitor("Time: %5t ns | Buttons [Rst,L,R,P]: %b%b%b%b | FSM Mode internal: %b | LED Out: %b", 
                 $time, btn0, btn1, btn2, btn3, uut.u_fsm_control.mode, led);
    end

endmodule
