`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 10:34:19 PM
// Design Name: 
// Module Name: mac_unit
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

module mac_unit(
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] w,
    input [15:0] acc_in,
    output [15:0] mac_out,
    output [15:0] a_out
    );

    wire [15:0] a_reg, w_reg;
    wire [15:0] product;
    wire [15:0] sum;
    wire [15:0] mac_reg;

    // Register input a and w
    dff_16bit_reset dff_a (
        .clk(clk),
        .rst(rst),
        .d(a),
        .q(a_reg)
    );

    dff_16bit_reset dff_w (
        .clk(clk),
        .rst(rst),
        .d(w),
        .q(w_reg)
    );

    assign a_out = a_reg; // Output registered a

    // Multiply
    multiplier_16bit mul_inst (
        .a(a_reg),
        .b(w_reg),
        .product(product)
    );

    // Accumulate
    adder_16bit add_inst (
        .a(acc_in),
        .b(product),
        .sum(sum)
    );

    // Register the output
    dff_16bit_reset dff_mac (
        .clk(clk),
        .rst(rst),
        .d(sum),
        .q(mac_reg)
    );

    assign mac_out = mac_reg;

endmodule

