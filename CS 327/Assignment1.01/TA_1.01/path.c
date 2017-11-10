#include "core.h"
#include "room.h"

static int numAdjacentPaths(int r, int c)
{
	int num = 0;
	if(dungeon[r-1][c]==PATH)
		num++;
	if(dungeon[r+1][c]==PATH)
		num++;
	if(dungeon[r][c-1]==PATH)
		num++;
	if(dungeon[r][c+1]==PATH)
		num++;
	return num;
}

void path_connect(Room from, Room to)
{
	int fromx, fromy, tox, toy;
	
	room_centroid(&fromx, &fromy, from);
	room_centroid(&  tox, &  toy,   to);

	int dx = tox - fromx;
	int dy = toy - fromy;

	int incx = dx > 0 ? 1 : -1;
	int incy = dy > 0 ? 1 : -1;
	
	int r = fromy, c = fromx;

	while (r!=toy && c!=tox)
	{	
		if (dungeon[r][c]!= ROOM)
			dungeon[r][c] = PATH;
		
		// if we connect to existing path, then stop
		if (numAdjacentPaths(r, c)>1)
			break;
			
		if (rand() % 2)
			c+=incx;
		else
			r+=incy;
	}
	while (r!=toy || c!=tox)
	{
		if (dungeon[r][c]!= ROOM)
			dungeon[r][c] = PATH;

		// if we connect to existing path, then stop
		if (numAdjacentPaths(r, c)>1)
			break;

		if (r!=toy)
			r+=incy;
		if (c!=tox)
			c+=incx;
	}
}

