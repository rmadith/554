/*
    CS/ECE 552 Spring '23
    Homework #2, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the 'Oper' value that is passed in.  It uses these
    shifts to shift the value any number of bits.
 */
`default_nettype none
module shifter (InBS, ShAmt, ShiftOper, OutBS);

    // declare constant for size of inputs, outputs, and # bits to shift
    parameter OPERAND_WIDTH = 16;
    parameter SHAMT_WIDTH   =  4;
    parameter NUM_OPERATIONS = 2;

    input wire [OPERAND_WIDTH -1:0] InBS;  // Input operand
    input wire [SHAMT_WIDTH   -1:0] ShAmt; // Amount to shift/rotate
    input wire [NUM_OPERATIONS-1:0] ShiftOper;  // Operation type
    output wire [OPERAND_WIDTH -1:0] OutBS;  // Result of shift/rotate

   /* YOUR CODE HERE */
   
   // declare internal nets ////////
   
   // shift result after 1st, 2nd, 3rd, and 4th shift
   wire [OPERAND_WIDTH - 1:0] shiftResult1, shiftResult2, shiftResult3, shiftResult4; 
   
   /////////////////////////////////
   
   // muxes for zero bit of shift amount 
   wire [15:0] left_shift_0, right_shift_0;
   assign left_shift_0 = {InBS[OPERAND_WIDTH - 2:0], InBS[OPERAND_WIDTH - 1] & ShiftOper[1]};
   assign right_shift_0 = {InBS[OPERAND_WIDTH - 1] & ShiftOper[1], InBS[OPERAND_WIDTH - 1:1]};
   mux4to1 muxes0 [OPERAND_WIDTH - 1:0] (.sel({ShAmt[0],ShiftOper[0]}), .in0(InBS), .in1(InBS), .in2(left_shift_0), .in3(right_shift_0), .out(shiftResult1));
   
   // muxes for first bit of shift amount 
   wire [15:0] left_shift_1, right_shift_1;
   assign left_shift_1 = {shiftResult1[OPERAND_WIDTH - 3:0], shiftResult1[OPERAND_WIDTH - 1: OPERAND_WIDTH - 2] & {2{ShiftOper[1]}}};
   assign right_shift_1 = {{2{InBS[OPERAND_WIDTH - 1] & ShiftOper[1]}}, shiftResult1[OPERAND_WIDTH - 1:2]};
   mux4to1 muxes1 [OPERAND_WIDTH - 1:0] (.sel({ShAmt[1],ShiftOper[0]}), .in0(shiftResult1), .in1(shiftResult1), .in2(left_shift_1), .in3(right_shift_1), .out(shiftResult2));
   
   
   // muxes for second bit of shift amount 
   wire [15:0] left_shift_2, right_shift_2;
   assign left_shift_2 = {shiftResult2[OPERAND_WIDTH - 5:0], shiftResult2[OPERAND_WIDTH - 1: OPERAND_WIDTH - 4] & {4{ShiftOper[1]}}};
   assign right_shift_2 = {{4{InBS[OPERAND_WIDTH - 1] & ShiftOper[1]}}, shiftResult2[OPERAND_WIDTH - 1:4]};
   mux4to1 muxes2 [OPERAND_WIDTH - 1:0] (.sel({ShAmt[2],ShiftOper[0]}), .in0(shiftResult2), .in1(shiftResult2), .in2(left_shift_2), .in3(right_shift_2), .out(shiftResult3));
   
   
   // muxes for third bit of shift amount 
   wire [15:0] left_shift_3, right_shift_3;
   assign left_shift_3 = {shiftResult3[OPERAND_WIDTH - 9:0], shiftResult3[OPERAND_WIDTH - 1: OPERAND_WIDTH - 8] & {8{ShiftOper[1]}}};
   assign right_shift_3 = {{8{InBS[OPERAND_WIDTH - 1] & ShiftOper[1]}}, shiftResult3[OPERAND_WIDTH - 1:8]};
   mux4to1 muxes3 [OPERAND_WIDTH - 1:0] (.sel({ShAmt[3],ShiftOper[0]}), .in0(shiftResult3), .in1(shiftResult3), .in2(left_shift_3), .in3(right_shift_3), .out(shiftResult4));
   
   assign OutBS = shiftResult4;
   
endmodule
`default_nettype wire
