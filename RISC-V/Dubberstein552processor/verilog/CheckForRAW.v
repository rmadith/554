/*
    CS/ECE 552 Spring '23
    Eric Dubberstein
    Joash Shankar
*/
`default_nettype none
module CheckForRAW(
	// inputs
	InstructionInFetch, InstructionDownPipeline, WriteRegSel, RegWriteEnable, ReadReg1, ReadReg2,
	// outputs
	stall
);

	/// Inputs/ outputs ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	input wire [15:0] InstructionInFetch; // The instruction that is currently in the fetch stage.
	input wire [2:0] ReadReg1, ReadReg2; // The two registers that need to be read for the instruction that is in the fetch stage.
	
	input wire [15:0] InstructionDownPipeline; // The instruction in a later phase that we are checking for a RAW dependency against.
	input wire RegWriteEnable; // is the instruction in a later phase writing to a register?
	input wire [1:0] WriteRegSel; // The register that is being written to for the instruction in a later phase.
	
	output wire stall; // the result if we need to stall (i.e. is there a RAW?)
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	parameter return_addr_reg = 3'h7;

	// Declare internal nets///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	wire WRS_RR1, WRS_RR2;
	wire isRR1, isRR2;
	wire WRS_isRR1, WRS_isRR2;
	wire stall_intermediate;
	
	wire [2:0] w_reg_sel; // The register that the instruction farther down the pipeline will write to.
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // mux logic for determining write register for the instruction farther down the pipeline from the control signal.
	assign w_reg_sel = WriteRegSel==2'b00 ? InstructionDownPipeline[7:5] :
						WriteRegSel==2'b01 ? InstructionDownPipeline[4:2] :
						WriteRegSel==2'b10 ? InstructionDownPipeline[10:8] : return_addr_reg;

	// Check if the register that the instruction farther down the pipeline will write to the register that the instruction in fetch needs to read.
	assign WRS_RR1 = (ReadReg1 == w_reg_sel);
	assign WRS_RR2 = (ReadReg2 == w_reg_sel);
	
	// Check if the instruction in fetch is actually going to read R1 or R2 based on the opcode of the instruction. 
	assign isRR1 = ~((~(InstructionInFetch[15]) & ~(InstructionInFetch[14]) & InstructionInFetch[13] & ~(InstructionInFetch[11])) |
					(~(|InstructionInFetch[15:13])));
	assign isRR2 = ( InstructionInFetch[15] & InstructionInFetch[14] & (InstructionInFetch[13] | InstructionInFetch[12]) ) | //ALU op with Rs and Rd
						( InstructionInFetch[15] & (~(|InstructionInFetch[14:11]))) | // Store instruction that reads R2.
						( InstructionInFetch[15] & (~(|InstructionInFetch[14:13])) & (& InstructionInFetch[12:11])); // STU (also a store) instruction that reads R2.

	// There is only a RAW hazard if the register number matches between the instructions and the type of the instruction in fetch actually needs to read the value.
	assign WRS_isRR1 = WRS_RR1 & isRR1;
	assign WRS_isRR2 = WRS_RR2 & isRR2;
	
	// we will have to stall if there is a conflict for either register result 1 or 2.
	assign stall_intermediate = WRS_isRR1 | WRS_isRR2;
	
	// We only have to stall if the instruction farther down the pipeline is actually writing to the destination register.
	assign stall = stall_intermediate & RegWriteEnable;

endmodule
`default_nettype wire
