int ref_digit =  2 ;
char *ref_file = "two_2.png";
#define Y_DIM  32
int input[Y_DIM*Y_DIM] = {
0,0,0,0,0,0,0,0,0,0,1,1,1,2,4,4,4,3,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,4,1,0,0,0,0,0,0,4,2,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,1,0,0,32,67,78,67,41,5,0,0,3,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,0,0,95,204,255,255,255,255,251,218,140,30,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,0,16,178,255,248,119,60,70,177,255,255,255,237,87,0,3,0,1,0,0,0,0,0,0,0,0,0,0,0,1,2,3,9,195,255,242,50,0,0,0,0,188,253,248,255,255,84,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,140,255,253,146,0,8,3,7,1,62,255,254,252,255,238,24,1,2,1,0,0,0,0,0,0,0,0,0,0,2,0,33,248,254,255,55,2,3,1,1,1,9,228,255,254,251,255,122,0,5,0,0,0,0,0,0,0,0,0,0,0,5,0,118,255,255,227,9,1,1,1,1,2,0,192,255,253,252,255,193,0,2,1,0,0,0,0,0,0,0,0,0,1,3,1,176,255,255,188,0,2,1,0,1,4,1,172,255,252,254,255,220,5,0,1,0,0,0,0,0,0,0,0,0,1,2,1,195,252,254,159,1,4,1,0,1,4,1,165,255,252,254,255,221,6,1,1,0,0,0,0,0,0,0,0,0,1,4,0,140,255,255,151,1,5,0,0,1,4,0,167,255,252,253,255,212,1,0,1,0,0,0,0,0,0,0,0,0,0,2,2,15,165,223,107,0,4,0,0,1,3,1,176,255,252,252,255,188,0,3,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,7,0,0,0,0,0,1,3,1,190,255,252,251,255,146,1,5,1,0,0,0,0,0,0,0,0,0,0,1,0,1,3,0,1,0,1,0,0,1,1,1,207,255,253,253,255,87,1,4,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,0,1,0,0,1,0,12,231,255,253,255,246,27,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,36,251,255,251,255,182,0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,1,72,255,253,252,255,87,1,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,1,125,255,249,254,221,9,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,3,4,5,4,4,2,1,2,0,187,255,249,255,104,0,4,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,2,0,0,0,0,0,0,5,3,24,243,254,255,213,7,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,47,110,135,110,67,20,0,0,99,255,249,255,68,0,3,0,1,2,0,1,0,0,0,0,0,0,0,0,1,2,1,140,255,255,242,255,255,233,157,57,198,255,255,146,0,4,0,1,0,0,1,0,1,0,0,0,0,0,0,0,4,0,83,255,217,35,4,46,159,255,255,255,254,255,178,5,7,2,1,2,10,16,0,1,0,0,0,0,0,0,0,0,5,1,151,253,132,0,5,0,0,76,211,251,248,254,133,5,0,0,3,0,42,208,12,1,1,0,0,0,0,0,0,0,5,0,130,255,181,0,0,2,0,0,167,255,255,255,255,211,92,18,0,15,155,255,77,0,4,0,0,0,0,0,0,0,3,1,39,247,255,122,16,8,50,191,255,171,126,250,255,255,255,232,207,228,255,255,90,0,4,0,0,0,0,0,0,0,0,3,0,76,231,255,255,243,255,229,99,0,0,51,188,255,255,255,255,255,255,234,23,1,2,0,0,0,0,0,0,0,1,0,2,0,20,88,132,124,68,4,0,1,5,0,0,79,178,230,244,238,194,51,0,2,0,0,0,0,0,0,0,0,1,1,0,3,0,0,0,0,0,0,4,1,0,3,1,0,0,15,32,23,0,0,2,0,1,0,0,0,0,0,0,0,0,0,1,1,2,4,5,4,3,1,1,1,1,1,1,4,3,0,0,0,1,3,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,2,2,2,1,1,1,0,0,0,0,0,};
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000001111100000000000000
// 00000000000110000111000000000000
// 00000000001000000011110000000000
// 00000000011000000011110000000000
// 00000000111000000001111000000000
// 00000000110000000001111000000000
// 00000000110000000001111000000000
// 00000000110000000001111000000000
// 00000000110000000001111000000000
// 00000000000000000001111000000000
// 00000000000000000001111000000000
// 00000000000000000001111000000000
// 00000000000000000001111000000000
// 00000000000000000011110000000000
// 00000000000000000011110000000000
// 00000000000000000011100000000000
// 00000000000000000011100000000000
// 00000000000000000011000000000000
// 00000000000000000111000000000000
// 00000000110110000110000000000000
// 00000001000001111100000000000000
// 00000001000000011100000000000000
// 00000001000000011110000001000000
// 00000001100000100111100011000000
// 00000000011010000001111110000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
