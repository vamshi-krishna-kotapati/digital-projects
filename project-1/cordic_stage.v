`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 15:02:52
// Design Name: 
// Module Name: cordic_stage
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


module cordic_stage(output   [19:0] x_out, 
output  [19:0] y_out, 
output  [19:0] angle_out,  
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
assign x_in_2 = (x_in[19] == 1) ? (~x_in[19:0] + 1) : (x_in) ; 
assign y_in_2 = (y_in[19] == 1) ? (~y_in[19:0] + 1) : (y_in) ; 
wire [19:0] y_shift,x_shift,y_shift2,x_shift2; // to store the shifted value of x and y 
assign y_shift[19:0] = y_in_2[19:0] >>> i; 
assign x_shift[19:0] = x_in_2[19:0] >>> i; 
assign x_shift2 [19:0] = (x_in[19] == 1) ? ~x_shift[19:0]+1 : x_shift[19:0] ; 
assign y_shift2 [19:0] = (y_in[19] == 1) ? ~y_shift[19:0]+1 : y_shift[19:0] ; 
reg [19:0] x_out1,y_out1; 
//designing one stage of CORDIC; 
wire   sign =  (input_angle >= angle_in) ? 0 : 1; 
assign x_out = (sign) ? x_in + y_shift2 : x_in - y_shift2; 
assign y_out = (sign) ?  y_in - x_shift2 : y_in + x_shift2; 
assign angle_out = (sign) ? angle_in - ref : angle_in + ref; 
endmodule 


