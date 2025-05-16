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
    input [15:0] a0,
    input [15:0] a1,
    input [15:0] a2,
    input [15:0] w0,
    input [15:0] w1,
    input [15:0] w2,
    input [15:0] w3,
    input [15:0] w4,
    input [15:0] w5,
    input [15:0] w6,
    input [15:0] w7,
    input [15:0] w8,
    input [15:0] acc0_in,
    input [15:0] acc1_in,
    input [15:0] acc2_in,
    output [15:0] mac0_out,
    output [15:0] mac1_out,
    output [15:0] mac2_out
    );
    
    wire [15:0] mac0_0_out;
    wire [15:0] mac0_1_out;
    wire [15:0] mac0_2_out;
    wire [15:0] mac1_0_out;
    wire [15:0] mac1_1_out;
    wire [15:0] mac1_2_out;
    wire [15:0] mac2_0_out;
    wire [15:0] mac2_1_out;
    wire [15:0] mac2_2_out;
    wire [15:0] a0_0_out;
    wire [15:0] a0_1_out;
    wire [15:0] a0_2_out;
    wire [15:0] a1_0_out;
    wire [15:0] a1_1_out;
    wire [15:0] a1_2_out;
    wire [15:0] a2_0_out;
    wire [15:0] a2_1_out;
    wire [15:0] a2_2_out;
    
    mac_unit mac0 (
    .clk(clk),
    .rst(rst),
    .a(a0), .w(w0), .acc_in(16'd0),
    .mac_out(mac0_0_out), .a_out(a0_0_out)
    );
    
    mac_unit mac1 (
    .clk(clk),
    .rst(rst),
    .a(a0_0_out), .w(w1), .acc_in(16'd0),
    .mac_out(mac0_1_out), .a_out(a0_1_out)
    );
    
    mac_unit mac2 (
    .clk(clk),
    .rst(rst),
    .a(a0_1_out), .w(w2), .acc_in(16'd0),
    .mac_out(mac0_2_out), .a_out(a0_2_out)
    );
    
    mac_unit mac3 (
    .clk(clk),
    .rst(rst),
    .a(a1), .w(w3), .acc_in(mac0_0_out),
    .mac_out(mac1_0_out), .a_out(a1_0_out)
    );
    
    mac_unit mac4 (
    .clk(clk),
    .rst(rst),
    .a(a1_0_out), .w(w4), .acc_in(mac0_1_out),
    .mac_out(mac1_1_out), .a_out(a1_1_out)
    );
    
    mac_unit mac5 (
    .clk(clk),
    .rst(rst),
    .a(a1_1_out), .w(w5), .acc_in(mac0_2_out),
    .mac_out(mac1_2_out), .a_out(a1_2_out)
    );
    
    mac_unit mac6 (
    .clk(clk),
    .rst(rst),
    .a(a2), .w(w6), .acc_in(mac1_0_out),
    .mac_out(mac2_0_out), .a_out(a2_0_out)
    );
    
    mac_unit mac7 (
    .clk(clk),
    .rst(rst),
    .a(a2_0_out), .w(w7), .acc_in(mac1_1_out),
    .mac_out(mac2_1_out), .a_out(a2_1_out)
    );
    
    mac_unit mac8 (
    .clk(clk),
    .rst(rst),
    .a(a2_1_out), .w(w8), .acc_in(mac1_2_out),
    .mac_out(mac2_2_out), .a_out(a2_2_out)
    );
    
    assign mac0_out = mac2_0_out;
    assign mac1_out = mac2_1_out;
    assign mac2_out = mac2_2_out;

//    assign mac0_out = mac0_0_out;
//    assign mac1_out = mac0_1_out;
//    assign mac2_out = mac0_2_out;
endmodule
