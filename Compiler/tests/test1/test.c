#include "test.h"

unsigned int *debug = 0xFFFFC001;
unsigned int *joystick = 0xFFFFC002;
unsigned int *VGA = 0xFFFFC003;



#define numBlocks 13
#define TANK_WIDTH 64  
#define TANK_HEIGHT 128
#define BLOCK_WIDTH 63
#define BLOCK_HEIGHT 126



// Global Joystick values
int x1_val;
int y1_val;
int ps1_val;
int x2_val;
int y2_val;
int ps2_val;


// Blocks
struct block_t{
	int xloc;
	int yloc;
};

struct block_t blocks[numBlocks] = {{70, 836}, {70, 708}, {70, 580}, {5,5}, {75, 75}, {145, 145}, {300, 300}, {300, 428}, {364, 300}, {500, 836}, {500,708}, {436, 708}, {500 ,5}};


// Tank Struct
struct tank_t{
	int xloc;
	int yloc;
	int tank_index;
	int gun_index;
};

struct tank_t player = {5, 820, 31, 35};
struct tank_t enemy = {19, 38, 574, 5};


// Bullet struct
struct bullet_t{
	int bullet_move;
	int bullet_index;
	int bullet_x;
	int bullet_y;
};

struct bullet_t player_bullet = {1,2,1,1};
struct bullet_t enemy_bullet = {1,2,1,1};



///////////////////////
// Interface Functions
///////////////////////
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


///////////////////////
// Init Functions
///////////////////////
void init(){
	// Reset xloc and yloc
	player.xloc = 5;
	player.yloc = 820;

	// Reset tank index and gun index
	player.tank_index = 31;
	player.gun_index = 35;

	player_bullet.bullet_move = 1;
	player_bullet.bullet_index = 2;
	player_bullet.bullet_x = 1;
	player_bullet.bullet_y = 1;

	// Write tank
	wait_for_vga();
	*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x1);
	wait_for_vga();
	*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x1);


	// Write sample block
	for(int i = 0; i < numBlocks; i++){
		wait_for_vga();
		*VGA = (blocks[i].xloc << 22) | (blocks[i].yloc << 12) | (0 << 2) | (0x1);
	}

	// Initialise enemy 1
	enemy.tank_index = 19;
	enemy.gun_index = 38;
	enemy.xloc = 575;
	enemy.yloc = 2;

	enemy_bullet.bullet_move = 1;
	enemy_bullet.bullet_index = 2;
	enemy_bullet.bullet_x = 1;
	enemy_bullet.bullet_y = 1;

	wait_for_vga();
	*VGA = (enemy.xloc << 22) | (enemy.yloc << 12) | (enemy.tank_index << 2) | (0x1);
	wait_for_vga();
	*VGA = (enemy.xloc << 22) | (enemy.yloc << 12) | (enemy.gun_index << 2) | (0x1);

	return;
}


// Takes in two parameters with the xloc and yloc of the tank's upper left corner
int wall_collision(int xloc, int yloc){
	for(int i = 0; i < numBlocks; i++){
		if ((xloc < blocks[i].xloc + BLOCK_WIDTH) && (xloc + TANK_WIDTH > blocks[i].xloc) &&
            (yloc < blocks[i].yloc + BLOCK_HEIGHT) && (yloc + TANK_HEIGHT > blocks[i].yloc)) {
            return -1;  // Collision detected
        }
	}
	return 0;
}

int bullet_collision(int xloc, int yloc){
	for(int i = 0; i < numBlocks; i++){
		if ((xloc < blocks[i].xloc + BLOCK_WIDTH) && (xloc + 32 > blocks[i].xloc) &&
            (yloc < blocks[i].yloc + BLOCK_HEIGHT) && (yloc + 64 > blocks[i].yloc)) {
            return -1;  // Collision detected
        }
	}
	return 0;
}



