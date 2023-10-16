`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 04:11:08 PM
// Design Name: 
// Module Name: immGen
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


module immGen(
  input logic [24:0] inst,
  input logic immSelect,
  output logic [31:0] immediate
);
  
always @(*) begin
 
  if (immSelect == 1) begin
    immediate = {{20{inst[24]}}, inst[24:13]};
  end
  else begin
    immediate = {{20{inst[11]}},inst[24:18],inst[4:0]};
  end
end
  //logic [31:12] imm_upper = {inst[11], {19{inst[11]}}};
  //assign immediate = {{20{inst[11]}}, inst[11:0]};
  //assign immediate = {imm_upper, inst[11:0]};

endmodule
