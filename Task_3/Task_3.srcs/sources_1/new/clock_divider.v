`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 10:26:34
// Design Name: 
// Module Name: clock_divider
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

module clock_divider (
    input clk_in,
    input rst,
    output reg clk_out
);
    reg [26:0] counter;

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 27'd0;
            clk_out <= 1'b0;
        end else begin
        // if (counter == 27'd49_999_999) begin
            if (counter == 27'd4) begin
                counter <= 27'd0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
