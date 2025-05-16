`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 07:04:34 PM
// Design Name: 
// Module Name: dff_16bit_reset
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


module dff_16bit_reset(
    input clk,
    input rst,
    input signed [15:0] d,
    output reg signed [15:0] q
    );
    
    always @(posedge clk) begin
        if (~rst)
            q <= 16'b0;
        else
            q <= d;
    end
endmodule
