`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 10:04:18
// Design Name: 
// Module Name: asciitohex
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


module asciitohex(
    input [8*16-1:0] plain_text,
    output [7:0] ascii_hex [0:3][0:3]
);
    assign ascii_hex[0][0]  = plain_text[8*16-1:8*15];
    assign ascii_hex[1][0]  = plain_text[8*15-1:8*14];
    assign ascii_hex[2][0]  = plain_text[8*14-1:8*13];
    assign ascii_hex[3][0]  = plain_text[8*13-1:8*12];
    assign ascii_hex[0][1]  = plain_text[8*12-1:8*11];
    assign ascii_hex[1][1]  = plain_text[8*11-1:8*10];
    assign ascii_hex[2][1]  = plain_text[8*10-1:8*9];
    assign ascii_hex[3][1]  = plain_text[8*9-1:8*8];
    assign ascii_hex[0][2]  = plain_text[8*8-1:8*7];
    assign ascii_hex[1][2]  = plain_text[8*7-1:8*6];
    assign ascii_hex[2][2] = plain_text[8*6-1:8*5];
    assign ascii_hex[3][2] = plain_text[8*5-1:8*4];
    assign ascii_hex[0][3] = plain_text[8*4-1:8*3];
    assign ascii_hex[1][3] = plain_text[8*3-1:8*2];
    assign ascii_hex[2][3] = plain_text[8*2-1:8*1];
    assign ascii_hex[3][3] = plain_text[8*1-1:8*0];
    
endmodule