void update_player_tank(struct tank_t *tank){
	
	int tank_move = 0;
	// Optimism >>>>
	int gun_move = 1;

	// Check if VGA is busy
	wait_for_vga();

	if((x2_val == 2) && (y2_val == 0) && player.gun_index != 41){ // (W)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 41;
	}	
	else if((x2_val == 1) && (y2_val == 0)&& player.gun_index != 34){ // (E)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 34;
	}	
	else if((y2_val == 2) && (x2_val == 0)&& player.gun_index != 35){ // (N)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 35;
	}	
	else if((y2_val == 1) && (x2_val == 0)&& player.gun_index != 38){ // (S)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 38;
	}	
	else if((x2_val == 1) && (y2_val == 2)&& player.gun_index != 36){ // (NE)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 36;
	}	
	else if((x2_val == 2) && (y2_val == 2)&& player.gun_index != 37){ // (NW)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 37;
	}	
	else if((x2_val == 1) && (y2_val == 1)&& player.gun_index != 39){ // (SE)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 39;
	}	
	else if((x2_val == 2) && (y2_val == 1)&& player.gun_index != 40){ // (SW)
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x2);
		player.gun_index = 40;
	}
	else{
		gun_move = 0;
	}


	if(gun_move == 0){
		if(x1_val == 2){ // LEFT
			if(player.xloc > 1 && wall_collision(player.xloc - 1, player.yloc) == 0) {
				wait_for_vga();
				*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x2);
				player.xloc = player.xloc - 1;
				player.tank_index = 33;
				tank_move = 1;
			}
		}
		else if(x1_val == 1){ //RIGHT
			if(player.xloc < 576 && wall_collision(player.xloc + 1, player.yloc) == 0){
				wait_for_vga();
				*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x2);
				player.xloc = player.xloc + 1;
				player.tank_index = 30;
				tank_move = 1;
			}
		}
		else if(y1_val == 2){ //UP
			if(player.yloc > 1 && wall_collision(player.xloc, player.yloc - 2) == 0){
				wait_for_vga();
				*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x2);
				player.yloc = player.yloc - 2;
				player.tank_index = 31;
				tank_move = 1;
			}
		}
		else if(y1_val == 1){//DOWN
			if(player.yloc < 836 && wall_collision(player.xloc, player.yloc + 2) == 0){
				wait_for_vga();
				*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x2);
				player.yloc = player.yloc + 2;
				player.tank_index = 32;
				tank_move = 1;
			}
		}
	}

	if(tank_move | gun_move){
		wait_for_vga();
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x1);
		wait_for_vga();
		*VGA  = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x1);
	}

}


void update_bullet(struct tank_t *tank, struct bullet_t *bullet){

	if((bullet->bullet_move == 1)){
		if(ps2_val == 2){
			if(tank->gun_index == 34){ //E 
				//bullet_move = 2;
				bullet->bullet_index = 1;
				bullet->bullet_x = tank->xloc + 64;
				bullet->bullet_y = tank->yloc + 32;
			}
			else if(tank->gun_index == 35){ // N
				//bullet_move = 2;
				bullet->bullet_index = 2;
				bullet->bullet_x = tank->xloc + 16;
				bullet->bullet_y = tank->yloc - 40;
			}
			else if(tank->gun_index == 36){ // NE
				//bullet_move = 2;
				bullet->bullet_index = 3; //NE
				bullet->bullet_x = tank->xloc + 64;
				bullet->bullet_y = tank->yloc - 36;
			}
			else if(tank->gun_index == 37){ // NW
				//bullet_move = 2;
				bullet->bullet_index = 4; //NW
				bullet->bullet_x = tank->xloc - 32;
				bullet->bullet_y = tank->yloc - 34;
			}
			else if(tank->gun_index == 38){ // S
				//bullet_move = 2;
				bullet->bullet_index = 5; //S
				bullet->bullet_x = tank->xloc + 16;
				bullet->bullet_y = tank->yloc + 106;
			}
			else if(tank->gun_index == 39){ // SE
				//bullet_move = 2;
				bullet->bullet_index = 6; //SE
				bullet->bullet_x = tank->xloc + 64;
				bullet->bullet_y = tank->yloc + 106;
			}
			else if(tank->gun_index == 40){ // SW
				//bullet_move = 2;
				bullet->bullet_index = 7; //SW
				bullet->bullet_x = tank->xloc - 32;
				bullet->bullet_y = tank->yloc + 106;
			}
			else if(tank->gun_index == 41){ // W
				//bullet_move = 2;
				bullet->bullet_index = 8; //W
				bullet->bullet_x = tank->xloc - 32;
				bullet->bullet_y = tank->yloc + 32;
			}
			if(bullet_collision(bullet->bullet_x, bullet->bullet_y)){
				return;
			}
			if(bullet->bullet_x >= 616 || bullet->bullet_x <= 1 || bullet->bullet_y >= 884 || bullet->bullet_y <= 1){
				return;
			}
			bullet->bullet_move = 2;
			wait_for_vga();
			*VGA  = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index << 2) | (0x1);			

		}
	}



	else if(bullet->bullet_move == 2){
		if(bullet->bullet_x >= 616 || bullet->bullet_x <= 1 || bullet->bullet_y >= 884 || bullet->bullet_y <= 1){
			bullet->bullet_move = 1; // Not moving anymore
			wait_for_vga();
			*VGA  = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index<< 2) | (0x2);
		}
		else if(bullet_collision(bullet->bullet_x, bullet->bullet_y)){
			bullet->bullet_move = 1; // Not moving anymore
			wait_for_vga();
			*VGA  = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index<< 2) | (0x2);
		}
		else{
			if(bullet->bullet_index == 1){
				bullet->bullet_x = bullet->bullet_x + 1; // update x postion only	
			}
			else if (bullet->bullet_index == 2){ //(N)
				bullet->bullet_y = bullet->bullet_y - 2; // update y position only
			}
			else if (bullet->bullet_index == 3){ //(NE)
				bullet->bullet_y = bullet->bullet_y - 2; 
				bullet->bullet_x = bullet->bullet_x + 1;
			}
			else if (bullet->bullet_index == 4){ //(NW)
				bullet->bullet_x = bullet->bullet_x - 1;
				bullet->bullet_y = bullet->bullet_y - 2; 
			}
			else if (bullet->bullet_index == 5){ //(S)
				bullet->bullet_y = bullet->bullet_y + 2; 
			}
			else if (bullet->bullet_index == 6){ //(SE)
				bullet->bullet_x = bullet->bullet_x + 1;
				bullet->bullet_y = bullet->bullet_y + 2; 
			}
			else if (bullet->bullet_index == 7){ //(SW)
				bullet->bullet_x = bullet->bullet_x - 1;
				bullet->bullet_y = bullet->bullet_y + 2; 
			}
			else if (bullet->bullet_index == 8){ //(W)
				bullet->bullet_x = bullet->bullet_x - 1;
			}
			wait_for_vga();
			*VGA  = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index << 2) | (0x1);
		}	
	}	
}	


