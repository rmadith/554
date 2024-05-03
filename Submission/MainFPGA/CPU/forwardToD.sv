/*
   ECE 554 Spring '24
  
   Filename        : forward.v
   Description     : This is the overall module for the forwarding logic of the processor.
*/
`default_nettype none
module forwardToD (
	// allows us to determine the registers we are reading in D stage.
	input wire [31:0] Instruction_IFID_IDEX,
	
	// allows us to determine write reg in MEM stage.
	input wire RegWriteEnable_EXMEM_MEMWB,
	input wire [31:0] Instruction_EXMEM_MEMWB,
	
	// allows us to determine write reg in WB stage.
	input wire RegWriteEnable_MEMWB_out,
	input wire [31:0] Instruction_MEMWB_out,
	
	// the data that will get forwarded
	input wire [31:0] execute_result_EXMEM_MEMWB,
	input wire [31:0] writebackData,
	
	// the data we will use if we do not forward.
	input wire [31:0] RegData1_IDEX_out,
	input wire [31:0] RegData2_IDEX_out,
	
	// forwarded outputs
	output wire [31:0] RegData1_after_forward_EX,
	output wire [31:0] RegData2_after_forward_EX 
);

	// The registers whose value we need to use in D stage.
	wire [4:0] D_read_register_1, D_read_register_2;
	assign D_read_register_1 = Instruction_IFID_IDEX [19:15];
	assign D_read_register_2 = Instruction_IFID_IDEX [24:20];

	// The register we are writing to in the instruction that is in the MEM stage
	wire [4:0] MEM_destination_reg;

	assign MEM_destination_reg = Instruction_EXMEM_MEMWB[11:7];
									
	// The register we are writing to in the instruction that is in the WB stage
	wire [4:0] WB_destination_reg;

	assign WB_destination_reg =  Instruction_MEMWB_out[11:7];


	 
	// NOTE: For both registers, the second mux (EX->EX) has priority over the first mux (MEM->EX). 
	
	//////////////////////REG 1 Forwarding ////////////////////////
	// MEM -> D forwarding (from start of WB to start of D stage)
	wire [31:0] RegData1_MEMtoEX_forward;
	assign RegData1_MEMtoEX_forward = RegWriteEnable_MEMWB_out ? 
										(((WB_destination_reg==D_read_register_1)) ? writebackData : RegData1_IDEX_out) : RegData1_IDEX_out;
	
	// EX -> D forwarding (from start of MEM to start of D stage)
	assign RegData1_after_forward_EX =  (~|D_read_register_1) ? 32'b0 :
											RegWriteEnable_EXMEM_MEMWB ? 
										(((MEM_destination_reg==D_read_register_1)) ? execute_result_EXMEM_MEMWB : RegData1_MEMtoEX_forward) : RegData1_MEMtoEX_forward;


	//////////////////////REG 2 Forwarding ////////////////////////
	// MEM -> D forwarding (from start of WB to start of D stage)
	wire [31:0] RegData2_MEMtoEX_forward;
	assign RegData2_MEMtoEX_forward = RegWriteEnable_MEMWB_out ? 
										(((WB_destination_reg==D_read_register_2)) ? writebackData : RegData2_IDEX_out) : RegData2_IDEX_out;
	
	// EX -> D forwarding (from start of MEM to start of D stage)
	assign RegData2_after_forward_EX =   (~|D_read_register_2) ? 32'b0 : 
											RegWriteEnable_EXMEM_MEMWB ? 
										(((MEM_destination_reg==D_read_register_2)) ? execute_result_EXMEM_MEMWB : RegData2_MEMtoEX_forward) : RegData2_MEMtoEX_forward;

	
endmodule
`default_nettype wire
