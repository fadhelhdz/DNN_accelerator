`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 10:42:24 PM
// Design Name: 
// Module Name: tb_mac_unit
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

module tb_mac_unit;

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] a;
    reg [15:0] w;
    reg [15:0] acc_in;

    // Outputs
    wire [15:0] mac_out;
    wire [15:0] a_out;

    // Instantiate the Unit Under Test (UUT)
    mac_unit uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .w(w),
        .acc_in(acc_in),
        .mac_out(mac_out),
        .a_out(a_out)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        a = 0;
        w = 0;
        acc_in = 0;

        // Apply reset
        #12;
        rst = 0;
        
        a = 16'b0010000000000000;
        w = 16'b1010110011001101;
        acc_in = 16'b0000000000000000;

//        a = 16'b0000110011001101;
//        w = 16'b1000110011001101;
//        acc_in = 16'b0000000000000000;

//        // Apply input set 1
//        #20;
//        a = 16'd3;
//        w = 16'd4;
//        acc_in = 16'd5;  // Expected: (3*4)+5 = 17, pipelined -> shows later

//        // Input set 2
//        #20;
//        a = 16'd2;
//        w = 16'd6;
//        acc_in = 16'd1;  // (2*6)+1 = 13

//        // Input set 3
//        #20;
//        a = 16'd1;
//        w = 16'd7;
//        acc_in = 16'd0;  // 1*7 = 7

//        // Reset in middle
//        #20;
//        rst = 1;
//        #20;
//        rst = 0;

//        // Input set 4
//        #20;
//        a = 16'd5;
//        w = 16'd5;
//        acc_in = 16'd10;  // (5*5)+10 = 35

        #40;
        $finish;
    end

    // Monitor pipeline activity
    initial begin
        $display("Time | a | w | acc_in | a_out | mac_out");
        $monitor("%4t | %2d | %2d | %7d | %6d | %8d",
                 $time, a, w, acc_in, a_out, mac_out);
    end

endmodule

