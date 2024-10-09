`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 18:58:29
// Design Name: 
// Module Name: roundkey
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


module roundkey(
input [7:0] state [0:3][0:3],
input [7:0] key [0:3][0:3],
output [7:0] out [0:3][0:3]
    );
    
    assign out[0][0] = state[0][0] ^ key[0][0];
    assign out[0][1] = state[0][1] ^ key[0][1];
    assign out[0][2] = state[0][2] ^ key[0][2];
    assign out[0][3] = state[0][3] ^ key[0][3];

    assign out[1][0] = state[1][0] ^ key[1][0];
    assign out[1][1] = state[1][1] ^ key[1][1];
    assign out[1][2] = state[1][2] ^ key[1][2];
    assign out[1][3] = state[1][3] ^ key[1][3];

    assign out[2][0] = state[2][0] ^ key[2][0];
    assign out[2][1] = state[2][1] ^ key[2][1];
    assign out[2][2] = state[2][2] ^ key[2][2];
    assign out[2][3] = state[2][3] ^ key[2][3];

    assign out[3][0] = state[3][0] ^ key[3][0];
    assign out[3][1] = state[3][1] ^ key[3][1];
    assign out[3][2] = state[3][2] ^ key[3][2];
    assign out[3][3] = state[3][3] ^ key[3][3];
endmodule
