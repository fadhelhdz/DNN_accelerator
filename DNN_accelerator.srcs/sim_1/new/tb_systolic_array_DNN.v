`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2025 07:58:23 AM
// Design Name: 
// Module Name: tb_systolic_array_DNN
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


module tb_systolic_array_DNN;

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] a0;
    reg [15:0] a1;
    reg [15:0] a2;
    reg [15:0] w0;
    reg [15:0] w1;
    reg [15:0] w2;
    reg [15:0] w3;
    reg [15:0] w4;
    reg [15:0] w5;
    reg [15:0] w6;
    reg [15:0] w7;
    reg [15:0] w8;
    reg [15:0] acc0_in;
    reg [15:0] acc1_in;
    reg [15:0] acc2_in;
    
    // Outputs
    wire [15:0] mac0_out;
    wire [15:0] mac1_out;
    wire [15:0] mac2_out;
    
    // Instantiate the Unit Under Test (UUT)
    systolic_array_DNN uut (
        .clk(clk),
        .rst(rst),
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .w4(w4),
        .w5(w5),
        .w6(w6),
        .w7(w7),
        .w8(w8),
        .acc0_in(acc0_in),
        .acc1_in(acc1_in),
        .acc2_in(acc2_in),
        .mac0_out(mac0_out),
        .mac1_out(mac1_out),
        .mac2_out(mac2_out)
    );
    
    // Clock generation: 10 ns period
    always #5 clk = ~clk;
    
    initial begin
        // Initialize inputs
        clk = 1;
        rst = 0;
        a0 = 0;
        a1 = 0;
        a2 = 0;
        w0 = 0;
        w1 = 0;
        w2 = 0;
        w3 = 0;
        w4 = 0;
        w5 = 0;
        w6 = 0;
        w7 = 0;
        w8 = 0;
        acc0_in = 0;
        acc1_in = 0;
        acc2_in = 0;

        // Apply reset
        #10;
        rst = 1;
        
        w0 = 16'b1111001100110011;
        w1 = 16'b0000110011001101;
        w2 = 16'b1010011001100110;
        w3 = 16'b0100110011001101;
        w4 = 16'b1100000000000000;
        w5 = 16'b0011001100110011;
        w6 = 16'b1101100110011010;
        w7 = 16'b0001100110011010;
        w8 = 16'b1111001100110011;
        acc0_in = 16'b0000000000000000;
        acc1_in = 16'b0000000000000000;
        acc2_in = 16'b0000000000000000;
        
        a0 = 16'b0000110011001101;
        a1 = 16'b0000000000000000;
        a2 = 16'b0000000000000000;
        
        #10
        
        a0 = 16'b1100110011001101;
        a1 = 16'b1110011001100110;
        a2 = 16'b0000000000000000;
        
        #10
        
        a0 = 16'b0101100110011010;
        a1 = 16'b0100000000000000;
        a2 = 16'b0010011001100110;
        
        #10
        
        a0 = 16'b0000000000000000;
        a1 = 16'b1001100110011010;
        a2 = 16'b1011001100110011;
        
        #10
        
        a0 = 16'b0000000000000000;
        a1 = 16'b0000000000000000;
        a2 = 16'b0111001100110011;
        
        #10
        
        a0 = 16'b0000000000000000;
        a1 = 16'b0000000000000000;
        a2 = 16'b0000000000000000;
        
        #10
        
        a0 = 16'b0000000000000000;
        a1 = 16'b0000000000000000;
        a2 = 16'b0000000000000000;
        
        #10
        
//        // First cycle        
//        a0 = 16'b0000110011001101;
//        a1 = 16'b1110011001100110;
//        a2 = 16'b0010011001100110;
      
//        #100;
        
//        // Second cycle        
//        a0 = 16'b1100110011001101;
//        a1 = 16'b0100000000000000;
//        a2 = 16'b1011001100110011;
        
//        #100
        
//        // Third cycle        
//        a0 = 16'b0101100110011010;
//        a1 = 16'b1001100110011010;
//        a2 = 16'b0111001100110011;
        
//        #100
        
//        a0 = 16'b0000000000000000;
//        a1 = 16'b0000000000000000;
//        a2 = 16'b0000000000000000;
        
        #100
        
//        a0 = 16'b0000110011001101;
//        a1 = 16'b1110011001100110;
//        a2 = 16'b0010011001100110;
        
        $finish;
        
    end
    
    // Monitor pipeline activity
//    initial begin
//        $display("Time | a | w | acc_in | a_out | mac_out");
//        $monitor("%4t | %2d | %2d | %7d | %6d | %8d",
//                 $time, a, w, acc_in, a_out, mac_out);
//    end
 
endmodule
