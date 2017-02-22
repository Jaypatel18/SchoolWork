#include "move.h"

#include <unistd.h>
#include <stdlib.h>
#include <assert.h>

#include "dungeon.h"
#include "heap.h"
#include "move.h"
#include "npc.h"
#include "pc.h"
#include "character.h"
#include "utils.h"
#include "path.h"
#include "event.h"
#include "io.h"
void do_combat(dungeon_t *d, character_t *atk, character_t *def)
{
  s_life((character *) def, 0);
  if (def != (character *) d->pc) {
    d->num_monsters--;
  }
}

void move_character(dungeon_t *d, character_t *c, pair_t next)
{
  if (charpair(next) &&
      ((next[dim_y] != c->position[dim_y]) ||
       (next[dim_x] != c->position[dim_x]))) {
    do_combat(d, c, charpair(next));
  }

  d->character[c->position[dim_y]][c->position[dim_x]] = NULL;
  s_y((character *) c, next[dim_y];
  s_x((character *) c, next[dim_x];
  d->character[y_value((character *) c)][x_value((character *)c )] = c;
}

void do_moves(dungeon_t *d)
{
  pair_t next;
  character_t *c;
  event_t *e;

  /* Remove the PC when it is PC turn.  Replace on next call.  This allows *
   * use to completely uninit the heap when generating a new level without *
   * worrying about deleting the PC.                                       */

  if (pc_is_alive(d)) {
    /* The PC always goes first one a tie, so we don't use new_event().  *
     * We generate one manually so that we can set the PC sequence       *
     * number to zero.                                                   */
    e = malloc(sizeof (*e));
    e->type = event_character_turn;
    /* The next line is buggy.  Monsters get first turn before PC.  *
     * Monster gen code always leaves PC in a monster-free room, so *
     * not a big issue, but it needs a better solution.             */
    /* 1.05: I'm still trying to figure out what the right solution *
     * to this is.  I've come up with several ugly hacks that fix   *
     * it, but there must be a better way...                        */
    e->time = d->time + (1000 / g_speed (character *) d->pc);

    e->sequence = 0;
    e->c = (character *)d->pc;
    heap_insert(&d->events, e);
  }

  while (pc_is_alive(d) &&
         (e = heap_remove_min(&d->events)) &&
         ((e->type != event_character_turn) || (e->c != (character *) d->pc))) {
    d->time = e->time;
    if (e->type == event_character_turn) {
      c = e->c;
    }
    if (!c->alive ((character *) c)) {
      if (d->character[y_value((character *)c)][x_value((character *)c)] == c)
{
	d ->character[y_value((character *)c)][x_value((character *)c)] = NULL;
      }
      if (c != (character *) d->pc) {
        event_delete(e);
      }
      continue;
    }

    npc_next_pos(d, c, next);
    move_character(d, c, next);

    heap_insert(&d->events, update_event(d, e, 1000 / g_speed((character *) c)));
  }

  io_display(d);
  if (pc_is_alive(d) && e->c == (character *)d->pc) {
    c = e->c;
    d->time = e->time;
    /* Kind of kludgey, but because the PC is never in the queue when   *
     * we are outside of this function, the PC event has to get deleted *
     * and recreated every time we leave and re-enter this function.    */
    e->c = NULL;
    event_delete(e);

    io_handle_input(d);
  }
}

void dir_nearest_wall(dungeon_t *d, character_t *c, pair_t dir)
{
  dir[dim_x] = dir[dim_y] = 0;

  if (x_value((character *)c) != 1 && x_value(character *) c)!= DUNGEON_X - 2) {
	s_x((character *) c, x_value((character *) c) >  DUNGEON_X - x_value ((character *) c) ? 1 : -1));  

  }
  if (y_value((character *)c) != 1 && y_value(character *) c)!= DUNGEON_Y - 2) {
	s_y((character *) c, y_value((character *) c) >  DUNGEON_Y - y_value ((character *) c) ? 1 : -1));  

  }
}

uint32_t in_corner(dungeon_t *d, character_t *c)
{
  uint32_t num_immutable;

  num_immutable = 0;

  num_immutable += (mapxy(c->position[dim_x] - 1,
                          c->position[dim_y]    ) == ter_wall_immutable);
  num_immutable += (mapxy(c->position[dim_x] + 1,
                          c->position[dim_y]    ) == ter_wall_immutable);
  num_immutable += (mapxy(c->position[dim_x]    ,
                          c->position[dim_y] - 1) == ter_wall_immutable);
  num_immutable += (mapxy(c->position[dim_x]    ,
                          c->position[dim_y] + 1) == ter_wall_immutable);

  return num_immutable > 1;
}

static void new_dungeon_level(dungeon_t *d, uint32_t dir)
{
  /* Eventually up and down will be independantly meaningful. *
   * For now, simply generate a new dungeon.                  */

  switch (dir) {
  case '<':
  case '>':
    new_dungeon(d);
    break;
  default:
    break;
  }
}

uint32_t move_pc(dungeon_t *d, uint32_t dir)
{
   pair_t a;
  pair_t next;
  uint32_t was_stairs = 0;

  next[dim_y] = d->pc.position[dim_y];
  next[dim_x] = d->pc.position[dim_x];


  switch (dir) {
  case 1:
  case 2:
  case 3:
    next[dim_y]++;
    break;
  case 4:
  case 5:
  case 6:
    break;
  case 7:
  case 8:
  case 9:
    next[dim_y]--;
    break;
  }
  switch (dir) {
  case 1:
  case 4:
  case 7:
    next[dim_x]--;
    break;
  case 2:
  case 5:
  case 8:
    break;
  case 3:
  case 6:
  case 9:
    next[dim_x]++;
    break;
  case '<':
	a[dim_x] = x_value ((character *) d->pc);
	a[dim_y] = y_value ((character *) d->pc);
    if (mappair(d->pc.position) == ter_stairs_up) {
      was_stairs = 1;
      new_dungeon_level(d, '<');
    }
    break;
  case '>':
	a[dim_x] = x_value ((character *) d->pc);
	a[dim_y] = y_value ((character *) d->pc);
    if (mappair(d->pc.position) == ter_stairs_down) {
      was_stairs = 1;
      new_dungeon_level(d, '>');
    }
    break;
  }

  if (was_stairs) {
    return 0;
  }

  if ((dir != '>') && (dir != '<') && (mappair(next) >= ter_floor)) {
    move_character(d, &d->pc, next);
    dijkstra(d);
    dijkstra_tunnel(d);

    return 0;
  }

  return 1;
}
