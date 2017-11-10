#ifndef ROOM_H
#define ROOM_H

typedef struct
{
	unsigned int x, y, w, h;
} Room;

/* get the centroid of the room */
void room_centroid(int *x, int *y, Room r);

/* determine if two rooms are adjacent or overlap */
int room_overlap(Room r, Room s);

/* create a new room with random location and size */
Room room_create();

/* paint the room on the dungeon */
void room_paint(Room r);

#endif

