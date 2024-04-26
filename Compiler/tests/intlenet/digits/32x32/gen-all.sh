#!/bin/bash
for a in *.png; do x=`basename $a .png`;  
    python3 ../../scripts/gen-images.py 32 $a ../$x".h"; 
done

