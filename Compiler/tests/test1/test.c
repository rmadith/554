#include "test.h"

unsigned int *x;	// Debug
unsigned int *y;	// Joystick
unsigned int *z;	// VGA
int main(){
  y = (unsigned int *) 0xFFFFC002;
  z = (unsigned int *) 0xFFFFC003;
  *y = 0x0000003F;                  // Clearing all Joystick data (Soft Reset)
  *z = 0x500F0005;

   //while(1){}
   return 0;
}
