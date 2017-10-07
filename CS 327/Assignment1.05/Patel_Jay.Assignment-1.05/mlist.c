#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>
#include <ncurses.h>

#include "dungeon.h"
#include "pc.h"
#include "npc.h"
#include "move.h"
#include "case.h"
#include "mlist.h"
#include "character.h"

int mon_list_display(dungeon_t *d, int left, int right)
{
    clear ();
    refresh();
    move(1,0); 
  
    int y,x,k, a, west, north;
    character_t *arr [300];
    k =0;
    for(y = 0; y < DUNGEON_Y; y++)	
    {
	for(x = 0; x < DUNGEON_X; x++)
    {
	if(d->character[y][x] && d->character[y][x] ->symbol != d->pc.symbol)
	{
		arr[k] = d->character[y][x];
		k++;
	}
    }

    }

a = 1;
for(k = left; k < right; k++)
{
	west = 0;
	north = 0;
	west = d->pc.position[dim_x] - arr[k]->position[dim_x];
	north = d->pc.position[dim_y] - arr[k]->position[dim_y];
	
	mvprintw (a++, 0, "%c is at %3d unit %s & %3d unit %s from the player/user\n", arr[k]->symbol, abs(west), west <0 ? "East" : "West", abs(north), north < 0? "South" : "North");
	printw("Please use Escape button to continue and up arrow or down arrow to view more monsters\n");
	printw("Hit Q to quit the game!!\n");
} 
}

int mlist (dungeon_t *d)
{
	int left, right, error, charc;
	left = 0;
	right = 20;
	
	if(d->num_monsters <=20)
	{
		right = d-> num_monsters;
	}	
	
	mon_list_display(d,left,right);
	error = 0;
	
	while(error == 0)
	{

		charc = getch();
		switch (charc)
		{
			
			case KEY_UP:
			if(left -1 >= 0)
			{
				mon_list_display(d, --left, --right);
			
			
			}
			break;
			case KEY_DOWN:
			if(right + 1 <= d->num_monsters - 1)
			{
				mon_list_display(d, ++left, ++right);
			
			}
			break;

			case 27:
			refresh();
			render_dungeon(d);
			refresh();
			return 1;
			break;

		}
	}
	
	return -1;
}





