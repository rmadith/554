#include "test.h"

volatile unsigned int *x;

int main(){
   while(1){
      x = (volatile unsigned int *) 0xFFFC001;
      *x = 268419073;
   }
}
