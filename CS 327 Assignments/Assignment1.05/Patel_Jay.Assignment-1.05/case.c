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


void activate(dungeon_t *d, char c) //generate a new dungeon
{
	   if(c == '>' && d->map[d->pc.position[dim_y]][d->pc.position[dim_x]] == down)
  {
	int j;
	j = d->max_monsters;
	init_dungeon(d);
	d->max_monsters = j;
	gen_dungeon(d);
	config_pc(d);
	gen_monsters(d);
	render_dungeon(d);
   }
	
	if(d->map[d->pc.position[dim_y]][d->pc.position[dim_x]] == up && c == '<')
  {
	int j;
	j = d->max_monsters;
	init_dungeon(d);
	d->max_monsters = j;
	gen_dungeon(d);
	config_pc(d);
	gen_monsters(d);
	render_dungeon(d);
   }
}

void cases(dungeon_t *d)
{
  int j,k;
  k = 0;

  while(k == 0 )
  {
    j = getchar();
    switch (j){
    case '7':
    case 'y':
      move_pc(d,0);
      k = 1;
      break;

    case '8':
    case 'k':
      move_pc(d,1);
      k  = 1;
      break;

    case '9':
    case 'u':
      move_pc(d, 2);
      k = 1; 
      break;

    case '6':
    case 'l':
      move_pc(d,3);
      k = 1;
      break;

    case '3':
    case 'n':
      move_pc(d,4);
      k = 1;
      break;

    case '2':
    case 'j':
      move_pc(d,5);
      k = 1;
      break;

    case '1':
    case 'b':
      move_pc(d,6);
      k = 1;
      break;

    case '4':
    case 'h':
      move_pc(d,7);
      k = 1;
      break;

    case '>':
    	activate(d, '>');
    	break;
	
    case '<':
    	activate(d, '<');
    	break;

    case '5':
    	k = 1;
    	break;

    case ' ':
    	k = 1;
    	break;
	
    case 'm':
      k = mlist(d);
      break;

    case 'q':
    case 'Q':
    	endwin();
    	pc_delete(d->pc.pc);
    	delete_dungeon(d);
    	exit(0);
    	break;

     case 27:
    	k =0;
    	break;
  }

}
      
}



