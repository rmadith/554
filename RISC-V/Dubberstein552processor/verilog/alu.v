// Joash Shankar
/*
    CS/ECE 552 Spring '23
    Homework #2, Problem 2

    A multi-bit ALU module (defaults to 16-bit). It is designed to choose
    the correct operation to perform on 2 multi-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the multi-bit result
    of the operation, as well as drive the output signals Zero and Overflow
    (OFL).
*/
`default_nettype none
module alu (InA, InB, Cin, Oper, invA, invB, sign, Out, Zero, Ofl);

    parameter OPERAND_WIDTH = 16;    
    parameter NUM_OPERATIONS = 3;
       
    input wire  [OPERAND_WIDTH -1:0] InA ; // Input wire operand A
    input wire  [OPERAND_WIDTH -1:0] InB ; // Input wire operand B
    input wire                       Cin ; // Carry in
    input wire  [NUM_OPERATIONS-1:0] Oper; // Operation type
    input wire                       invA; // Signal to invert A
    input wire                       invB; // Signal to invert B
    input wire                       sign; // Signal for signed operation
    output wire [OPERAND_WIDTH -1:0] Out ; // Result of comput wireation
    output wire                      Ofl ; // Signal if overflow occured
    output wire                      Zero; // Signal if Out is 0

    /* YOUR CODE HERE */
	
	// Declare internal nets
	wire [OPERAND_WIDTH -1:0] A, B; // Input signals after (potential) inversion.
	
	// the outputs from the different sub-units that will be selected between via the Oper input
	wire [OPERAND_WIDTH -1:0] OutAND, OutXOR, OutOR, OutADD, OutBARREL; 
	
	// carry out from CLA
	wire Cout;
	
	// Nets used for overflow logic
	wire isAddOp; // will be logic one when opcode is an add op.
	wire underflow_s; // underflow for signed twos complement addition
	wire overflow_s; // overflow for signed twos complement addition.
	wire signed_overflow;
	wire overflow; // only will be passed to Ofl output if isAddOp is true.
	
	////////////////////
	
	assign A = InA ^ {OPERAND_WIDTH{invA}}; // logic to invert A input
	assign B = InB ^ {OPERAND_WIDTH{invB}}; // logic to invert B input
	
	// Create n-bit arrays of gates for AND, XOR, and OR operations.
	assign OutAND = A & B; 
	assign OutXOR = A ^ B; 
	assign OutOR = A | B; 
	
	// Instantiate CLA
	cla16b cla(.sum(OutADD), .cOut(Cout), .inA(A), .inB(B), .cIn(Cin));
	
	// Instantiate barrel shifter
	shifter bShifter(.InBS(A), .ShAmt(B[3:0]), .ShiftOper(Oper[1:0]), .OutBS(OutBARREL));
	
	// Mux at exit 
	assign Out = 	(Oper == 3'b100) ? OutADD	:
					(Oper == 3'b101) ? OutAND	:
					(Oper == 3'b110) ? OutOR	:
					(Oper == 3'b111) ? OutXOR	: OutBARREL;
	
	
	// Zero output (NOR of all 16 output bits)
	assign Zero = ~| Out;
	
	// Logic for overflow output.
	assign isAddOp = (~Oper[0]) & (~Oper[1]) & Oper[2];
	assign underflow_s = Out[OPERAND_WIDTH -1] & (~A[OPERAND_WIDTH -1]) & (~B[OPERAND_WIDTH -1]);
	assign overflow_s = (~Out[OPERAND_WIDTH -1]) & A[OPERAND_WIDTH -1] & B[OPERAND_WIDTH -1];
	assign signed_overflow = underflow_s | overflow_s;
	assign overflow = sign ? signed_overflow : Cout;
	assign Ofl = isAddOp & overflow;
	
	
	
    
endmodule
`default_nettype wire
