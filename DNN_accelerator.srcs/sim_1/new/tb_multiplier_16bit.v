`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2025 04:09:54 PM
// Design Name: 
// Module Name: tb_multiplier_16bit
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


module tb_multiplier_16bit;

    // Inputs
    reg [15:0] a;
    reg [15:0] b;
    
    // Outputs
    wire [15:0] product;
    
    // Instantiate the Unit Under Test (UUT)
    multiplier_16bit uut(
        .a(a),
        .b(b),
        .product(product)
    );
    
    initial begin
        a = 16'b0010000000000000;
        b = 16'b1010110011001101;
        #40;
        $finish;
    end   
     
    
endmodule
