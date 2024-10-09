`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2024 21:12:40
// Design Name: 
// Module Name: mixColumns
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


module mixColumns(
    input [7:0] state [0:3][0:3],
    output [7:0] out [0:3][0:3]
);

    function [7:0] mix;
        input [7:0] x;
        reg [7:0] temp;
        begin
            // Step 2.x: Left shift by 1
            temp = {x[6:0], 1'b0}; // Left shift by 1
            if (x[7] == 1'b1) // Step 2.x: If MSB is 1
                temp = temp ^ 8'h1B; // XOR with 0x1B

            // Step 3.x: Calculate the result for 3.x
            mix = temp; // XOR with original x
        end
    endfunction
    
    function [7:0] mix3;
        input [7:0] x;
        reg [7:0] temp1;
        begin
            // Step 2.x: Left shift by 1
            temp1 = {x[6:0], 1'b0}; // Left shift by 1
            if (x[7] == 1'b1) // Step 2.x: If MSB is 1
                temp1 = temp1 ^ 8'h1B; // XOR with 0x1B

            // Step 3.x: Calculate the result for 3.x
            mix3 = temp1^x; // XOR with original x
        end
    endfunction

    // Mixing columns
    // For each output row, calculate values based on the input state
    assign out[0][0] = mix(state[0][0]) ^ mix3(state[1][0]) ^ state[2][0] ^ state[3][0]; // Column 0
    assign out[0][1] = mix(state[0][1]) ^ mix3(state[1][1]) ^ state[2][1] ^ state[3][1]; // Column 1
    assign out[0][2] = mix(state[0][2]) ^ mix3(state[1][2]) ^ state[2][2] ^ state[3][2]; // Column 2
    assign out[0][3] = mix(state[0][3]) ^ mix3(state[1][3]) ^ state[2][3] ^ state[3][3]; // Column 3

    assign out[1][0] = state[0][0] ^ mix(state[1][0]) ^ mix3(state[2][0]) ^ state[3][0]; // Column 0
    assign out[1][1] = state[0][1] ^ mix(state[1][1]) ^ mix3(state[2][1]) ^ state[3][1]; // Column 1
    assign out[1][2] = state[0][2] ^ mix(state[1][2]) ^ mix3(state[2][2]) ^ state[3][2]; // Column 2
    assign out[1][3] = state[0][3] ^ mix(state[1][3]) ^ mix3(state[2][3]) ^ state[3][3]; // Column 3

    assign out[2][0] = state[0][0] ^ state[1][0] ^ mix(state[2][0]) ^ mix3(state[3][0]); // Column 0
    assign out[2][1] = state[0][1] ^ state[1][1] ^ mix(state[2][1]) ^ mix3(state[3][1]); // Column 1
    assign out[2][2] = state[0][2] ^ state[1][2] ^ mix(state[2][2]) ^ mix3(state[3][2]); // Column 2
    assign out[2][3] = state[0][3] ^ state[1][3] ^ mix(state[2][3]) ^ mix3(state[3][3]); // Column 3

    assign out[3][0] = mix3(state[0][0]) ^ state[1][0] ^ state[2][0] ^ mix(state[3][0]); // Column 0
    assign out[3][1] = mix3(state[0][1]) ^ state[1][1] ^ state[2][1] ^ mix(state[3][1]); // Column 1
    assign out[3][2] = mix3(state[0][2]) ^ state[1][2] ^ state[2][2] ^ mix(state[3][2]); // Column 2
    assign out[3][3] = mix3(state[0][3]) ^ state[1][3] ^ state[2][3] ^ mix(state[3][3]); // Column 3

endmodule
