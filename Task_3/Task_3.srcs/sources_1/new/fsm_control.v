`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 10:27:02
// Design Name: 
// Module Name: fsm_control
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

module fsm_control (
    input clk,
    input rst,
    input btn_left,
    input btn_right,
    input btn_pause, 
    output reg [1:0] mode  // Mã hóa chế độ: 00=Pause, 01=Left, 10=Right
);
    localparam [1:0] S_PAUSE = 2'b00,
                     S_LEFT  = 2'b01,
                     S_RIGHT = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mode <= S_PAUSE;
        end else begin
            if (btn_left)        mode <= S_LEFT;
            else if (btn_right)   mode <= S_RIGHT;
            else if (btn_pause)   mode <= S_PAUSE;
        end
    end
endmodule
