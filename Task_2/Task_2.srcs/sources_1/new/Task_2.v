`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 00:21:50
// Design Name: 
// Module Name: Task_2
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

module sequence_recognizer(
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
);

    reg prev_state;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            out <= 0;
            prev_state <= 0;
        end else begin
            prev_state <= in;
        end
        
        assign out = in ^ prev_state;
    end

endmodule