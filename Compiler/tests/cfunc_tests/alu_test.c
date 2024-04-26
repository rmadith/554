int main()
{
volatile int* p1 = 0x00000f00;
 volatile int* p2 = 0x00000f04;
 volatile int* p3 = 0x00000f08;
 volatile int* p4 = 0x00000f0c;
 volatile int* p5 = 0x00000f10;

 int a = 552, b= 752;

 *p1 = a | b;
// *p2 = a - b;
 *p3 = a + b;
 *p4 = a & b;
// *p5 = a * b;


return 0;
}
