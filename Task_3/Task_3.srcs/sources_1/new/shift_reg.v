`timescale 1ns / 1ps

module shift_reg (
    input wire low_clk,
    input wire rst,
    input wire [1:0] mode,
    output reg [3:0] data_out
);
    localparam [3:0] START_STR = 4'b0011;

    always @(posedge low_clk or posedge rst) begin
        if (rst) begin
            data_out <= START_STR;
        end else begin
            case (mode)
                2'b01:   data_out <= {data_out[2:0], data_out[3]};
                2'b10:   data_out <= {data_out[0], data_out[3:1]};
                2'b00:   data_out <= data_out;
                default: data_out <= data_out;
            endcase
        end
    end
endmodule