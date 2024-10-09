`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 23:03:44
// Design Name: 
// Module Name: roundKeyGen
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


module roundKeyGen(
    input [7:0] key [0:3][0:3],
    input [7:0] rnd,
    output [7:0] out [0:3][0:3]
    );
    
    reg [7:0] k1 [0:3][0:3];
    assign k1[0] = {key[0][0], key[1][0], key[2][0], key[3][0]};
    assign k1[1] = {key[0][1], key[1][1], key[2][1], key[3][1]};
    assign k1[2] = {key[0][2], key[1][2], key[2][2], key[3][2]};
    assign k1[3] = {key[0][3], key[1][3], key[2][3], key[3][3]};
    
    //for W4
    reg [7:0] sft [0:3][0:3];
    reg [7:0] sb [0:3][0:3];
    reg [7:0] rc [0:3][0:3];
    reg [7:0] temp [0:3][0:3];
    assign sft[0] = {k1[3][1:3], k1[3][0]};
    subBytes sb0(.state(sft), .outState(sb));
    assign rc[0][0] = sb[0][0] ^ rnd;
    assign rc[0][1] = sb[0][1] ^ 7'h00;
    assign rc[0][2] = sb[0][2] ^ 7'h00;
    assign rc[0][3] = sb[0][3] ^ 7'h00;
    assign temp[0][0] = rc[0][0] ^ k1[0][0];
    assign temp[0][1] = rc[0][1] ^ k1[0][1];
    assign temp[0][2] = rc[0][2] ^ k1[0][2];
    assign temp[0][3] = rc[0][3] ^ k1[0][3];
    
    //for w5
    assign temp[1][0] = temp[0][0] ^ k1[1][0];
    assign temp[1][1] = temp[0][1] ^ k1[1][1];
    assign temp[1][2] = temp[0][2] ^ k1[1][2];
    assign temp[1][3] = temp[0][3] ^ k1[1][3];
    
    //for w6
    assign temp[2][0] = temp[1][0] ^ k1[2][0];
    assign temp[2][1] = temp[1][1] ^ k1[2][1];
    assign temp[2][2] = temp[1][2] ^ k1[2][2];
    assign temp[2][3] = temp[1][3] ^ k1[2][3];
    
    //for w7
    assign temp[3][0] = temp[2][0] ^ k1[3][0];
    assign temp[3][1] = temp[2][1] ^ k1[3][1];
    assign temp[3][2] = temp[2][2] ^ k1[3][2];
    assign temp[3][3] = temp[2][3] ^ k1[3][3];
    
    assign out[0] = {temp[0][0], temp[1][0], temp[2][0], temp[3][0]};
    assign out[1] = {temp[0][1], temp[1][1], temp[2][1], temp[3][1]};
    assign out[2] = {temp[0][2], temp[1][2], temp[2][2], temp[3][2]};
    assign out[3] = {temp[0][3], temp[1][3], temp[2][3], temp[3][3]};
    
endmodule
