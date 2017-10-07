#include <ncurses.h>
#include <stdlib.h>

#include "core.h"
#include "debug.h"
#include "dungeon.h"
#include "pc.h"

PC::PC() : Character()
{
	speed = 10;
	symb = '@';

	seenDungeon = (char *)malloc(DUNG_W * DUNG_H);

	clearSeenDungeon();

	color = COLOR_PC;

	hp = hpmaxNaked = 100;
	mp = mpmaxNaked = 100;
	
	dam = new Dice(5, 5, 5);

	attacking = NULL; 
	for(int i = 0; i<12; i++)
	{
		tools[i]= NULL;
	}
}

PC::~PC()
{
	free(seenDungeon);

	delete dam;
}

void PC::clearSeenDungeon()
{
	for (int i = 0; i < DUNG_W * DUNG_H; i++)
		seenDungeon[i] = ' ';
}

void PC::setLocation(int x, int y)
{
	Character::setLocation(x, y);
	
	pcx = x;
	pcy = y;
		
	for (int r=0; r<DUNG_H; r++) {
		for (int c=0; c<DUNG_W; c++) {
			if (dungeon->isVisible(c, r))
				seenDungeon[r*DUNG_W+c]=dungeon->tmap[r][c];
		}
	}
}

int PC::getSpeed()
{
	int total = Character::getSpeed();
	int j;
	for(j = 0; j < 12; j++)
	{
	   if(tools[j])
		{
			total += tools[j]->speed;
		}
	}
	return total;
}

int PC::getTotalDam()
{
	int total = dam->roll();
	int j;
	for(j = 0; j < 12; j++)
	{
	   if(tools[j])
		{
			total += tools[j]->dam->roll();
		}
	}
	return total;
}

int PC::getTotalDef()
{
	int total = 0;
	int j;
	for(j = 0; j < 12; j++)
	{
	   if(tools[j])
		{
			total += tools[j]->def;
		}
	}
	return total;
}

int PC::hpmax()
{
	return hpmaxNaked;
}

// singleton PC
PC *pc;
