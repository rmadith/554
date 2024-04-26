#include "test.h"

unsigned int *debug = 0xFFFFC001;
unsigned int *joystick = 0xFFFFC002;
unsigned int *VGA = 0xFFFFC003;

int x1_val;
int y1_val;
int ps1_val;
int x2_val;
int y2_val;
int ps2_val;

int main(){
    while(1){
        x1_val = (*joystick & 0x00000C00) >> 10;
        y1_val = (*joystick & 0x00000300) >> 8;
        ps1_val =(*joystick &0x000000C0) >> 6;
        x2_val = (*joystick & 0x00000030) >> 4;
        y2_val = (*joystick & 0x0000000C) >> 2;
        ps2_val = (*joystick &0x00000003);
        //*debug = *joystick;
		    *joystick = 0x0000003F; // 0x3F - to clear the joystick value
        int temp = (x1_val > 0);
        int temp2 = (y1_val > 0); 
        if(temp & temp2){
			      y1_val = 0x36;
            break;
		    }   
    }
    *debug = y1_val;  
  return 0;
}
