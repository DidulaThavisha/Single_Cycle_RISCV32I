`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 10:21:31 AM
// Design Name: 
// Module Name: store
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


module store(
    input logic [31:0] WbBusIn,
    input logic [1:0] store_control,
    output logic [31:0] WbBusOut 
    );
    
always_comb begin
    case(store_control)
        3'b00:
            WbBusOut = {{24{WbBusIn[31]}}, WbBusIn[7:0]};            //SB
        3'b01:
            WbBusOut = {{24{WbBusIn[31]}}, WbBusIn[15:0]};           //SH
        3'b10:
            WbBusOut = WbBusIn;                                      //SW
        
    endcase
end  
endmodule