void update_enemy(struct tank_t *enemy, int player_x, int player_y, struct bullet_t *bullet){
    int dx = player_x - enemy->xloc;
    int dy = player_y - enemy->yloc;

    int step_x = (dx > 0) ? 1 : -1;
    int step_y = (dy > 0) ? 1 : -1;

	int mag_dx = dx > 0 ? dx : -dx;
    int mag_dy = dy > 0 ? dy : -dy;

	int tank_move = 1;
	int gun_move = 1;

	if(dy == 0 && dx < 0){  // West
		enemy->gun_index = 41;
	}
	else if(dx == 0 && dy > 0){ // South
		enemy->gun_index = 38;
	}
	else if(dy == 0 && dx > 0){ // East
		enemy->gun_index = 34;
	}
	else if(dx == 0 && dy < 0){ //North
		enemy->gun_index = 35;
	}
	else if(dy > 0 && dx < 0){ // SouthWest
		 enemy->gun_index = 40;
	}
	else if(dx > 0 && dy > 0){ // SouthEast
		enemy->gun_index = 39;
	}
	else if(dx < 0 && dy < 0){ // NorthWest
		enemy->gun_index = 37;
	}
	else if(dx > 0 && dy < 0){ // NorthEast
		enemy->gun_index = 36;
	}
	else{
		gun_move = 0;
	}

    // Attempt to move horizontally or vertically based on the direction of the player
    if (mag_dx >= mag_dy) {
        // Horizontal movement
        if (wall_collision(enemy->xloc + step_x, enemy->yloc) == 0) {
            enemy->xloc += step_x;
        } 
		else if (wall_collision(enemy->xloc, enemy->yloc + step_y) == 0) {
            enemy->yloc += step_y;
        }
    }
	else{
        // Vertical movement
        if (wall_collision(enemy->xloc, enemy->yloc + step_y) == 0) {
            enemy->yloc += step_y;
        } 
		else if (wall_collision(enemy->xloc + step_x, enemy->yloc) == 0) {
            enemy->xloc += step_x;
        }
    }

    // Update the enemy's position and gun orientation in VGA memory
	if(tank_move | gun_move){
		wait_for_vga();
		*VGA = (enemy->xloc << 22) | (enemy->yloc << 12) | (enemy->tank_index << 2) | (0x1);
		wait_for_vga();
		*VGA = (enemy->xloc << 22) | (enemy->yloc << 12) | (enemy->gun_index << 2) | (0x1);
	}
}



int main(){
	init();
	while(1){
	    read_joystick();
		update_player_tank(&player);
		update_bullet(&player, &player_bullet);
		update_enemy(&enemy, player.xloc, player.yloc, &enemy_bullet);
		for(int i = 0; i < 10000; i++){
			2 + 2;
		};
   	}
    return 0;

}
