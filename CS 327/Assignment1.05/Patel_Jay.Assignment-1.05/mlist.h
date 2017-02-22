#ifndef MLIST_H
# define MLIST_H

#include <stdio.h>
#include <string.h>
#include <sys/time.h>
#include <unistd.h>
#include <ncurses.h>

#include "dungeon.h"
#include "pc.h"
#include "npc.h"

int mon_list_display(dungeon_t *d, int left, int right);
int mlist (dungeon_t *d);

#endif
