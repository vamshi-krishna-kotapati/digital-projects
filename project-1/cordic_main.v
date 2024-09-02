`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 15:05:04
// Design Name: 
// Module Name: cordic_main
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


module cordic_main(
output [19:0] x_out, 
output [19:0] y_out, 
input [19:0] x_in, 
input [19:0] y_in, 
input [19:0] angle_in, 
input clk, 
input rst 
); 
// all the stored values of the angle   
// convert to parameter of wire 
wire [19:0] a [10:0]; 
wire [19:0] xout [9:0];
wire [19:0] yout [9:0];
wire [19:0] aout [9:0];
assign a[0] = 20'b0010_1101__0000_0000_0000; 
assign a[1] = 20'b0001_1010__1000_1111_1111;     
assign a[2] = 20'b0000_1110__0000_1001_0010; 
assign a[3] = 20'b0000_0111__0010_0000_0000; 
assign a[4] = 20'b0000_0011__1001_0011_0111;     
assign a[5] = 20'b0000_0001__1100_1001_0001; 
assign a[6] = 20'b0000_0000__1110_0101_0011; 
assign a[7] = 20'b0000_0000__0111_0010_1001; 
assign a[8] = 20'b0000_0000__0011_1001_0101;    
assign a[9] = 20'b0000_0000__0001_1110_1000; 
assign a[10] = 20'b0000_0000__0000_1110_0101;



cordic_stage cs0 (xout[0],yout[0],aout[0],x_in,y_in,angle_in,0,a[0],0,clk); 
cordic_stage cs1 (xout[1],yout[1],aout[1],xout[0],yout[0],angle_in,aout[0],a[1],1,clk); 
cordic_stage cs2 (xout[2],yout[2],aout[2],xout[1],yout[1],angle_in,aout[1],a[2],2,clk); 
cordic_stage cs3 (xout[3],yout[3],aout[3],xout[2],yout[2],angle_in,aout[2],a[3],3,clk); 
cordic_stage cs4 (xout[4],yout[4],aout[4],xout[3],yout[3],angle_in,aout[3],a[4],4,clk); 
cordic_stage cs5 (xout[5],yout[5],aout[5],xout[4],yout[4],angle_in,aout[4],a[5],5,clk); 
cordic_stage cs6 (xout[6],yout[6],aout[6],xout[5],yout[5],angle_in,aout[5],a[6],6,clk); 
cordic_stage cs7 (xout[7],yout[7],aout[7],xout[6],yout[6],angle_in,aout[6],a[7],7,clk); 
cordic_stage cs8 (xout[8],yout[8],aout[8],xout[7],yout[7],angle_in,aout[7],a[8],8,clk); 
//  cordic_stage cs9 (xout[9],yout[9],aout[9],xout[8],yout[8],angle_in,aout[8],a[9],9,clk); 
cordic_final cs10 (x_out,y_out,xout[8],yout[8],angle_in,aout[8],a[9],9,clk);  

endmodule
