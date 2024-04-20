#!/bin/bash
while read i; 
do
echo "${i:0:2}" >> wiscv_bank0.hex;
echo "${i:2:2}" >> wiscv_bank1.hex;
echo "${i:4:2}" >> wiscv_bank2.hex;
echo "${i:6:2}" >> wiscv_bank3.hex;
done < "wiscv.hex"
