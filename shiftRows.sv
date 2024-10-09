`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 19:39:08
// Design Name: 
// Module Name: shiftRows
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


module shiftRows(
    input [7:0] in [0:3][0:3],
    output [7:0] out [0:3][0:3]
    );
    assign out[0] = in[0];
    assign out[1] = {in[1][1:3], in[1][0]};
    assign out[2] = {in[2][2:3], in[2][0:1]};
    assign out[3] = {in[3][3], in[3][0:2]};
endmodule
