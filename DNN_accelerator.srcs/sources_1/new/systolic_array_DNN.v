`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2025 07:06:38 AM
// Design Name: 
// Module Name: systolic_array_DNN
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


module systolic_array_DNN(
    input clk,
    input rst,
    input [15:0] a0, a1, a2,
    input [15:0] w0, w1, w2,
    input [15:0] w3, w4, w5,
    input [15:0] w6, w7, w8,
    input [15:0] acc0_in, acc1_in, acc2_in,
    output [15:0] mac0_out, mac1_out, mac2_out
    );

    // Store 'a' inputs into an array
    wire [15:0] a_in[0:2];
    assign a_in[0] = a0;
    assign a_in[1] = a1;
    assign a_in[2] = a2;

    // Store 'w' inputs into an array
    wire [15:0] w[0:8];
    assign w[0] = w0; assign w[1] = w1; assign w[2] = w2;
    assign w[3] = w3; assign w[4] = w4; assign w[5] = w5;
    assign w[6] = w6; assign w[7] = w7; assign w[8] = w8;

    // Pack accumulator inputs into array
    wire [15:0] acc_in[0:2];
    assign acc_in[0] = acc0_in;
    assign acc_in[1] = acc1_in;
    assign acc_in[2] = acc2_in;

    // Internal wires for a_out from each MAC (3x3)
    wire [15:0] a_out[0:2][0:2];
    // Internal wires for mac_out from each MAC (3x3)
    wire [15:0] mac_out_wire[0:2][0:2];

    genvar i, j;
    generate
        for (i = 0; i < 3; i = i + 1) begin : row
            for (j = 0; j < 3; j = j + 1) begin : col
                mac_unit mac_inst (
                    .clk(clk),
                    .rst(rst),
                    .a(
                        // For first column, input a is from a_in[i]
                        // Otherwise, input a is a_out from previous col in same row
                        (j == 0) ? a_in[i] : a_out[i][j-1]
                    ),
                    .w(w[i*3 + j]),  // weights arranged row-wise
                    .acc_in(
                        // For first row, acc_in is zero
                        // Otherwise, acc_in is mac_out from previous row same col
                        (i == 0) ? 16'd0 : mac_out_wire[i-1][j]
                    ),
                    .mac_out(mac_out_wire[i][j]),
                    .a_out(a_out[i][j])
                );
            end
        end
    endgenerate

    // Final outputs are mac_out from last row
    assign mac0_out = mac_out_wire[2][0];
    assign mac1_out = mac_out_wire[2][1];
    assign mac2_out = mac_out_wire[2][2];

endmodule
