`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 22:20:56
// Design Name: 
// Module Name: aesMain
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


module aesMain(
    input [7:0] state [0:3][0:3],
    input [7:0] key [0:3][0:3],
    output [7:0] out [0:3][0:3]
    );
    //round 0
    reg [7:0] r0 [0:3][0:3];
    roundkey rd0(.state(state), .key(key), .out(r0));
    
    //round1
    reg [7:0] s1 [0:3][0:3]; 
    reg [7:0] sf1 [0:3][0:3];
    reg [7:0] r1 [0:3][0:3];
    reg [7:0] rgen1 [0:3][0:3];
    reg [7:0] temp1 [0:3][0:3];
    subBytes sb1(.state(r0), .outState(s1));
    shiftRows sr1(.in(s1), .out(sf1));
    mixColumns mc1(.state(sf1), .out(r1));
    reg [7:0] rnd;
    assign rnd = 7'h01;
    roundKeyGen rg1(.key(key), .rnd(rnd), .out(rgen1));
    roundkey rd1(.state(r1), .key(rgen1), .out(temp1));
    
    //round2
    reg [7:0] s2 [0:3][0:3];
    reg [7:0] sf2 [0:3][0:3];
    reg [7:0] r2 [0:3][0:3];
    reg [7:0] rgen2 [0:3][0:3];
    reg [7:0] temp2 [0:3][0:3];
    subBytes sb2(.state(temp1), .outState(s2));
    shiftRows sr2(.in(s2), .out(sf2));
    mixColumns mc2(.state(sf2), .out(r2));
    reg [7:0] rnd1;
    assign rnd1 = 7'h02;
    roundKeyGen rg2(.key(rgen1), .rnd(rnd1), .out(rgen2));
    roundkey rd2(.state(r2), .key(rgen2), .out(temp2));
    
    //round3
    reg [7:0] s3 [0:3][0:3];
    reg [7:0] sf3 [0:3][0:3];
    reg [7:0] r3 [0:3][0:3];
    reg [7:0] rgen3 [0:3][0:3];
    reg [7:0] temp3 [0:3][0:3];
    subBytes sb3(.state(temp2), .outState(s3));
    shiftRows sr3(.in(s3), .out(sf3));
    mixColumns mc3(.state(sf3), .out(r3));
    reg [7:0] rnd2;
    assign rnd2 = 7'h04;
    roundKeyGen rg3(.key(rgen2), .rnd(rnd2), .out(rgen3));
    roundkey rd3(.state(r3), .key(rgen3), .out(temp3));
    
    //round4
    reg [7:0] s4 [0:3][0:3];
    reg [7:0] sf4 [0:3][0:3];
    reg [7:0] r4 [0:3][0:3];
    reg [7:0] rgen4 [0:3][0:3];
    reg [7:0] temp4 [0:3][0:3];
    subBytes sb4(.state(temp3), .outState(s4));
    shiftRows sr4(.in(s4), .out(sf4));
    mixColumns mc4(.state(sf4), .out(r4));
    reg [7:0] rnd3;
    assign rnd3 = 7'h08;
    roundKeyGen rg4(.key(rgen3), .rnd(rnd3), .out(rgen4));
    roundkey rd4(.state(r4), .key(rgen4), .out(temp4));
    
    //round5
    reg [7:0] s5 [0:3][0:3];
    reg [7:0] sf5 [0:3][0:3];
    reg [7:0] r5 [0:3][0:3];
    reg [7:0] rgen5 [0:3][0:3];
    reg [7:0] temp5 [0:3][0:3];
    subBytes sb5(.state(temp4), .outState(s5));
    shiftRows sr5(.in(s5), .out(sf5));
    mixColumns mc5(.state(sf5), .out(r5));
    reg [7:0] rnd4;
    assign rnd4 = 7'h10;
    roundKeyGen rg5(.key(rgen4), .rnd(rnd4), .out(rgen5));
    roundkey rd5(.state(r5), .key(rgen5), .out(temp5));
    
    //round6
    reg [7:0] s6 [0:3][0:3];
    reg [7:0] sf6 [0:3][0:3];
    reg [7:0] r6 [0:3][0:3];
    reg [7:0] rgen6 [0:3][0:3];
    reg [7:0] temp6 [0:3][0:3];
    subBytes sb6(.state(temp5), .outState(s6));
    shiftRows sr6(.in(s6), .out(sf6));
    mixColumns mc6(.state(sf6), .out(r6));
    reg [7:0] rnd5;
    assign rnd5 = 7'h20;
    roundKeyGen rg6(.key(rgen5), .rnd(rnd5), .out(rgen6));
    roundkey rd6(.state(r6), .key(rgen6), .out(temp6));
    
    //round7
    reg [7:0] s7 [0:3][0:3];
    reg [7:0] sf7 [0:3][0:3];
    reg [7:0] r7 [0:3][0:3];
    reg [7:0] rgen7 [0:3][0:3];
    reg [7:0] temp7 [0:3][0:3];
    subBytes sb7(.state(temp6), .outState(s7));
    shiftRows sr7(.in(s7), .out(sf7));
    mixColumns mc7(.state(sf7), .out(r7));
    reg [7:0] rnd6;
    assign rnd6 = 7'h40;
    roundKeyGen rg7(.key(rgen6), .rnd(rnd6), .out(rgen7));
    roundkey rd7(.state(r7), .key(rgen7), .out(temp7));
    
    //round8
    reg [7:0] s8 [0:3][0:3];
    reg [7:0] sf8 [0:3][0:3];
    reg [7:0] r8 [0:3][0:3];
    reg [7:0] rgen8 [0:3][0:3];
    reg [7:0] temp8 [0:3][0:3];
    subBytes sb8(.state(temp7), .outState(s8));
    shiftRows sr8(.in(s8), .out(sf8));
    mixColumns mc8(.state(sf8), .out(r8));
    reg [7:0] rnd7;
    assign rnd7 = 8'h80;
    roundKeyGen rg8(.key(rgen7), .rnd(rnd7), .out(rgen8));
    roundkey rd8(.state(r8), .key(rgen8), .out(temp8));
    
    //round9
    reg [7:0] s9 [0:3][0:3];
    reg [7:0] sf9 [0:3][0:3];
    reg [7:0] r9 [0:3][0:3];
    reg [7:0] rgen9 [0:3][0:3];
    reg [7:0] temp9 [0:3][0:3];
    subBytes sb9(.state(temp8), .outState(s9));
    shiftRows sr9(.in(s9), .out(sf9));
    mixColumns mc9(.state(sf9), .out(r9));
    reg [7:0] rnd8;
    assign rnd8 = 8'h1B;
    roundKeyGen rg9(.key(rgen8), .rnd(rnd8), .out(rgen9));
    roundkey rd9(.state(r9), .key(rgen9), .out(temp9));
    
    //round10
    reg [7:0] s10 [0:3][0:3];
    reg [7:0] r10 [0:3][0:3];
    reg [7:0] rgen10 [0:3][0:3];
    reg [7:0] temp10 [0:3][0:3];
    subBytes sb10(.state(temp9), .outState(s10));
    shiftRows sr10(.in(s10), .out(r10));
    reg [7:0] rnd9;
    assign rnd9 = 8'h36;
    roundKeyGen rg10(.key(rgen9), .rnd(rnd9), .out(rgen10));
    roundkey rd10(.state(r10), .key(rgen10), .out(temp10));
    
    assign out[0] = {temp10[0][0], temp10[1][0], temp10[2][0], temp10[3][0]};
    assign out[1] = {temp10[0][1], temp10[1][1], temp10[2][1], temp10[3][1]};
    assign out[2] = {temp10[0][2], temp10[1][2], temp10[2][2], temp10[3][2]};
    assign out[3] = {temp10[0][3], temp10[1][3], temp10[2][3], temp10[3][3]};
    
    
endmodule
