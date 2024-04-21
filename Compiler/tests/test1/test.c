#include "test.h"

volatile unsigned int *x;

int main(){
   x = (volatile unsigned int *) 0xFFFC001;
   char* array[2] = {'h', 'i'};
   for(int i = 0; i < 2; i++){
       *x = array[i];
   }
   while(1){}
   return 0;
}
