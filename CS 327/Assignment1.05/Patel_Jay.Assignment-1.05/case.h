#ifndef CASE_H
# define CASE_H

#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>
#include <ncurses.h>

#include "dungeon.h"
#include "pc.h"
#include "npc.h"
#include "move.h"

void cases(dungeon_t *d);
void activate (dungeon_t *d, char c);

#endif


