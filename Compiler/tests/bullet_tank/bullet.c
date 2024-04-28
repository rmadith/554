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

struct Tank{
  int x;
  int y;
  int tank_index;
  int gun_index;
};




int tank_xloc = 300; // initial placement of tank (middle)
int tank_yloc = 300;
int tank_index = 31;
int gun_index = 34;
int bullet_move = 1;
int bullet_index = 2;
int bullet_x = 1;
int bullet_y = 1;

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
	
	// Optimism >>>>
	int tank_move = 1;
	int gun_move = 1;

	// Check if VGA is busy
	wait_for_vga();

	if((x2_val == 2) && (y2_val == 0) && gun_index != 41){ // (W)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 41;
	}	
	else if((x2_val == 1) && (y2_val == 0)&& gun_index != 34){ // (E)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 34;
	}	
	else if((y2_val == 2) && (x2_val == 0)&& gun_index != 35){ // (N)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 35;
	}	
	else if((y2_val == 1) && (x2_val == 0)&& gun_index != 38){ // (S)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 38;
	}	
	else if((x2_val == 1) && (y2_val == 2)&& gun_index != 36){ // (NE)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 36;
	}	
	else if((x2_val == 2) && (y2_val == 2)&& gun_index != 37){ // (NW)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 37;
	}	
	else if((x2_val == 1) && (y2_val == 1)&& gun_index != 39){ // (SE)
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x2);
		gun_index = 39;
	}	
	else if((x2_val == 2) && (y2_val == 1)&& gun_index != 40){ // (SW)
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
				tank_yloc = tank_yloc - 2;
				tank_index = 31;
			}
		}
		else if(y1_val == 1){//DOWN
			if(tank_yloc < 836){
				wait_for_vga();
				*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x2);
				tank_yloc = tank_yloc + 2;
				tank_index = 32;
			}
		}
		else {
			tank_move = 0;
		}
	}
	else{
		tank_move = 0;
	}

	if(tank_move | gun_move){
		wait_for_vga();
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
		wait_for_vga();
		*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	}


}

void update_bullet(){

	if((bullet_move == 1)){
		if(ps2_val == 2){
			if(gun_index == 34){ //E 
				bullet_move = 2;
				bullet_index = 1;
				bullet_x = tank_xloc + 64;
				bullet_y = tank_yloc + 32;
			}
			else if(gun_index == 35){ // N
				bullet_move = 2;
				bullet_index = 2;
				bullet_x = tank_xloc + 16;
				bullet_y = tank_yloc - 40;
			}
			else if(gun_index == 36){ // NE
				bullet_move = 2;
				bullet_index = 3; //NE
				bullet_x = tank_xloc + 64;
				bullet_y = tank_yloc - 32;
			}
			else if(gun_index == 37){ // NW
				bullet_move = 2;
				bullet_index = 4; //NW
				bullet_x = tank_xloc - 32;
				bullet_y = tank_yloc - 32;
			}
			else if(gun_index == 38){ // S
				bullet_move = 2;
				bullet_index = 5; //S
				bullet_x = tank_xloc + 16;
				bullet_y = tank_yloc + 106;
			}
			else if(gun_index == 39){ // SE
				bullet_move = 2;
				bullet_index = 6; //SE
				bullet_x = tank_xloc + 64;
				bullet_y = tank_yloc + 64;
			}
			else if(gun_index == 40){ // SW
				bullet_move = 2;
				bullet_index = 7; //SW
				bullet_x = tank_xloc - 32;
				bullet_y = tank_yloc + 64;
			}
			else if(gun_index == 41){ // W
				bullet_move = 2;
				bullet_index = 8; //W
				bullet_x = tank_xloc - 32;
				bullet_y = tank_yloc + 32;
			}
			wait_for_vga();
			*VGA  = (bullet_x << 22) | (bullet_y << 12) | (bullet_index << 2) | (0x1);			

		}
	}



	else if(bullet_move == 2){
		if(bullet_x >= 576 || bullet_x <= 1 || bullet_y >= 836 || bullet_y <= 1){
			bullet_move = 1; // Not moving anymore
			wait_for_vga();
			*VGA  = (bullet_x << 22) | (bullet_y << 12) | (bullet_index<< 2) | (0x2);
		}
		else{
			if(bullet_index == 1){
				bullet_x = bullet_x + 1; // update x postion only	
			}
			else if (bullet_index == 2){ //(N)
				bullet_y = bullet_y - 2; // update y position only
			}
			else if (bullet_index == 3){ //(NE)
				bullet_y = bullet_y - 1; 
				bullet_x = bullet_x + 1;
			}
			else if (bullet_index == 4){ //(NW)
				bullet_x = bullet_x - 1;
				bullet_y = bullet_y - 1; 
			}
			else if (bullet_index == 5){ //(S)
				bullet_y = bullet_y + 2; 
			}
			else if (bullet_index == 6){ //(SE)
				bullet_x = bullet_x + 1;
				bullet_y = bullet_y + 1; 
			}
			else if (bullet_index == 7){ //(SW)
				bullet_x = bullet_x - 1;
				bullet_y = bullet_y + 1; 
			}
			else if (bullet_index == 8){ //(W)
				bullet_x = bullet_x - 1;
			}
			wait_for_vga();
			*VGA  = (bullet_x << 22) | (bullet_y << 12) | (bullet_index << 2) | (0x1);
		}	
	}	
}	

int main(){
	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (tank_index << 2) | (0x1);
	wait_for_vga();
	*VGA  = (tank_xloc << 22) | (tank_yloc << 12) | (gun_index << 2) | (0x1);
	while(1){
	    read_joystick();
		update_tank();
		update_bullet();
		for(int i = 0; i < 10000; i++){
			2 + 2;
		};
   	}
    return 0;

}
