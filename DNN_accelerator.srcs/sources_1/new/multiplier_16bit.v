`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 07:04:34 PM
// Design Name: 
// Module Name: multiplier_16bit
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


module multiplier_16bit(
    input signed [15:0] a,
    input signed [15:0] b,
    output signed [15:0] product
    );
    wire signed [31:0] full_product;

    assign full_product = a * b;
    assign product = full_product[30:15];
//    assign product = full_product[30:15];
//    assign product = full_product[15:0];
endmodule
