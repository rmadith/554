#include "test.h"

volatile unsigned int *x;

int main(){
   while(1){
      x = (volatile unsigned int *) 0xFFFC001;
      *x = 0x1234;
      break;
   }
   return 0;
}
