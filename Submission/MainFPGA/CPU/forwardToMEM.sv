`default_nettype none

module forwardToMEM (
	// allows us to determine the registers we are reading in MEM stage.
	input wire [31:0] Instruction_EXMEM_MEMWB,
	input wire memWrite_EXMEM_out, // and if it's a store instruction.
	
	// allows us to determine write reg in WB stage and if it's a LOAD instruction.
	input wire RegWriteEnable_MEMWB_out,
	input wire [31:0] Instruction_MEMWB_out,
	input wire memRead_MEMWB_out,
	
	// the data that will get forwarded
	input wire [31:0] memReadRst_MEMWB_out,
	
	// the data we will use if we do not forward.
	input wire [31:0] RegData2_EXMEM_out,
	
	// forwarded outputs
	output wire [31:0] RegData2_after_forward_M 
);

	// The registers whose value we need to use in EX stage.
	wire [4:0] Reg_being_stored;
	assign Reg_being_stored = Instruction_EXMEM_MEMWB [24:20];

	// The register we are writing to in the instruction that is in the WB stage
	wire [4:0] WB_destination_reg;

	assign WB_destination_reg = Instruction_MEMWB_out[11:7];

	//////////////////////REG 2 Forwarding ////////////////////////
	// MEM -> MEM forwarding (from start of WB to start of MEM stage)
	assign RegData2_after_forward_M =  (~|Reg_being_stored) ? 32'b0 :
										RegWriteEnable_MEMWB_out ? 
										(((WB_destination_reg==Reg_being_stored) & memRead_MEMWB_out & memWrite_EXMEM_out) ? memReadRst_MEMWB_out : RegData2_EXMEM_out) : RegData2_EXMEM_out;
	
	
endmodule
`default_nettype wire
