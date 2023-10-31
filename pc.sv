`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 04:01:40 PM
// Design Name: 
// Module Name: pc
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
////////////////////////////////////////////////////////////////////////////////


module pc (
  input logic clk2,
  input logic [31:0] PCIncrement,
  input logic reset2,
  output logic [31:0] PCOut2
);

  always_ff @(posedge clk2) begin
   
    if (reset2)
      PCOut2 <= 32'h0; // Reset the PC to zero
    else
      PCOut2 <= PCOut2 + 4; // Increment the PC
  end

endmodule

