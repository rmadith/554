/*
   CS/ECE 552 Spring '23
  
   Filename        : forward.v
   Description     : This is the overall module for the forwarding logic of the processor.
*/
`default_nettype none
module forwardToD (
	// allows us to determine the registers we are reading in EX stage.
	input wire [15:0] Instruction_IFID_IDEX,
	
	// allows us to determine write reg in MEM stage.
	input wire RegWriteEnable_EXMEM_MEMWB,
	input wire [1:0] WriteRegSel_EXMEM_MEMWB,
	input wire [15:0] Instruction_EXMEM_MEMWB,
	
	// allows us to determine write reg in WB stage.
	input wire RegWriteEnable_MEMWB_out,
	input wire [1:0] WriteRegSel_MEMWB_out,
	input wire [15:0] Instruction_MEMWB_out,
	
	// the data that will get forwarded
	input wire [15:0] execute_rst_EXMEM_MEMWB,
	input wire [15:0] writebackData,
	
	// the data we will use if we do not forward.
	input wire [15:0] RegData1_IDEX_in,
	
	// forwarded outputs
	output wire [15:0] RegData1_after_forward_D
);

	parameter return_addr_reg = 3'h7;

	// The registers whose value we need to use in EX stage.
	wire [2:0] D_read_register_1, D_read_register_2;
	assign D_read_register_1 = Instruction_IFID_IDEX [10:8];

	// The register we are writing to in the instruction that is in the MEM stage
	wire [2:0] MEM_destination_reg;

	// Use the same mux that we use in the WB stage in the decode module. 
	assign MEM_destination_reg = 	WriteRegSel_EXMEM_MEMWB==2'b00 ? Instruction_EXMEM_MEMWB[7:5] :
									WriteRegSel_EXMEM_MEMWB==2'b01 ? Instruction_EXMEM_MEMWB[4:2] :
									WriteRegSel_EXMEM_MEMWB==2'b10 ? Instruction_EXMEM_MEMWB[10:8] : return_addr_reg;
									
	// The register we are writing to in the instruction that is in the WB stage
	wire [2:0] WB_destination_reg;

	// Use the same mux that we use in the WB stage in the decode module. 
	assign WB_destination_reg = 	WriteRegSel_MEMWB_out==2'b00 ? Instruction_MEMWB_out[7:5] :
									WriteRegSel_MEMWB_out==2'b01 ? Instruction_MEMWB_out[4:2] :
									WriteRegSel_MEMWB_out==2'b10 ? Instruction_MEMWB_out[10:8] : return_addr_reg;

	 
	// NOTE: The second mux (EX->D) has priority over the first mux (MEM->D).

	
	//////////////////////REG 1 Forwarding ////////////////////////
	// MEM -> D forwarding (from start of WB to before branch decision in D stage)
	wire [15:0] RegData1_MEMtoD_forward;
	assign RegData1_MEMtoD_forward = RegWriteEnable_MEMWB_out ? 
										(((WB_destination_reg==D_read_register_1)) ? writebackData : RegData1_IDEX_in) : RegData1_IDEX_in;
	
	// EX -> D forwarding (from start of MEM to before branch decision in D stage)
	assign RegData1_after_forward_D = RegWriteEnable_EXMEM_MEMWB ? 
										(((MEM_destination_reg==D_read_register_1)) ? execute_rst_EXMEM_MEMWB : RegData1_MEMtoD_forward) : RegData1_MEMtoD_forward;
	
endmodule
`default_nettype wire
