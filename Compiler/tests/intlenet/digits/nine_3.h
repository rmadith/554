int ref_digit =  9 ;
char *ref_file = "nine_3.png";
#define Y_DIM  32
int input[Y_DIM*Y_DIM] = {
0,0,0,0,0,0,0,0,1,0,2,5,3,0,0,1,0,0,0,1,0,1,5,3,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,3,1,0,0,5,23,37,47,50,46,36,18,1,0,0,3,1,0,1,0,0,0,0,0,0,0,0,0,0,1,0,3,0,14,99,178,220,243,254,255,255,255,253,238,208,150,56,0,3,1,0,1,0,0,0,0,0,0,0,0,1,0,3,0,75,228,255,254,255,255,253,253,253,252,253,255,255,255,255,158,8,0,1,1,0,0,0,0,0,0,0,0,1,3,0,82,255,255,250,252,255,255,255,255,255,255,255,255,253,249,252,255,174,0,1,1,1,0,0,0,0,0,0,1,2,0,23,232,255,251,255,245,174,115,84,71,69,80,108,164,241,255,254,250,255,101,0,4,1,0,0,0,0,0,0,1,4,0,118,255,250,255,229,44,0,2,1,0,0,1,2,0,29,204,255,251,255,209,2,0,1,0,0,0,0,0,0,1,2,0,190,255,250,255,96,0,7,5,4,4,4,4,5,6,0,50,253,255,254,255,50,0,3,0,0,0,0,0,0,1,0,10,226,255,255,243,27,0,2,1,1,0,0,1,1,1,3,0,198,255,249,255,99,0,4,0,0,0,0,0,0,2,0,25,245,255,255,221,6,0,1,0,0,0,0,0,0,1,4,0,149,255,248,255,136,0,4,1,0,0,0,0,0,2,0,32,249,255,255,216,1,0,1,0,0,0,0,0,0,1,5,0,114,255,248,255,165,0,4,1,0,0,0,0,0,2,0,31,249,255,255,228,13,0,1,1,1,0,0,0,1,1,4,0,96,255,249,255,181,0,3,1,0,0,0,0,0,2,0,17,234,255,254,255,53,0,6,5,5,5,5,5,5,4,8,0,86,255,249,255,191,0,2,1,0,0,0,0,0,1,1,0,202,255,251,255,183,11,0,1,0,0,0,0,0,1,4,0,103,255,249,255,192,0,2,1,0,0,0,0,0,1,4,0,134,255,250,255,255,232,173,141,125,117,115,118,124,138,162,196,241,255,252,255,189,0,2,1,0,0,0,0,0,1,2,0,33,238,255,252,249,254,255,255,255,255,255,255,255,255,255,255,255,255,252,255,183,0,3,1,0,0,0,0,0,0,1,3,0,70,232,255,254,255,255,255,255,255,255,255,255,255,255,255,255,255,252,255,171,0,4,1,0,0,0,0,0,0,1,0,2,0,15,86,147,186,209,223,227,227,225,217,205,191,176,143,200,255,250,255,151,0,4,1,0,0,0,0,0,0,1,1,0,3,1,0,1,1,0,5,9,10,7,2,0,1,5,0,131,255,247,255,123,0,5,1,0,0,0,0,0,0,0,0,1,0,1,4,4,3,1,0,1,0,1,0,1,2,7,0,174,255,249,255,84,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,14,228,255,255,251,40,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,6,0,86,255,251,255,208,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,4,5,0,21,217,255,250,255,131,0,4,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,2,3,4,5,3,1,2,0,38,206,255,252,255,242,34,0,2,1,0,0,0,0,0,0,0,0,1,0,2,5,3,1,0,1,0,1,0,9,61,155,245,255,252,250,255,116,0,4,1,0,0,0,0,0,0,0,0,1,0,1,1,0,0,2,19,47,82,125,176,227,255,255,253,249,253,255,146,0,2,1,1,0,0,0,0,0,0,0,0,1,1,0,18,126,189,214,238,255,255,255,255,255,250,248,254,255,247,112,0,3,1,0,1,0,0,0,0,0,0,0,0,1,2,0,183,255,253,255,255,252,248,249,253,255,255,255,241,152,35,0,4,1,0,1,0,0,0,0,0,0,0,0,0,2,0,28,246,255,255,255,255,255,255,255,251,217,164,94,21,0,1,3,1,0,1,0,0,0,0,0,0,0,0,0,0,2,0,31,241,249,237,222,197,162,122,79,36,4,0,1,0,4,3,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,0,2,27,29,19,5,0,1,0,1,0,1,4,4,2,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,2,4,5,4,3,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,};
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000011111000000000000
// 00000000000111111111111100000000
// 00000000011111111111111110000000
// 00000000011100000000001111000000
// 00000000111000000000000111000000
// 00000000111000000000000111100000
// 00000000110000000000000011100000
// 00000000110000000000000011100000
// 00000001110000000000000011100000
// 00000001110000000000000011100000
// 00000000111000000000000011100000
// 00000000111000000000000011100000
// 00000000111100000000000011100000
// 00000000011111111111111111100000
// 00000000001111111111111111100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000011100000
// 00000000000000000000000111000000
// 00000000000000000000000111000000
// 00000000000000000000001110000000
// 00000000000000000000011110000000
// 00000000000000000011111100000000
// 00000000000001111111111000000000
// 00000000011111111111000000000000
// 00000000111111111000000000000000
// 00000000010000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000000000000
