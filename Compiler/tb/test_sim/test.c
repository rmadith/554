#include "test.h"

volatile unsigned int *x;

int main(){
   x = (volatile unsigned int *) 0xFFFC001;
   *x = 0x1234;
   while(1){}
   return 0;
}
