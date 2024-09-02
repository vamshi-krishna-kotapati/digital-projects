`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2024 15:12:47
// Design Name: 
// Module Name: fixed_multi
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


module fixed_multi(    output reg [19:0] out, 
    input [19:0] A, 
    input [19:0] B, 
    input rst 
    ); 
  
reg [39:0] prod,x1; 
wire [19:0] B1; 
  
assign B1 = (B[19] == 1) ? ~B + 1 : B; 
always@* 
  begin 
  
    prod = 0; 
    out = 0; 
   if(rst == 0) 
    begin  
        prod = A*B1; 
         
        if(B[19] == 1) 
            x1 = ~prod + 1; 
        else 
           x1 = prod; 
                
out[19:12] = x1[31:24]; 
out[11:0]  = x1[23:12];    
end     
end  
endmodule