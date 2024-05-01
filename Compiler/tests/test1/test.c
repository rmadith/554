#include "test.h"

unsigned int *debug = 0xFFFFC001;
unsigned int *joystick = 0xFFFFC002;
unsigned int *VGA = 0xFFFFC003;
unsigned int *joystick2 = 0xFFFFC004;


#define numBlocks 13
#define TANK_WIDTH 64 
#define TANK_HEIGHT 128
#define BLOCK_WIDTH 63
#define BLOCK_HEIGHT 126



// Global Joystick values
struct joystick{
int x1_val;
int y1_val;
int ps1_val;
int x2_val;
int y2_val;
int ps2_val;
int* addr;
};

struct direction{
int North;
int West;
int East;
int South;
};

struct direction player_direct = {31, 33, 30, 32};
struct direction enemy_direct = {19, 21, 18, 20};

struct joystick joy1 = {0,0,0,0,0,0,0};
struct joystick joy2 = {0,0,0,0,0,0,0};


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
void read_joystick(struct joystick *j){
//*joystick = 0x0000003F; // to reset the joystick
    j->x1_val = (*joystick & 0x00000C00) >> 10;
    j->y1_val = (*joystick & 0x00000300) >> 8;
    j->ps1_val =(*joystick & 0x000000C0) >> 6;
    j->x2_val = (*joystick & 0x00000030) >> 4;
    j->y2_val = (*joystick & 0x0000000C) >> 2;
    j->ps2_val = (*joystick &0x00000003);
    *joystick = 0x0000003F; // 0x3F - to clear the joystick value
    return;
}

void read_joystick_2(struct joystick *j){
    if((*joystick & 0x00400000) >> 21){
        j->x1_val = (*joystick & 0x00300000) >> 20; //22 - prev
        j->y1_val = (*joystick & 0x000C0000) >> 18; // 20 - prev
        j->ps1_val = 0;
        j->x2_val = (*joystick & 0x00030000) >> 16;
        j->y2_val = (*joystick & 0x0000C000) >> 14;
        j->ps2_val = (*joystick & 0x00003000) >> 12;
        //*debug = *joystick2;
        *joystick2 = 1;
    }

    //*joystick2 = 1;
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

    joy1.ps1_val = 0;
    joy1.ps2_val = 0;
    joy1.x1_val = 0;
    joy1.x2_val = 0;
    joy1.y1_val = 0;
    joy1.y2_val = 0;
    joy1.addr = 0xFFFFC002;

    // Write tank
    wait_for_vga();
    *VGA = (player.xloc << 22) | (player.yloc << 12) | (player.tank_index << 2) | (0x1);
    wait_for_vga();
    *VGA = (player.xloc << 22) | (player.yloc << 12) | (player.gun_index << 2) | (0x1);


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

    joy2.ps1_val = 0;
    joy2.ps2_val = 0;
    joy2.x1_val = 0;
    joy2.x2_val = 0;
    joy2.y1_val = 0;
    joy2.y2_val = 0;
    joy2.addr = 0xFFFFC004;

    wait_for_vga();
    *VGA = (enemy.xloc << 22) | (enemy.yloc << 12) | (enemy.tank_index << 2) | (0x1);
    wait_for_vga();
    *VGA = (enemy.xloc << 22) | (enemy.yloc << 12) | (enemy.gun_index << 2) | (0x1);

    *joystick2 =1;
    return;
}


// Takes in two parameters with the xloc and yloc of the tank's upper left corner
int wall_collision(int xloc, int yloc){
    for(int i = 0; i < numBlocks; i++){
        if ((xloc < blocks[i].xloc + BLOCK_WIDTH) && (xloc + TANK_WIDTH > blocks[i].xloc) &&
        (yloc < blocks[i].yloc + BLOCK_HEIGHT) && (yloc + TANK_HEIGHT > blocks[i].yloc)) {
            return -1; // Collision detected
        }
    }
    return 0;
}

int bullet_collision(int xloc, int yloc){
    for(int i = 0; i < numBlocks; i++){
        if ((xloc < blocks[i].xloc + BLOCK_WIDTH) && (xloc + 32 > blocks[i].xloc) &&
        (yloc < blocks[i].yloc + BLOCK_HEIGHT) && (yloc + 64 > blocks[i].yloc)) {
            return -1; // Collision detected
        }
    }
    return 0;
}

int bullet_tank(struct bullet_t *bullet, struct tank_t *tank){
    if ((bullet->bullet_x < tank->xloc + BLOCK_WIDTH) && (bullet->bullet_x + 32 > tank->xloc) &&
        (bullet->bullet_y < tank->yloc + BLOCK_HEIGHT) && (bullet->bullet_y + 60 > tank->yloc)) {
        return 1; // Collision detected
    }
        return 0;
}

void flash_tank(struct tank_t *tank){
    wait_for_vga();
    *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x1);
    wait_for_vga();
    *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x1);
    for(int i = 0; i < 1000000; i++){
        2+2;
    }
    wait_for_vga();
    *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x2);
    for(int i = 0; i < 1000000; i++){
        2+2;
    }
    
}

