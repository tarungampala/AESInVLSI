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
    
    reg [0:7] in [0:3][0:3];
    reg [0:7] key [0:3][0:3];
    wire [0:7] out [0:3][0:3];
    
    aesMain dut(.state(in), .key(key), .out(out));
    
    initial begin
        in[0][0] = 8'h54; in[0][1] = 8'h4F; in[0][2] = 8'h4E; in[0][3] = 8'h20;
        in[1][0] = 8'h77; in[1][1] = 8'h6E; in[1][2] = 8'h69; in[1][3] = 8'h54;
        in[2][0] = 8'h6F; in[2][1] = 8'h65; in[2][2] = 8'h6E; in[2][3] = 8'h77;
        in[3][0] = 8'h20; in[3][1] = 8'h20; in[3][2] = 8'h65; in[3][3] = 8'h6F;
       
        key[0][0] = 8'h54; key[0][1] = 8'h73; key[0][2] = 8'h20; key[0][3] = 8'h67;
        key[1][0] = 8'h68; key[1][1] = 8'h20; key[1][2] = 8'h4B; key[1][3] = 8'h20;
        key[2][0] = 8'h61; key[2][1] = 8'h6D; key[2][2] = 8'h75; key[2][3] = 8'h46;
        key[3][0] = 8'h74; key[3][1] = 8'h79; key[3][2] = 8'h6E; key[3][3] = 8'h75; 
        
        #5;
        $finish();
    end
endmodule
