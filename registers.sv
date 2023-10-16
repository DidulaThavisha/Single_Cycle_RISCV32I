module registers (
  output logic [31:0] DataA,
  output logic [31:0] DataB,
  input logic [31:0] DataD,  
  input logic [4:0] AddressA,
  input logic [4:0] AddressB,
  input logic [4:0] AddressD,
  // input [4:0] ReadRegisterA,
  // input [4:0] ReadRegisterB,
  input logic RegWriteEnable
);

logic [31:0] RegisterA [31:0];


initial begin
    RegisterA[0]=32'h00000001;
    RegisterA[1]=32'h00000002;
    RegisterA[2]=32'h00000003;
    RegisterA[3]=32'h00000004;
    RegisterA[4]=32'h00000005;
    RegisterA[5]=32'h00000006;
    RegisterA[6]=32'h00000007;
    RegisterA[7]=32'h00000008;
    RegisterA[8]=32'h00000009;
    RegisterA[9]=32'h00000010;
    RegisterA[10]=32'h00000011;
    RegisterA[11]=32'h00000012;
    RegisterA[12]=32'h00000013;
    RegisterA[13]=32'h00000014;
    RegisterA[14]=32'h00000015;
    RegisterA[15]=32'h00000016;
    RegisterA[16]=32'h00000017;
    RegisterA[17]=32'h00000018;
    RegisterA[18]=32'h00000019;
    RegisterA[19]=32'h00000020;
    RegisterA[20]=32'h00000021;
    RegisterA[21]=32'h00000022;
    RegisterA[22]=32'h00000023;
    RegisterA[23]=32'h00000024;
    RegisterA[24]=32'h00000025;
    RegisterA[25]=32'h00000026;
    RegisterA[26]=32'h00000027;
    RegisterA[27]=32'h00000028;
    RegisterA[28]=32'h00000029;
    RegisterA[29]=32'h00000030;
    RegisterA[30]=32'h00000031;
    RegisterA[31]=32'h00000032;
 

    /**
    
    RegisterB[0]=32'h00000001;
    RegisterB[1]=32'h00000002;
    RegisterB[2]=32'h00000003;
    RegisterB[3]=32'h00000004;
    RegisterB[4]=32'h00000005;
    RegisterB[5]=32'h00000006;
    RegisterB[6]=32'h00000007;
    RegisterB[7]=32'h00000008;
    RegisterB[8]=32'h00000009;
    RegisterB[9]=32'h00000010;
    RegisterB[10]=32'h00000011;
    RegisterB[11]=32'h00000012;
    RegisterB[12]=32'h00000013;
    RegisterB[13]=32'h00000014;
    RegisterB[14]=32'h00000015;
    RegisterB[15]=32'h00000016;
    RegisterB[16]=32'h00000017;
    RegisterB[17]=32'h00000018;
    RegisterB[18]=32'h00000019;
    RegisterB[19]=32'h00000020;
    RegisterB[20]=32'h00000021;
    RegisterA[21]=32'h00000022;
    RegisterB[22]=32'h00000023;
    RegisterB[23]=32'h00000024;
    RegisterB[24]=32'h00000025;
    RegisterB[25]=32'h00000026;
    RegisterB[26]=32'h00000027;
    RegisterB[27]=32'h00000028;
    RegisterB[28]=32'h00000029;
    RegisterB[29]=32'h00000030;
    RegisterB[30]=32'h00000031;
    RegisterB[31]=32'h00000032; 
**/
end

// Read data from the registers
always @(*) begin
  DataA = RegisterA[AddressA];
  DataB = RegisterA[AddressB];
  if (RegWriteEnable == 1'b1) begin
    RegisterA[AddressD] = DataD;
  end
end
/**
// Write to the registers
always @(posedge RegWriteEnable) begin
  if (AddressA != 5'b00000) // Make sure to avoid writing to register 0
    RegisterA[AddressA] <= DataD;
  if (AddressB != 5'b00001)
    RegisterB[AddressB] <= DataD;
end
**/
endmodule
