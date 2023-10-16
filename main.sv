module main (
    input logic clk1,
    input logic reset1,
    output logic [31:0] PCIncrementIn,

    output logic [3:0] ALUControl,
    output logic [31:0] InstructionOut,
    output logic [31:0] ALUResult,
    output logic [31:0] PCOut1,
    output logic [31:0] DataA,
    output logic [31:0] DataB,
    output logic [31:0] immediate,
    
    output logic Overflow,
    output logic CarryOut
);
  
    logic [31:0] ReadData;
    logic [2:0] LControl;
    logic [1:0] SControl;
    logic [31:0] BbusOut;
    logic [31:0] WbBusOut;
    logic [31:0] PCOut1;
    
    //logic [25:0] inst;

    pc PC (
        .clk2(clk1),
        .reset2(reset1),
        .PCOut2(PCOut1),
        .PCIncrement(PCIncrementIn)
    ); 

    control Controller (
        .MemWrite(MemWrite),
        .ALUControl(ALUControl),
        .LControl(LControl),
        .SControl(SControl),
        .Branch(Branch),
        .BrEq(BrEq),
        .BrLT(BrLT),
        .ASel(ASel),
        .control_instruction(InstructionOut),
        .RegWrite(RegWrite),  // Declare RegWrite signal as needed
        .ALUSrc(ALUSrc),       // Declare ALUSrc signal as needed
        .MemtoReg(MemtoReg),
        .immSel(immSel)
    );

    immGen SignExtender (
        .immediate(immediate),  // Declare immediate signal as needed
        .inst(InstructionOut[31:7]),
        .immSelect(immSel)        
    );

    instructionMemory InstructionMemory (
        .Address(PCOut1),
        .InstructionOut(InstructionOut)
    );

    registers RegisterFile (
        .DataA(DataA),          // Declare DataA signal as needed
        .DataB(DataB),          // Declare DataB signal as needed
        .DataD(WbBusOut),          // Declare DataD signal as needed
        .AddressA(InstructionOut[19:15]),
        .AddressB(InstructionOut[24:20]),
        .AddressD(InstructionOut[11:7]),
        .RegWriteEnable(RegWrite)  // Declare RegWrite signal as needed
    );
    
    branch Branch_Comparator(
        .A_bus(DataA),
        .B_bus(DataB),
        .BrUn(Branch),
        .BrEq(BrEq),
        .BrLT(BrLT)
    );

    alu MyALU (
        .A((ASel == 1) ? PCOut1: DataA),               // Declare DataA signal as needed
        .B((ALUSrc == 1'b1) ? immediate : DataB),  // Declare DataA, immediate, and DataB signals as needed
        .ALUOp(ALUControl),
        .Result(ALUResult),
        .ZeroFlag(ZeroFlag),  // Declare ZeroFlag signal as needed
        .Overflow(Overflow),
        .CarryOut(CarryOut)
    );
    
    load L(
        .BbusIn(DataB),
        .load_control(LControl),
        .BbusOut(BbusOut)
    );
    
    store S( 
        .WbBusIn((MemtoReg==1'b0) ? ReadData : ALUResult),
        .store_control(SControl),
        .WbBusOut(WbBusOut)
    );

    dataMemory DataMemory (
        .DMEMAddress(ALUResult),
        .WriteData(BbusOut),     // Declare DataB signal as needed
        .ReadData(ReadData),    // Declare ReadData signal as needed
        .MemoryWrite(MemWrite)
    );

endmodule
