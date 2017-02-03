#include "core.h"
#include "room.h"
#include "path.h"

#define BUFFER_SIZE (1<<5)

/* print dungeon */
void dungeon_print(FILE* fp);

int main(int argc, char** argv)
{
	int r, c, i, j, t;
	
	srand(time(NULL));

	// fill the dungeon with rocks
	for (r=0;r<DUNGEON_H;r++)
	{
		for (c=0;c<DUNGEON_W;c++)
		{
			dungeon[r][c] = ROCK;
		}
	}

	Room rooms[BUFFER_SIZE];

	for (i=0, t=0; i<BUFFER_SIZE && t<TOL; t++)
	{
		// create a new random room
		rooms[i] = room_create();

		int overlap = 0;
		
		// check if the new room has overlap with previous rooms	
		for (j=0; j<i; j++)
		{
			if (room_overlap(rooms[i], rooms[j]))
			{
				overlap = 1;
				break;
			}
		}
		
		// paint and connect the room if there is no overlap	
		if (!overlap)
		{
			room_paint(rooms[i]);
			path_connect(rooms[i], rooms[0]);
			i++;
		}
	}

	dungeon_print(stdout);

	return 0;
}

void dungeon_print(FILE* fp)
{
	int r, c;

	for (r=0; r<DUNGEON_H; r++)
	{
		for (c=0; c<DUNGEON_W; c++)
		{
			fputc(dungeon[r][c], fp);
		}
		
		fputc('\n', fp);
	}
}

