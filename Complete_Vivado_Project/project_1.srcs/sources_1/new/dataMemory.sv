module dataMemory (
  input logic [31:0] DMEMAddress,
  input logic [31:0] WriteData,
  input logic MemoryWrite,
  output logic [31:0] ReadData
  
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
end

// Read data from the registers

//assign WriteData = RegisterB[DMEMAddress];
always_comb begin
    if (MemoryWrite==1)
      RegisterA[DMEMAddress] = WriteData;    
    else 
      ReadData = RegisterA[DMEMAddress];
          
end 


endmodule
