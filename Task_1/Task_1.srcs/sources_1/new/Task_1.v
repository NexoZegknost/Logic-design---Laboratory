`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 09:48:52
// Design Name: 
// Module Name: Task_1
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


module sequence_counter(
    input clk, rst, ctrl,
    output [3:0] out
    );
    
    reg [25:0] clk_div_reg = 0;
    reg low_clk = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_div_reg <= 0;
            low_clk     <= 0;
        end else begin
            if (clk_div_reg == 26'd49_999_999) begin
                clk_div_reg <= 0;
                low_clk     <= ~low_clk;
            end else begin
                clk_div_reg <= clk_div_reg + 1;
            end
        end
    end
    
    reg [3:0] state;
    parameter [3:0] S1 = 4'd1,
                    S3  = 4'd3,
                    S4  = 4'd4,
                    S5  = 4'd5,
                    S7  = 4'd7,
                    S8  = 4'd8,
                    S10 = 4'd10,
                    S11 = 4'd11,
                    S12 = 4'd12;
    
    always @(posedge low_clk or posedge rst) begin
        if (rst) begin
            state <= S1;
        end else begin
            case (state)
                S1:      state <= S3;
                S3:      state <= ctrl ? S5  : S4;
                S4:      state <= S5;
                S5:      state <= S7;
                S7:      state <= ctrl ? S11 : S8;
                S8:      state <= ctrl ? S11 : S10;
                S10:     state <= S11;
                S11:     state <= ctrl ? S1  : S12;
                S12:     state <= S1;
                default: state <= S1;
            endcase
        end
    end

    assign out = state;
    
endmodule