void update_player_tank(struct tank_t *tank, struct joystick *j, struct direction *direct){
    int tank_move = 0;
    // Optimism >>>>
    int gun_move = 1;

    // Check if VGA is busy
    wait_for_vga();

    if((j->x2_val == 2) && (j->y2_val == 0) && player.gun_index != 41){ // (W)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 41;
    } 
    else if((j->x2_val == 1) && (j->y2_val == 0)&& tank->gun_index != 34){ // (E)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 34;
    } 
    else if((j->y2_val == 2) && (j->x2_val == 0)&& tank->gun_index != 35){ // (N)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 35;
    } 
    else if((j->y2_val == 1) && (j->x2_val == 0)&& tank->gun_index != 38){ // (S)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 38;
    } 
    else if((j->x2_val == 1) && (j->y2_val == 2)&& tank->gun_index != 36){ // (NE)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 36;
    } 
    else if((j->x2_val == 2) && (j->y2_val == 2)&& tank->gun_index != 37){ // (NW)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 37;
    } 
    else if((j->x2_val == 1) && (j->y2_val == 1)&& tank->gun_index != 39){ // (SE)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 39;
    } 
    else if((j->x2_val == 2) && (j->y2_val == 1)&& tank->gun_index != 40){ // (SW)
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x2);
        tank->gun_index = 40;
    }
    else{
        gun_move = 0;
    }


    if(gun_move == 0){
        if(j->x1_val == 2){ // LEFT
            if(tank->xloc > 1 && wall_collision(tank->xloc - 1, tank->yloc) == 0) {
                wait_for_vga();
                *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x2);
                tank->xloc = tank->xloc - 1;
                tank->tank_index = direct->West;
                tank_move = 1;
            }
        }
        else if(j->x1_val == 1){ //RIGHT
            if(tank->xloc < 576 && wall_collision(tank->xloc + 1, tank->yloc) == 0){
                wait_for_vga();
                *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x2);
                tank->xloc = tank->xloc + 1;
                tank->tank_index = direct->East;
                tank_move = 1;
            }
        }
        else if(j->y1_val == 2){ //UP
            if(tank->yloc > 1 && wall_collision(tank->xloc, tank->yloc - 2) == 0){
                wait_for_vga();
                *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x2);
                tank->yloc = tank->yloc - 2;
                tank->tank_index = direct->North;
                tank_move = 1;
            }
        }
        else if(j->y1_val == 1){//DOWN
            if(tank->yloc < 836 && wall_collision(tank->xloc, tank->yloc + 2) == 0){
                wait_for_vga();
                *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x2);
                tank->yloc = tank->yloc + 2;
                tank->tank_index = direct->South;
                tank_move = 1;
            }
        }
    }

    if(tank_move | gun_move){
        wait_for_vga();
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->tank_index << 2) | (0x1);
        wait_for_vga();
        *VGA = (tank->xloc << 22) | (tank->yloc << 12) | (tank->gun_index << 2) | (0x1);
    }

}

void update_bullet(struct tank_t *tank, struct bullet_t *bullet, struct joystick *j){

    if((bullet->bullet_move == 1)){
        if(j->ps2_val == 2){
            if(tank->gun_index == 34){ //E 
                bullet->bullet_index = 1;
                bullet->bullet_x = tank->xloc + 64;
                bullet->bullet_y = tank->yloc + 32;
            }
            else if(tank->gun_index == 35){ // N
                bullet->bullet_index = 2;
                bullet->bullet_x = tank->xloc + 16;
                bullet->bullet_y = tank->yloc - 40;
            }
            else if(tank->gun_index == 36){ // NE
                bullet->bullet_index = 3; //NE
                bullet->bullet_x = tank->xloc + 64;
                bullet->bullet_y = tank->yloc - 36;
            }
            else if(tank->gun_index == 37){ // NW
                bullet->bullet_index = 4; //NW
                bullet->bullet_x = tank->xloc - 32;
                bullet->bullet_y = tank->yloc - 34;
            }
            else if(tank->gun_index == 38){ // S
                bullet->bullet_index = 5; //S
                bullet->bullet_x = tank->xloc + 16;
                bullet->bullet_y = tank->yloc + 106;
            }
            else if(tank->gun_index == 39){ // SE
                bullet->bullet_index = 6; //SE
                bullet->bullet_x = tank->xloc + 64;
                bullet->bullet_y = tank->yloc + 106;
            }
            else if(tank->gun_index == 40){ // SW
                bullet->bullet_index = 7; //SW
                bullet->bullet_x = tank->xloc - 32;
                bullet->bullet_y = tank->yloc + 106;
            }
            else if(tank->gun_index == 41){ // W
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
            *VGA = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index << 2) | (0x1); 
            *debug = 0x37; // Sound of bullet

        }
    }
    else if(bullet->bullet_move == 2){
        if(bullet->bullet_x >= 616 || bullet->bullet_x <= 1 || bullet->bullet_y >= 884 || bullet->bullet_y <= 1){
            bullet->bullet_move = 1; // Not moving anymore
            wait_for_vga();
            *VGA = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index<< 2) | (0x2);
        }
        else if(bullet_collision(bullet->bullet_x, bullet->bullet_y)){
            bullet->bullet_move = 1; // Not moving anymore
            wait_for_vga();
            *VGA = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index<< 2) | (0x2);
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
            *VGA = (bullet->bullet_x << 22) | (bullet->bullet_y << 12) | (bullet->bullet_index << 2) | (0x1);
        }   
    } 
} 


int main(){
    init();
    int game_start = 1;
    while(1){
        while(game_start){
            read_joystick(&joy1);
            read_joystick_2(&joy2);
            update_player_tank(&player, &joy1, &player_direct);
            update_player_tank(&enemy, &joy2, &enemy_direct);
            update_bullet(&player, &player_bullet, &joy1);
            update_bullet(&enemy, &enemy_bullet, &joy2);
            if(bullet_tank(&player_bullet,&enemy) || bullet_tank(&enemy_bullet,&player)){
                game_start = 0;
                *debug = 0x38;
            }
            for(int i = 0; i < 10000; i++){
                2 + 2;
            };
        }
        if(bullet_tank(&player_bullet,&enemy)){
            flash_tank(&enemy);
        }
        else if(bullet_tank(&enemy_bullet,&player)){
            flash_tank(&player);
        }
    }

return 0;

}


