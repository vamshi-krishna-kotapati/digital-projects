`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 15:10:31
// Design Name: 
// Module Name: cordic_final
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


module cordic_final(output  [19:0] x_out, 
output  [19:0] y_out, 
input  [19:0] x_in, 
input  [19:0] y_in, 
input [19:0] input_angle, 
input [19:0] angle_in, 
input [19:0] ref, 
input [3:0] i, 
input clk 
); 
//2's complement to handle negative numbers 
wire [19:0] x_in_2,y_in_2; 
wire [19:0] w = 20'b0000_0000__1001_1011_1000; 
wire [19:0] x_out1,y_out1; 
//x_in_2 and y_in_2 are always positive 
assign x_in_2 = (x_in[19] == 1) ? (~x_in[19:0] + 1) : (x_in) ; 
assign y_in_2 = (y_in[19] == 1) ? (~y_in[19:0] + 1) : (y_in) ; 
wire [19:0] y_shift,x_shift,x_shift2,y_shift2; // to store the shifted value of x and y 
assign y_shift[19:0] = y_in_2[19:0] >>> i; 
assign x_shift[19:0] = x_in_2[19:0] >>> i; 
assign x_shift2 [19:0] = (x_in[19] == 1) ? ~x_shift[19:0]+1 : x_shift[19:0] ; 
assign y_shift2 [19:0] = (y_in[19] == 1) ? ~y_shift[19:0]+1 : y_shift[19:0] ; 
//designing one stage of CORDIC; 
wire   sign =  (input_angle > angle_in) ? 0 : 1; 
wire[19:0] x_out_1,y_out_1; 
fixed_multi f1(x_out1,w,x_out_1,1'b0); 
fixed_multi f2(y_out1,w,y_out_1,1'b0); 
assign x_out_1 = (sign) ? x_in + y_shift2 : x_in - y_shift2; 
assign y_out_1 = (sign) ?  y_in - x_shift2 : y_in + x_shift2; 
assign x_out = x_out1; 
assign y_out = y_out1;      
endmodule 
