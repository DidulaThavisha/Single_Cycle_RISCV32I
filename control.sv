module control(
	input logic [31:0] control_instruction,
	input logic BrEq,
	input logic BrLT,
	output logic MemtoReg,
	output logic MemWrite,
	output logic Branch,	
	output logic immSel,
	output logic [3:0] ALUControl,
	output logic [2:0] LControl,
	output logic [1:0] SControl,
	output logic ASel,
	output logic ALUSrc,
	output logic RegDst,
	output logic RegWrite
);

// Control memory
logic [6:0] opcode;  // Declare the reg variable
logic [2:0]func3;
logic [6:0]func7;
logic [6:0]imm;


always @(control_instruction)
begin
	opcode = control_instruction[6:0];
	case(opcode)
		7'b0110011 : begin             //R
			func3 = control_instruction[14:12];
			func7 = control_instruction[31:25];
			case(func3)
				3'b000 : begin
					case(func7) 
						7'b0000000 : begin			//Add
							MemtoReg  =1'b1;
							MemWrite  =1'b0;
							Branch    =1'b0;
							ALUControl=4'b0000;
							ALUSrc    =1'b0;
							RegDst    =1'b0;
							RegWrite  =1'b1;
							immSel    =0;
							LControl  =3'b010;
							SControl  =2'b10;
							ASel = 0;
						end
						7'b0100000 : begin			//SUB
							MemtoReg  =1;
							MemWrite  =0;
							Branch    =0;
							ALUControl=4'b0001;
							ALUSrc    =0;
							RegDst    =0;
							RegWrite  =1;
							immSel    =0;
							LControl  =3'b010;
							SControl  =2'b10;
							ASel = 0;
						end
					endcase
				end
				3'b001 : begin							//SLL
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0010;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;					
				end
				3'b010 : begin							//SLT
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0011;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end 
				3'b011 : begin 						   //SLTU
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0100;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b100 : begin							//XOR
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0101;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b101 : begin
					case(func7) 
						7'b0000000 : begin			//SRL
							MemtoReg  =1'b1;
							MemWrite  =1'b0;
							Branch    =1'b0;
							ALUControl=4'b0110;
							ALUSrc    =1'b0;
							RegDst    =1'b0;
							RegWrite  =1'b1;
							immSel    =0;
							LControl  =3'b010;
					        SControl  =2'b10;
					        ASel = 0;
							
						end
						7'b0100000 : begin			//SRA
							MemtoReg  =1;
							MemWrite  =0;
							Branch    =0;
							ALUControl=4'b0111;
							ALUSrc    =0;
							RegDst    =0;
							RegWrite  =1;
							immSel    =0;
							LControl  =3'b010;
					        SControl  =2'b10;
					        ASel = 0;
						end
					endcase
				end
				3'b110 : begin 						//OR
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b1000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b111 : begin 						//AND
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b1001;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =1;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
			endcase
		end
		7'b0000011 : begin				//I
			func3 = control_instruction[14:12];
			case(func3)
				3'b000 : begin							//LB
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b000;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b001 : begin							//LH							
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b001;
					SControl  =2'b10;	
					ASel = 0;				
				end
				3'b010 : begin							//LW							
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b100 : begin							//LBU							
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b011;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b101 : begin							//LHU
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b100;
					SControl  =2'b10;
					ASel = 0;
				end
			endcase				
		end
		7'b0010011 : begin				//I
			func3 = control_instruction[14:12];
			case(func3)
				3'b000 : begin							//ADDI
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b001 : begin							//SLLI							
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0010;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b010 : begin							//SLTI							
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0011;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b011 : begin							//SLTIU							
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0100;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b100 : begin							//XORI						
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0101;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b101 : begin													
					imm  = control_instruction[31:25];
					case(imm)
						7'b0000000 : begin			//SRLI
							MemtoReg  =1;
							MemWrite  =0;
							Branch    =0;
							ALUControl=4'b0110;
							ALUSrc    =1;
							RegDst    =0;
							RegWrite  =1;
							immSel    =1;
							LControl  =3'b010;
					        SControl  =2'b10;
					        ASel = 0;	
						end
						7'b0100000 : begin			//SRAI
							MemtoReg  =1;
							MemWrite  =0;
							Branch    =0;
							ALUControl=4'b0111;
							ALUSrc    =1;
							RegDst    =0;
							RegWrite  =1;
							immSel    =1;
							LControl  =3'b010;
					        SControl  =2'b10;
					        ASel = 0;
						end
					endcase
				end
				3'b110 : begin							//ORI
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b1000;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b111 : begin							//ANDI
					MemtoReg  =1;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b1001;
					ALUSrc    =1;
					RegDst    =0;
					RegWrite  =1;
					immSel    =1;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
			endcase			
		end
		7'b1100111 : begin				//I		//JALR
			MemtoReg  =0;
			MemWrite  =0;
			Branch    =0;
			ALUControl=4'b0000;
			ALUSrc    =1;
			RegDst    =0;
			RegWrite  =1;
			immSel    =0;
			LControl  =3'b010;
			SControl  =2'b10;
			ASel = 0;
			
		end
		7'b0100011 : begin				//S
			func3 = control_instruction[14:12];
			case(func3)
				3'b000 : begin							//SB
					MemtoReg  =0;
					MemWrite  =1;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b00;
					ASel = 0;
				end
				3'b001 : begin							//SH					
					MemtoReg  =0;
					MemWrite  =1;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b01;
					ASel = 0;					
				end
				3'b010 : begin							//SW				
					MemtoReg  =0;
					MemWrite  =1;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
			endcase
		end
		7'b1100011 : begin				//B
			func3 = control_instruction[14:12];
			case(func3)
				3'b000 : begin							//BEQ
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b001 : begin							//BNE					
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;					
				end
				3'b100 : begin							//BLT				
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b101 : begin							//BGE						
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b110 : begin							//BLTU
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
				3'b111 : begin							//BGEU
					MemtoReg  =0;
					MemWrite  =0;
					Branch    =0;
					ALUControl=4'b0000;
					ALUSrc    =0;
					RegDst    =0;
					RegWrite  =0;
					immSel    =0;
					LControl  =3'b010;
					SControl  =2'b10;
					ASel = 0;
				end
			endcase
			
		end
		7'b0110111 : begin				//U-1
			MemtoReg  =0;
			MemWrite  =0;
			Branch    =0;
			ALUControl=4'b0000;
			ALUSrc    =0;
			RegDst    =0;
			RegWrite  =0;
			immSel    =0;
			LControl  =3'b010;
		    SControl  =2'b10;
		    ASel = 0;
			
		end
		7'b0010111 : begin				//U-2
			MemtoReg  =0;
			MemWrite  =0;
			Branch    =0;
			ALUControl=4'b0000;
			ALUSrc    =0;
			RegDst    =0;
			RegWrite  =0;
			immSel    =0;
			LControl  =3'b010;
			SControl  =2'b10;
			ASel = 0;
			
		end
		7'b1101111 : begin				//J
			MemtoReg  =0;
			MemWrite  =0;
			Branch    =0;
			ALUControl=4'b0000;
			ALUSrc    =0;
			RegDst    =0;
			RegWrite  =0;
			immSel    =0;
			LControl  =3'b010;
		    SControl  =2'b10;
		    ASel = 0;
			
		end
			
			
	endcase
end

endmodule


