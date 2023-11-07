`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 09:20:32 AM
// Design Name: 
// Module Name: alu
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

module alu (
  input logic [31:0] A,
  input logic [31:0] B,
  input logic [3:0] ALUOp,
  output logic [31:0] Result,
  output logic ZeroFlag,
  output logic Overflow,
  output logic CarryOut
);

always_comb begin
  case (ALUOp)
    4'b0000: Result = A + B;                        // Addition
    4'b0001: Result = A - B;                        // Subtraction
    4'b0010: Result = A << $unsigned(B);            // Left shift (logical) 
    4'b0011: Result = A < B;                        //SLT
    4'b0100: Result = $unsigned(A) < $unsigned(B);  //SLTU
    4'b0101: Result = A ^ B;                        // Bitwise XOR
    4'b0110: Result = A >>  $unsigned(B);           // Right shift (logical)
    4'b0111: Result = A >>> $unsigned(B);           // Right shift (arithmetic)
    4'b1000: Result = A | B;                        // Bitwise OR
    4'b1001: Result = A & B;                        // Bitwise AND
    default: Result = 32'h0;                        // Default to zero output
  endcase

  // Zero flag
  ZeroFlag = (Result == 32'h0);

  // Overflow flag for addition
  if (ALUOp == 4'b0000) begin
      if ((A[31] & B[31] & ~Result[31]) | (~A[31] & ~B[31] & Result[31]))
          Overflow = 1'b1;
      else
          Overflow = 1'b0;
  end else begin
      Overflow = 1'b0;
  end

  // Carry out for addition
  if (ALUOp == 4'b0000) begin
      CarryOut = (A[31] & B[31]) | ((A[31] ^ B[31]) & (A[31] ^ Result[31]));
  end else if (ALUOp == 4'b0001) begin
      CarryOut = (A[31] & ~B[31]) | ((A[31] ^ B[31]) & (A[31] ^ Result[31]));
  end else begin
      CarryOut = 1'b0;
  end
end

endmodule
