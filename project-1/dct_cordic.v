`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 14:57:46
// Design Name: 
// Module Name: dct_cordic
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


module dct_cordic(clk,rst,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,
y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15);

input clk,rst;
input [19:0]x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
output [19:0]y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15;

wire [19:0]m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16;
wire [19:0]n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,
            n19,n20,n21,n22,n23,n24,n25,n26,n27,n28,n29,n30,n31,n32;

wire [19:0]t0,t1,t2,t3,t4,t5,t6,t7;
wire [19:0]p0,p1,p2,p3,p4,p5,p6,p7;
wire [19:0]c0,c1,c2,c3,d0,d1,d2,d3;

assign t0=x0+x15;
assign t1=x1+x14;
assign t2=x2+x13;
assign t3=x3+x12;
assign t4=x4+x11;
assign t5=x5+x10;
assign t6=x6+x9;
assign t7=x7+x8;

assign p0=x0-x15;
assign p1=x1-x14;
assign p2=x2-x13;
assign p3=x3-x12;
assign p4=x4-x11;
assign p5=x5-x10;
assign p6=x6-x9;
assign p7=x7-x8;

assign c0=t0+t7;
assign c1=t1+t6;
assign c2=t2+t5;
assign c3=t3+t4;

assign d0=t0-t7;
assign d1=t1-t6;
assign d2=t2-t5;
assign d3=t3-t4;

//even part
cordic_main car1(m1,m2,c1,c0,20'b0001_0110_1000_0000_0000,clk,rst);     //pi/8 = 22.5
cordic_main car2(m3,m4,c2,c3,20'b0001_0110_1000_0000_0000,clk,rst);     //pi/8 = 22.5
cordic_main car3(m5,m6,c0,c1,20'b0010_1101_0000_0000_0000,clk,rst);     //pi/4 = 45
cordic_main car4(m7,m8,c3,c2,20'b0010_1101_0000_0000_0000,clk,rst);     //pi/4 = 45
cordic_main car5(m9,m10,d1,d2,20'b0000_1011_0100_0000_0000,clk,rst);    //pi/16 = 11.25
cordic_main car6(m11,m12,d0,d3,20'b0010_0001_1100_0000_0000,clk,rst);   //3.pi/16 = 33.75
cordic_main car7(m13,m14,d2,d1,20'b0010_0001_1100_0000_0000,clk,rst);   //3.pi/16 = 33.75
cordic_main car8(m15,m16,d3,d0,20'b0000_1011_0100_0000_0000,clk,rst);    //pi/16 = 11.25

//odd part
cordic_main car9(n1,n2,p7,p0,20'b0000_0101_1010_0000_0000,clk,rst);    //pi/32 = 5.625
cordic_main car10(n3,n4,p6,p1,20'b0001_0000_1110_0000_0000,clk,rst);    //3.pi/32 = 16.875
cordic_main car11(n5,n6,p5,p2,20'b0001_1100_0010_0000_0000,clk,rst);    //5.pi/32 = 28.125
cordic_main car12(n7,n8,p4,p3,20'b0010_0111_0110_0000_0000,clk,rst);    //7.pi/32 = 39.375
cordic_main car13(n9,n10,p0,p7,20'b0001_0000_1110_0000_0000,clk,rst);    //3.pi/32 = 16.875
cordic_main car14(n11,n12,p6,p1,20'b0010_0111_0110_0000_0000,clk,rst);    //7.pi/32 = 39.375
cordic_main car15(n13,n14,p5,p2,20'b0000_0101_1010_0000_0000,clk,rst);    //pi/32 = 5.625
cordic_main car16(n15,n16,p3,p4,20'b0001_1100_0010_0000_0000,clk,rst);    //5.pi/32 = 28.125

cordic_main car17(n17,n18,p7,p0,20'b0001_1100_0010_0000_0000,clk,rst);    //5.pi/32 = 28.125
cordic_main car18(n19,n20,p1,p6,20'b0000_0101_1010_0000_0000,clk,rst);    //pi/32 = 5.625
cordic_main car19(n21,n22,p2,p5,20'b0010_0111_0110_0000_0000,clk,rst);    //7.pi/32 = 39.375
cordic_main car20(n23,n24,p4,p3,20'b0001_0000_1110_0000_0000,clk,rst);    //3.pi/32 = 16.875
cordic_main car21(n25,n26,p0,p7,20'b0010_0111_0110_0000_0000,clk,rst);    //7.pi/32 = 39.375
cordic_main car22(n27,n28,p1,p6,20'b0001_1100_0010_0000_0000,clk,rst);    //5.pi/32 = 28.125
cordic_main car23(n29,n30,p2,p5,20'b0001_0000_1110_0000_0000,clk,rst);    //3.pi/32 = 16.875
cordic_main car24(n31,n32,p3,p4,20'b0000_0101_1010_0000_0000,clk,rst);    //pi/32 = 5.625

assign y0 = m6+m8;
assign y2 = m14+m16;
assign y4 = m2+~(m4)+1;
assign y6 = m11+(~m10+1);
assign y8 = m5+m7;
assign y10 = m12+(~m9+1);
assign y12 = m3+~(m1)+1;
assign y14 = m13+(~m15+1);

assign y1 = n2+n4+n6+n8;
assign y3 = n9+~(n11+n13+n16)+1;
assign y5 = n18+n20+~(n21+n24)+1; 
assign y7 = n25+n32+~(n28+n29)+1;
assign y9 = n26+n31+~(n27+n30)+1;
assign y11 = n22+~(n17+n19+n23)+1;
assign y13 = n10+n14+~(n12+n15)+1;
assign y15 = n7+n3+~(n5+n1)+1;

endmodule
