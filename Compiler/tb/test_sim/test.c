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

int tank_xloc = 300; // initial placement of tank (middle)
int tank_yloc = 300;
int tank_index = 31;
int gun_index = 34;

// image index = 1
void read_joystick(){
        //*joystick = 0x0000003F; // to reset the joystick
        x1_val = (*joystick & 0x00000C00) >> 10;
        y1_val = (*joystick & 0x00000300) >> 8;
        ps1_val =(*joystick &0x000000C0) >> 6;
        x2_val = (*joystick & 0x00000030) >> 4;
        y2_val = (*joystick & 0x0000000C) >> 2;
        ps2_val = (*joystick &0x00000003);
		*joystick = 0x0000003F; // 0x3F - to clear the joystick value
		return;
}

void wait_for_vga(){
	while(*VGA & 0x80000000);
}

void update_tank(){
	
	// while(*VGA & 0x80000000);
	int tank_move = 1;
	int gun_move = 1;
	// int write = 0;

	
	// if((x2_val == 2) && (y2_val == 0)){ // (W)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 41;
	// }	
	// else if((x2_val == 1) && (y2_val == 0)){ // (E)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 34;
	// }	
	// else if((y2_val == 2) && (x2_val == 0)){ // (N)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 35;
	// }	
	// else if((y2_val == 1) && (x2_val == 0)){ // (S)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 38;
	// }	
	// else if((x2_val == 1) && (y2_val == 2)){ // (NE)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 36;
	// }	
	// else if((x2_val == 2) && (y2_val == 2)){ // (NW)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 37;
	// }	
	// else if((x2_val == 1) && (y2_val == 1)){ // (SE)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 39;
	// }	
	// else if((x2_val == 2) && (y2_val == 1)){ // (SW)
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 	gun_index = 40;
	// }
	// else{
	// 	gun_move = 0;
	// }

	// if(gun_move){
	// 	while(*VGA & 0x80000000);
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	// 	while(*VGA & 0x80000000);
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	// 	// while(*VGA & 0x80000000);
	// 	// *VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	// 	write = 1;
	// }
	// else if(write == 1){
	// 	while(*VGA & 0x80000000);
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	// 	write = 0;
	// }


	// if(x1_val == 2){ // LEFT
    // if(tank_xloc > 1) {
    //   		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		while(*VGA & 0x80000000);
	// 		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);// remove
	// 		//while(*VGA & 0x80000000);
    //   		//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		tank_xloc = tank_xloc - 1;
	// 		tank_index = 33;
	// 	}
	// }
	// else if(x1_val == 1){ //RIGHT
	// 	if(tank_xloc < 576){
    //  		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		while(*VGA & 0x80000000);
	// 		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
	// 		//while(*VGA & 0x80000000);
	// 		//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		tank_xloc = tank_xloc + 1;
	// 		tank_index = 30;
	// 	}
	// }
	// else if(y1_val == 2){ //UP
	// 	if(tank_yloc > 1){
    //   		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		while(*VGA & 0x80000000);
	// 		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
	// 		//while(*VGA & 0x80000000);
	// 		//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		tank_yloc = tank_yloc - 1;
	// 		tank_index = 31;
	// 	}
	// }
	// else if(y1_val == 1){//DOWN
	// 	if(tank_yloc < 836){
    //   		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		while(*VGA & 0x80000000);
    //   		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
	// 		//while(*VGA & 0x80000000);
	// 		//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
	// 		tank_yloc = tank_yloc + 1;
	// 		tank_index = 32;
	// 	}
	// }
	// else{
	// 	tank_move = 0;
	// }

	// if(tank_move){
	// 	// while(*VGA & 0x80000000);
	// 	//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	// 	while(*VGA & 0x80000000);
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	// 	while(*VGA & 0x80000000);
	// 	//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	// 	write = 1;
	// }
	// else if(write == 1){
	// 	while(*VGA & 0x80000000);
	// 	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	// 	while(*VGA & 0x80000000);
	// 	//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	// 	// for(int i = 0; i < 100000; i++){
	// 	// 	1+1;
	// 	// }
	// 	write = 0;
	//}

	// Check if VGA is busy
	wait_for_vga();

	if((x2_val == 2) && (y2_val == 0)){ // (W)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 41;
	}	
	else if((x2_val == 1) && (y2_val == 0)){ // (E)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 34;
	}	
	else if((y2_val == 2) && (x2_val == 0)){ // (N)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 35;
	}	
	else if((y2_val == 1) && (x2_val == 0)){ // (S)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 38;
	}	
	else if((x2_val == 1) && (y2_val == 2)){ // (NE)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 36;
	}	
	else if((x2_val == 2) && (y2_val == 2)){ // (NW)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 37;
	}	
	else if((x2_val == 1) && (y2_val == 1)){ // (SE)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 39;
	}	
	else if((x2_val == 2) && (y2_val == 1)){ // (SW)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 40;
	}
	else{
		gun_move = 0;
	}


	if(gun_move == 0){
		if(x1_val == 2){ // LEFT
			if(tank_xloc > 1) {
				wait_for_vga();
				*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
				tank_xloc = tank_xloc - 1;
				tank_index = 33;
			}
		}
		else if(x1_val == 1){ //RIGHT
			if(tank_xloc < 576){
				//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
				wait_for_vga();
				*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
				tank_xloc = tank_xloc + 1;
				tank_index = 30;
			}
		}
		else if(y1_val == 2){ //UP
			if(tank_yloc > 1){
				wait_for_vga();
				*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
				tank_yloc = tank_yloc - 1;
				tank_index = 31;
			}
		}
		else if(y1_val == 1){//DOWN
			if(tank_yloc < 836){
				wait_for_vga();
				*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
				tank_yloc = tank_yloc + 1;
				tank_index = 32;
			}
		}
		else {
			tank_move = 0;
		}
	}

	if(tank_move | gun_move){
		wait_for_vga();
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
		wait_for_vga();
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	}


}


int main(){
	//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	//*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	while(1){
	    read_joystick();
		update_tank();
		for(int i = 0; i < 10000; i++){
			2 + 2;
		};
   	}
    return 0;

}
