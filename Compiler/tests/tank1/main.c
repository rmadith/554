#include "main.h"

unsigned int *debug = 0xFFFFC001;
unsigned int *joystick = 0xFFFFC002;
unsigned int *VGA = 0xFFFFC003;

int x1_val;
int y1_val;
int ps1_val;
int x2_val;
int y2_val;
int ps2_val;

int tank_xloc = 340; // initial placement of tank (middle)
int tank_yloc = 340;

// image index = 1
int read_joystick(){
        *joystick = 0x0000003F; // to reset the joystick
        x1_val = (*joystick & 0x00000C00) >> 10;
        y1_val = (*joystick & 0x00000300) >> 8;
        ps1_val =(*joystick &0x000000C0) >> 6;
        x2_val = (*joystick & 0x00000030) >> 4;
        y2_val = (*joystick & 0x0000000C) >> 2;
        ps2_val = (*joystick &0x00000003);
        *debug = *joystick;
	*joystick = 0x0000003F;
        return 0;
}

int main(){
	read_joystick();
      while(1){
        //read_joystick();
        if(x1_val == 2){
	//if(tank_yloc < 600){
        	tank_yloc = tank_yloc + 1;
        }
        while(*VGA >> 32){}
	int tank_xloc_temp = tank_xloc << 22;
        int tank_yloc_temp = tank_yloc << 12;
        *VGA = tank_xloc_temp | tank_yloc_temp | (31 << 2) | 0x1;
        //*VGA = 0x500F005;
	//*debug = x1_val;
    }
    //*debug = 0x37;
    //*debug = tank_xloc;
    return 0;

}
