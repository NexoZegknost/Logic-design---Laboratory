`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 10:19:27
// Design Name: 
// Module Name: Task_3
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

module top_string_mode (
    input wire clk,
    input wire btn0,
    input wire btn1,
    input wire btn2,
    input wire btn3,
    output wire [3:0] led
);

    wire clk_1hz;
    wire [1:0] current_mode;

    clock_divider u_clk_divider (
        .clk_in(clk),
        .rst(btn0),
        .clk_out(clk_1hz)
    );

    fsm_control u_fsm_control (
        .clk(clk),
        .rst(btn0),
        .btn_left(btn1),
        .btn_right(btn2),
        .btn_pause(btn3),
        .mode(current_mode)
    );

    shift_reg u_shift_reg (
        .low_clk(clk_1hz),
        .rst(btn0),
        .mode(current_mode),
        .data_out(led)
    );

endmodule
