/*
   CS/ECE 552 Spring '23
  
   Filename        : forward.v
   Description     : This is the overall module for the forwarding logic of the processor.
*/
`default_nettype none
module forwardToM (
	// allows us to determine the registers we are reading in MEM stage.
	input wire [15:0] Instruction_EXMEM_MEMWB,
	input wire MemWrite_EXMEM_out, // and if it's a ST.
	
	// allows us to determine write reg in WB stage and if it's a LD.
	input wire RegWriteEnable_MEMWB_out,
	input wire [1:0] WriteRegSel_MEMWB_out,
	input wire [15:0] Instruction_MEMWB_out,
	input wire MemRead_MEMWB_out,
	
	// the data that will get forwarded
	input wire [15:0] MemReadRst_MEMWB_out,
	
	// the data we will use if we do not forward.
	input wire [15:0] RegData2_EXMEM_out,
	
	// forwarded outputs
	output wire [15:0] RegData2_after_forward_M
);

	parameter return_addr_reg = 3'h7;

	// The registers whose value we need to use in MEM stage.
	wire [2:0] Reg_being_stored;
	assign Reg_being_stored = Instruction_EXMEM_MEMWB [7:5];
			
	// The register we are writing to in the instruction that is in the WB stage
	wire [2:0] WB_destination_reg;

	// Use the same mux that we use in the WB stage in the decode module. 
	assign WB_destination_reg = 	WriteRegSel_MEMWB_out==2'b00 ? Instruction_MEMWB_out[7:5] :
									WriteRegSel_MEMWB_out==2'b01 ? Instruction_MEMWB_out[4:2] :
									WriteRegSel_MEMWB_out==2'b10 ? Instruction_MEMWB_out[10:8] : return_addr_reg;


	
	//////////////////////REG 2 Forwarding ////////////////////////

	// MEM -> MEM forwarding (from start of WB to start of MEM)
	assign RegData2_after_forward_M = RegWriteEnable_MEMWB_out ? 
										(((WB_destination_reg==Reg_being_stored) & MemRead_MEMWB_out & MemWrite_EXMEM_out) ? 
										
										MemReadRst_MEMWB_out : RegData2_EXMEM_out) : RegData2_EXMEM_out;
	
endmodule
`default_nettype wire
