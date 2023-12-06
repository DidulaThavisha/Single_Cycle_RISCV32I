`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 06:51:29 PM
// Design Name: 
// Module Name: branch
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


module branch(
    input logic [31:0] A_bus,
    input logic [31:0] B_bus,
    input logic BrUn,
    output logic BrEq,
    output logic BrLT
);
    
always_comb begin
    if (BrUn==1)begin
        if ($unsigned(A_bus)==$unsigned(B_bus))
            BrEq=1;
        else if ($unsigned(A_bus) < $unsigned(B_bus))
            BrLT=1;
    end 
    else begin
        if (A_bus==B_bus)
            BrEq=1;
        else if (A_bus < B_bus)
            BrLT=1;
    end 
          
end 

endmodule
