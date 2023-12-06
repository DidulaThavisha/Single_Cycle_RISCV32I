`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 09:09:22 PM
// Design Name: 
// Module Name: main_tb
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



module main_tb();

  logic clk;
  logic reset;
  logic [31:0] PCIn;
  //logic [31:0] PCOut;
  //logic [31:0] InstructionOut;
  //logic [3:0] ALUControl;
  logic [31:0] ALUResult;
  //logic [31:0] DataA;
  //logic [31:0] DataB;
  //logic [31:0] immediate;
 
  

  main u1 (
    .clk1(clk),
    .reset1(reset),   
    .ALUResult(ALUResult)
  );
 
  

  initial begin
    clk = 1'b1;
    reset = 1'b1;
    PCIn = 4;

    #20 reset = 1'b0;
    
  end

  always    #10 clk = ~clk;
    


endmodule


/*
module riscv_tb;

 logic clk;
 logic rst;
 logic [31:0] memRdData;
 logic [31:0] ALUResult;
 logic [31:0] ALUSrc2;
 logic [31:0] rd1Data;
 logic [31:0] rd2Data;
 logic [31:0] immResult;
 logic [15:0] controlSignal;
 logic [31:0] instruction;
 logic [31:0] address;
 logic [1:0] pcSel;
 logic [31:0] branchAddress;
 logic [31:0] pcadderAddress;


	riscv my_riscv(
    .clk(clk),
    .rst(rst),
	 .memRdData(memRdData),
    .ALUResult(ALUResult),
	 .ALUSrc2(ALUSrc2),
	 .rd1Data(rd1Data),
	 .rd2Data(rd2Data),
	 .immResult(immResult),
	 .instruction(instruction),
	 .controlSignal(controlSignal),
	 .address(address),
	 .pcSel(pcSel),
	 .branchAddress(branchAddress),
    .pcadderAddress(pcadderAddress)
  );


  always begin
    #5 clk = ~clk; 
  end

  // Reset and apply PC_next values
  initial begin
    clk = 0;
    rst = 0;

    #10 rst = 0;

    
    #700;
	 $display("finish");
    $finish;
  end


  always @(posedge clk) begin
	 $display("instruction %h", instruction);
    $display("Control Signal %h", controlSignal);
	 $display("operation %h",controlSignal[6:3]);
    $display("rd1 %h", rd1Data);
	 $display("rd2 %h", rd2Data);
	 $display("src2 %h", ALUSrc2);
    $display("result %h", ALUResult);
	 $display("end of clock");
	 
  end

endmodule
*/
