from PIL import Image
import sys
from numpy import asarray
import numpy

Y_DIM = int(sys.argv[1])
X_DIM = Y_DIM

image=Image.open(sys.argv[2])

digit_names = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
digit_value = 0
for i,a in enumerate(digit_names):
	if a in sys.argv[2]:
		digit_value = i
		break
data = asarray(image)
if data.shape[1] == Y_DIM:
    pass
else:
    padded = numpy.full((Y_DIM,Y_DIM), 255, dtype=int)
    y_offset = Y_DIM-data.shape[1]-1
    y_length = y_offset + data.shape[1]
    print(y_offset)
    padded[0:Y_DIM,y_offset:y_length] = data
    data = padded

print(data.shape)
f = open(sys.argv[3],"w")
print("int ref_digit = ", digit_value, ";", file = f)
print("char *ref_file = \"", sys.argv[2], "\";", sep='', file = f)
# print("int input[28*28] = {", file = f)
print("#define Y_DIM ", Y_DIM, file=f)
print("int input[Y_DIM*Y_DIM] = {", file = f)
data = data.astype(int)
for a in range(0,Y_DIM):
    k = data[a]
    l = 255 - k
    print(*l, sep=',', end=',', file=f)
print("};", file=f)

for a in range(0,Y_DIM):
    k = data[a]
    #l = 255 - k
    for j in range(0,Y_DIM):
        if (k[j] < 10):
            k[j] = 1
        else:
            k[j] = 0
    k = k.astype(int)
    print("//", end=' ', file=f)
    print(*k, sep='', end='\n', file=f)

