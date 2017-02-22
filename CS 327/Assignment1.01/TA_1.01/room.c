#include <stdlib.h>
#include <time.h>

#include "core.h"
#include "room.h"

void room_centroid(int* x, int* y, Room r)
{
	*x = r.x + r.w/2;
	*y = r.y + r.h/2;
}

int room_overlap(Room r, Room s)
{
	if (r.x+r.w < s.x || r.x > s.x+s.w)
		return 0;
	if (r.y+r.h < s.y || r.y > s.y+s.h)
		return 0;
	
	return 1;
}

Room room_create()
{
	Room r;
	r.w = rand() % (ROOM_MAX_W - ROOM_MIN_W) + ROOM_MIN_W;
	r.h = rand() % (ROOM_MAX_H - ROOM_MIN_H) + ROOM_MIN_H;
	r.x = rand() % (DUNGEON_W - r.w - 1) + 1;
	r.y = rand() % (DUNGEON_H - r.h - 1) + 1;
	return r;
}

void room_paint(Room room)
{
	int r, c;
	for (r=room.y;r<room.y+room.h;r++)
	{
		for (c=room.x;c<room.x+room.w;c++)
		{
			dungeon[r][c] = ROOM;
		}
	}
}

