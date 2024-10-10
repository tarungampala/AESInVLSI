`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 22:34:09
// Design Name: 
// Module Name: aesMaintb
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


module aesMaintb();
    reg [8*16-1:0] plain_text;
    reg [8*16-1:0] key_text;
    reg [0:7] in [0:3][0:3];
    reg [0:7] key [0:3][0:3];
    wire [7:0] out [0:15];
    asciitohex cha(.plain_text(plain_text), .ascii_hex(in));
    asciitohex ke(.plain_text(key_text), .ascii_hex(key));
    
    aesMain dut(.state(in), .key(key), .out(out));
    
    initial begin
         key_text = "Thats my Kung Fu";
         plain_text = "Two One Nine Two";
         #5;
         $finish();
    end
endmodule
