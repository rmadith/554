int ref_digit =  5 ;
char *ref_file = "five_1.png";
#define Y_DIM  32
int input[Y_DIM*Y_DIM] = {
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,4,5,5,5,5,5,5,5,5,5,5,5,5,5,4,5,2,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,8,106,113,112,112,112,112,112,112,112,112,112,112,112,112,111,113,56,0,2,0,0,0,0,0,0,0,0,0,0,3,0,45,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,135,0,5,1,0,0,0,0,0,0,0,0,0,4,0,81,252,249,251,251,251,251,251,251,251,251,251,251,251,251,247,251,124,0,5,1,0,0,0,0,0,0,0,0,1,5,1,122,255,251,255,255,255,255,254,255,255,255,255,255,255,255,250,255,126,0,5,1,0,0,0,0,0,0,0,0,1,4,1,164,255,252,255,255,255,255,255,255,255,255,255,255,255,255,254,255,128,0,5,1,0,0,0,0,0,0,0,0,1,1,1,202,255,253,255,255,255,248,242,243,242,243,243,243,243,243,239,246,120,0,5,1,0,0,0,0,0,0,0,0,2,0,15,235,255,254,255,254,255,87,24,29,27,27,27,26,25,24,24,27,12,0,1,0,0,0,0,0,0,0,0,0,3,1,45,254,255,255,255,255,254,37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,82,255,253,255,254,255,226,0,12,54,84,88,71,39,2,0,2,3,1,1,1,0,0,0,0,0,0,0,0,1,5,1,123,255,251,255,254,255,223,150,226,255,255,255,255,250,206,103,2,0,2,0,1,0,0,0,0,0,0,0,0,1,4,1,166,255,252,255,255,255,255,255,255,253,252,252,253,255,255,255,191,25,0,2,0,1,0,0,0,0,0,0,0,1,1,0,202,255,253,255,255,255,253,250,255,255,255,253,255,255,253,251,255,210,18,2,2,0,0,0,0,0,0,0,0,2,0,17,243,255,253,252,252,251,255,255,230,218,250,255,254,255,255,255,250,255,157,0,3,1,0,0,0,0,0,0,0,2,1,36,223,244,255,255,255,255,213,75,15,7,39,176,255,254,255,255,255,253,251,37,0,2,0,0,0,0,0,0,0,1,1,1,7,28,55,88,121,143,19,0,0,0,0,3,209,255,253,255,255,252,255,112,1,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,1,1,7,0,119,255,251,255,255,252,255,155,1,4,1,0,0,0,0,0,1,1,1,4,5,6,7,7,5,2,2,1,1,1,4,1,85,255,252,255,255,252,255,171,0,4,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,7,1,1,0,1,4,1,81,255,252,255,255,252,255,162,0,4,1,0,0,0,0,0,1,1,9,74,104,130,153,183,203,215,21,3,2,0,5,2,107,255,252,255,255,251,255,120,1,5,1,0,0,0,0,0,1,1,8,226,255,255,255,255,255,255,100,0,6,5,3,0,187,255,252,255,255,254,255,50,0,3,0,0,0,0,0,0,0,4,0,108,255,247,252,252,252,253,235,58,0,0,0,112,255,254,255,255,252,255,196,1,2,1,0,0,0,0,0,0,1,1,2,10,218,255,251,255,255,255,255,252,178,154,197,255,255,255,255,254,251,255,61,0,3,0,0,0,0,0,0,0,0,0,3,0,51,244,255,251,254,255,254,255,255,255,255,254,255,255,252,253,255,126,0,3,0,1,0,0,0,0,0,0,0,1,0,3,0,54,216,255,255,254,252,251,248,248,249,251,253,255,255,254,127,0,4,1,1,0,0,0,0,0,0,0,0,0,1,0,3,0,13,125,216,255,255,255,255,255,255,255,255,244,173,57,0,3,1,0,1,0,0,0,0,0,0,0,0,0,1,1,0,3,0,0,7,59,104,133,150,153,142,119,83,30,0,0,3,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,4,0,0,0,0,0,0,0,0,0,0,3,3,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,3,4,4,4,4,4,4,4,2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,};
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000111111111111111100000000
// 00000000111111111111111100000000
// 00000000111111111111111100000000
// 00000000111111111111111100000000
// 00000000111111000000000100000000
// 00000000111110000000000000000000
// 00000001111110000000000000000000
// 00000001111100000000000000000000
// 00000001111100011111000000000000
// 00000001111111111111110000000000
// 00000001111111111111111000000000
// 00000001111111001111111100000000
// 00000000111100000011111110000000
// 00000000000000000001111110000000
// 00000000000000000001111110000000
// 00000000000000000001111110000000
// 00000000000000000001111110000000
// 00000000000000000001111110000000
// 00000011111100000001111110000000
// 00000011111100000011111100000000
// 00000001111111000111111100000000
// 00000000111111111111111000000000
// 00000000011111111111110000000000
// 00000000000111111110000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
