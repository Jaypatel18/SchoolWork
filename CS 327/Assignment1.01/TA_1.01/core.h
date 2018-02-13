#ifndef CORE_H
#define CORE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define ROCK ' '      /* char for rock   */
#define ROOM '.'      /* char for room   */
#define PATH '#'      /* char for path   */

#define DUNGEON_W 80  /* dungeon width   */
#define DUNGEON_H 21  /* dungeon height  */

#define ROOM_MIN_W 3  /* room min width  */
#define ROOM_MIN_H 2  /* room min height */

#define ROOM_MAX_W 15 /* room max width  */
#define ROOM_MAX_H 10 /* room max height */

#define TOL (1<<10)   /* max number of attempts to create rooms */

char dungeon[DUNGEON_H][DUNGEON_W];

#endif

