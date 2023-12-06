`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 01:39:56 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    output reg divided_clk
    );

reg [31:0]count;

localparam required_rate = 2;
localparam max_count = 50_000_000/required_rate;

always @(posedge clk) begin

if(count == max_count-1) begin 
    count <= 0;             
    divided_clk <= ~divided_clk;            
end else begin
    count <= count + 1;     
    end

end

endmodule
