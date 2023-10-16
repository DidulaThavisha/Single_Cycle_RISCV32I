`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 10:21:30 AM
// Design Name: 
// Module Name: load
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


module load(
    input logic [31:0] BbusIn,
    input logic [2:0] load_control,
    output logic [31:0] BbusOut
    );
    
always_comb begin
    case(load_control)
        3'b000:
            BbusOut = {{24{BbusIn[31]}}, BbusIn[7:0]};            //LB
        3'b001:
            BbusOut = {{24{BbusIn[31]}}, BbusIn[15:0]};            //LH
        3'b010:
            BbusOut = BbusIn;
        3'b011:
            BbusOut = {24'b0, BbusIn[7:0]};
        3'b100:
            BbusOut = {16'b0, BbusIn[15:0]};
    endcase
end    


endmodule
