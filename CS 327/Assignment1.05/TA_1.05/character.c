#include "core.h"
#include "character.h"
#include "dungeon.h"

Character *character_new(int isPC)
{
	Character *c = malloc(sizeof(*c));
	
	if (isPC) {
		c->c = PC_C; // PC characteristic
		c->speed = 10;
	} else {
		c->c = rand() & 0xf;
		c->speed = 5 + (rand() & 0xf); // 5-20 for monsters
	}
	
	c->dead = 0;
	c->turn = 0;

	c->mempcx = 0;
	c->mempcy = 0;

	return c;
}

int character_delete(Character *c)
{
	int i;
	if (!ISPC(c)) {
		// make sure deleted character not in [0, nummon) of npcs
		for (i=0; i<nummon; i++) {
			if (npcs[i]==c) {
				npcs[i] = npcs[--nummon];
				break;
			}
		}
	}
	free(c);		
	return 0;
}

char character_char(Character *c)
{
	if (ISPC(c))
		return '@';
	else if (c->c < 10)
		return '0' + c->c;
	else if (c->c < 16)
		return 'a' + c->c - 10;
	else
		return -1;
}

int character_color(Character *c)
{
	int speed = c->speed, color = 0;
	if (ISPC(c)) 
		color = COLOR_PC;
	else if (speed <= 8)
		color = COLOR_WHITE;
	else if (speed <= 12)
		color = COLOR_GREEN;
	else if (speed <= 16)
		color = COLOR_CYAN;
	else if (speed <= 20)
		color = COLOR_MAGENTA;
	
	return color;
}

int character_place(Character *c)
{
	while (1) {
		int x = rand() % DUNG_W;
		int y = rand() % DUNG_H;

		if (!hmap[y][x]) {
			cmap[y][x] = c;

			c->x = x;
			c->y = y;
			break;
		}
	}

	if (ISPC(c))
		pc = c;

	return 0;
}

