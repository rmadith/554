int ref_digit =  2 ;
char *ref_file = "two_3.png";
#define Y_DIM  32
int input[Y_DIM*Y_DIM] = {
0,0,0,0,0,0,0,1,1,0,2,4,5,5,4,3,2,2,2,3,4,5,5,2,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,3,1,0,1,0,0,0,0,0,0,0,0,0,1,0,3,2,0,1,0,0,0,0,0,0,0,0,0,0,1,0,2,0,13,68,117,151,173,185,192,195,193,184,166,137,94,33,0,2,2,0,1,0,0,0,0,0,0,0,0,1,1,3,0,99,234,255,255,255,255,255,255,255,255,255,255,255,255,250,173,31,0,2,0,1,0,0,0,0,0,0,0,0,3,0,68,255,255,249,249,251,254,255,255,255,255,254,249,247,252,254,255,220,22,0,2,1,0,0,0,0,0,0,0,1,0,2,206,255,253,255,255,255,249,238,233,234,240,251,255,255,254,255,249,255,146,0,4,1,0,0,0,0,0,0,0,2,0,20,194,175,133,100,71,46,32,21,14,15,22,36,68,146,248,255,254,255,229,13,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,4,0,108,255,252,255,255,54,0,3,0,0,0,0,0,0,0,1,0,1,2,3,5,4,4,3,2,2,2,2,2,2,5,0,21,239,255,251,255,83,0,4,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,2,211,255,250,255,96,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,209,255,250,255,90,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,11,227,255,252,255,70,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,4,0,50,255,255,255,249,36,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,4,4,0,161,255,250,255,204,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,4,0,9,159,255,254,250,255,111,0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,4,3,0,58,214,255,252,250,255,202,7,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,3,4,0,15,148,254,255,250,252,255,210,31,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,2,4,1,0,84,226,255,251,250,255,254,146,11,0,2,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,4,3,0,45,187,255,254,249,254,255,200,54,0,3,2,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,2,4,0,14,141,250,255,249,252,255,230,98,3,0,4,2,0,1,0,0,0,0,0,0,0,0,0,0,1,1,0,3,2,0,83,225,255,251,250,255,245,135,16,0,3,3,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,3,0,24,174,255,253,249,255,255,171,35,0,2,4,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,62,232,255,250,252,255,203,63,0,1,4,2,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,42,243,255,250,255,238,102,3,0,4,3,0,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,0,1,5,0,135,255,248,255,200,27,0,6,8,4,4,4,4,4,4,4,4,3,2,0,1,1,0,1,0,0,0,0,0,1,3,0,186,255,250,255,77,0,4,0,0,0,0,0,0,0,0,0,0,1,0,2,5,0,0,1,0,0,0,0,0,1,1,0,210,255,252,255,198,151,148,145,142,142,142,145,146,148,152,159,170,183,198,214,225,38,0,2,0,0,0,0,0,1,0,3,214,255,253,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,254,255,229,17,0,2,0,0,0,0,0,1,1,0,206,255,253,255,254,252,251,251,251,251,251,251,251,252,252,253,255,255,254,255,93,0,4,1,0,0,0,0,0,1,3,0,122,243,244,251,255,255,255,255,255,255,255,255,255,255,255,255,247,233,217,106,0,2,1,1,0,0,0,0,0,1,1,1,0,13,26,31,38,44,47,49,50,50,50,50,48,46,43,37,27,14,2,0,2,0,1,0,0,0,0,0,0,1,0,1,2,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,4,1,0,1,0,0,};
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000111111111111100000000
// 00000000011111111111111110000000
// 00000000011111100001111111000000
// 00000000000000000000001111000000
// 00000000000000000000000111100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000111100000
// 00000000000000000000000111000000
// 00000000000000000000001111000000
// 00000000000000000000011110000000
// 00000000000000000001111100000000
// 00000000000000000011111000000000
// 00000000000000001111100000000000
// 00000000000000111110000000000000
// 00000000000001111000000000000000
// 00000000000111110000000000000000
// 00000000001111000000000000000000
// 00000000011100000000000000000000
// 00000000111000000000000000000000
// 00000000111000000000000000000000
// 00000000111000000000000000000000
// 00000000111111111111111111100000
// 00000000111111111111111111100000
// 00000000001111111111111100000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
