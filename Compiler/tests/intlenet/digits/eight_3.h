int ref_digit =  8 ;
char *ref_file = "eight_3.png";
#define Y_DIM  32
int input[Y_DIM*Y_DIM] = {
0,0,0,0,0,0,1,1,0,3,5,1,0,1,0,0,0,0,0,1,0,2,5,2,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,3,1,0,2,26,54,73,84,87,80,70,51,22,1,0,1,3,0,1,0,0,0,0,0,0,0,0,0,1,0,1,3,0,35,138,210,247,255,255,255,255,255,255,255,244,204,126,23,0,2,0,1,0,0,0,0,0,0,0,0,1,1,3,0,111,249,255,255,254,252,254,254,255,254,252,251,255,254,255,233,55,0,3,0,0,0,0,0,0,0,0,0,1,3,0,106,255,253,250,253,255,255,253,248,246,250,255,255,255,251,250,255,223,18,0,2,1,0,0,0,0,0,0,0,2,0,23,234,255,252,255,235,133,67,39,29,26,32,54,96,197,255,254,250,255,114,0,4,1,0,0,0,0,0,0,0,4,0,102,255,250,255,235,41,0,2,1,0,0,0,1,0,0,183,255,250,255,183,0,3,1,0,0,0,0,0,0,1,4,0,157,255,248,255,128,0,8,4,2,2,2,2,3,7,0,68,255,252,255,216,4,0,1,0,0,0,0,0,0,1,3,0,183,255,250,255,68,0,3,1,1,0,0,0,1,2,0,28,244,255,255,230,12,0,1,0,0,0,0,0,0,1,2,0,190,255,252,255,49,0,3,0,0,0,0,0,0,2,0,20,237,255,255,226,10,0,1,0,0,0,0,0,0,1,3,0,178,255,251,255,56,0,3,1,0,0,0,0,1,2,0,32,247,255,255,209,0,1,1,0,0,0,0,0,0,1,4,0,141,255,248,255,91,0,8,4,4,4,4,4,4,8,0,81,255,250,255,166,0,4,1,0,0,0,0,0,0,1,4,0,73,255,251,255,188,0,1,1,0,0,0,0,1,0,0,193,255,250,255,88,0,4,1,0,0,0,0,0,0,0,1,0,5,212,255,252,255,178,92,78,76,76,76,76,78,97,188,255,252,255,224,13,0,1,1,0,0,0,0,0,0,0,1,3,0,76,255,254,254,255,255,255,255,255,255,255,255,255,255,254,252,255,129,0,5,0,1,0,0,0,0,0,0,1,0,4,0,96,255,254,253,250,253,255,255,255,255,255,255,253,251,252,253,255,188,3,1,1,1,0,0,0,0,0,0,1,2,0,41,241,255,253,255,255,254,248,247,247,247,247,248,251,255,255,254,252,255,137,0,3,1,0,0,0,0,0,0,1,2,0,181,255,251,255,205,73,40,31,28,28,28,28,29,36,52,152,255,254,255,248,41,0,3,0,0,0,0,0,0,3,0,56,255,253,255,229,25,0,2,0,0,0,0,0,0,1,2,0,169,255,248,255,131,0,4,1,0,0,0,0,0,5,0,123,255,248,255,133,0,8,3,2,2,2,2,2,2,2,6,0,69,255,251,255,190,0,2,1,0,0,0,0,0,4,0,161,255,249,255,82,0,4,1,0,0,0,0,0,0,1,2,0,35,251,255,255,216,2,0,1,0,0,0,0,0,4,0,178,255,250,255,70,0,3,1,0,0,0,0,0,0,0,2,0,34,251,255,255,220,5,0,1,0,0,0,0,0,4,0,176,255,249,255,90,0,4,0,1,0,0,0,0,1,1,3,0,57,255,252,255,211,0,0,1,0,0,0,0,0,4,0,152,255,248,255,151,0,7,5,3,2,2,2,2,3,4,8,0,117,255,249,255,181,0,3,1,0,0,0,0,0,5,0,106,255,251,255,248,66,0,2,1,0,0,0,0,1,2,0,39,230,255,250,255,123,0,4,1,0,0,0,0,0,3,0,37,247,255,254,255,249,170,96,56,35,28,27,35,53,85,153,240,255,254,255,246,38,0,2,1,0,0,0,0,0,1,3,0,150,255,250,252,254,255,255,255,252,245,245,252,255,255,255,254,251,250,255,135,0,3,1,0,0,0,0,0,0,1,1,0,9,182,255,254,255,250,248,250,253,254,254,253,251,248,250,255,254,255,160,1,1,1,1,0,0,0,0,0,0,1,0,1,1,5,98,199,247,255,255,255,255,255,255,255,255,255,255,244,190,81,0,2,1,0,1,0,0,0,0,0,0,0,1,0,2,3,0,1,29,69,102,127,141,146,146,139,124,100,66,25,0,0,3,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,4,2,0,1,0,0,0,0,0,0,0,0,1,0,2,4,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2,4,5,5,5,5,5,5,5,5,4,2,1,0,1,0,0,0,0,0,0,0,};
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000011111111000000000000
// 00000000011111111111111000000000
// 00000000111111111111111100000000
// 00000000111000000000011110000000
// 00000001110000000000001110000000
// 00000001110000000000001110000000
// 00000001110000000000000110000000
// 00000001110000000000000110000000
// 00000001110000000000001110000000
// 00000001110000000000001110000000
// 00000001110000000000001110000000
// 00000000111000000000011100000000
// 00000000111111111111111100000000
// 00000000111111111111111100000000
// 00000000111111111111111110000000
// 00000001110000000000001111000000
// 00000011100000000000000111000000
// 00000011100000000000000111000000
// 00000011100000000000000111000000
// 00000011100000000000000111000000
// 00000011100000000000000111000000
// 00000011100000000000000111000000
// 00000011110000000000000111000000
// 00000011111000000000001111000000
// 00000001111111100111111110000000
// 00000000111111111111111100000000
// 00000000001111111111100000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
