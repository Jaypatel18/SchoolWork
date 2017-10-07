#ifdef __cpluplus
extern "C"
{
#endif

#include <stdlib.h>

#include "character.h"
#include "heap.h"
#include "npc.h"
#include "pc.h"
#include "dungeon.h"

static dungeon_t *dungeon;

void character_delete(character *v)
{
  /* The PC is never malloc()ed anymore, do don't attempt to free it here. */
  character_t *c;

	// if(v) { c = v;}
	// if(c -> npc) { 
	// npc_delete(c->npc);


  if(v && c != (character *) dungeon->pc) {
	c = (character *)v;
	free(c); }
}

void seq(character *ch, uint32_t seq2)
{
	ch-> sequence_number = seq2;
};

uint32_t g_seq (character *ch)
{
	return ((character *)ch) -> sequence_number;
};

int32_t alive (character *ch)
{
	((character *)c) ->alive;
}

char g_symbol (character *ch)
{
	return ch ->symbol;
}

int8_t x_value(character *ch)
{
	ch->position[dim_x];
}

int8_t y_value(character *ch)
{
	return ch->position[dim_y];
}

int32_t g_speed (character *ch)
{
	return ch ->speed;
}

void s_speed (character *ch, int32_t k)
{
	ch->speed = k;
}
	
void s_life(character *ch, int32_t m)
{
	((character *)ch) ->alive = m;
} 

void s_symbol (character *ch, char a)
{
	((character *)ch) ->symbol = a;
}

int s_x (character *ch, int8_t b)
{
	if(b == 0){
	return 0;}

	ch ->position[dim_x] = b;
	return 1;
}

int s_y(character *ch, int8_t c)
{
	if(c ==0){
	return 0;}
	
	ch ->position[dim_y] = c;
	return 1;
}

character *getmalloc(character *ch){
	return (character *)malloc (sizeof(*ch)); }

uint32_t can_see(dungeon_t *d, character_t *voyeur, character_t *exhibitionist)
{
  /* Application of Bresenham's Line Drawing Algorithm.  If we can draw *
   * a line from v to e without intersecting any walls, then v can see  *
   * e.  Unfortunately, Bresenham isn't symmetric, so line-of-sight     *
   * based on this approach is not reciprocal (Helmholtz Reciprocity).  *
   * This is a very real problem in roguelike games, and one we're      *
   * going to ignore for now.  Algorithms that are symmetrical are far  *
   * more expensive.                                                    */

  pair_t first, second;
  pair_t del, f;
  int16_t a, b, c, i;
  dungeon = d;

  first[dim_x] = x_value(voyeur);
  first[dim_y] = y_value(voyeur);
  second[dim_x] = x_value(exhibitionist);
  second[dim_y] = y_value(exhibitionist);

  if ((abs(first[dim_x] - second[dim_x]) > VISUAL_RANGE) ||
      (abs(first[dim_y] - second[dim_y]) > VISUAL_RANGE)) {
    return 0;
  }

  /*
  mappair(first) = ter_debug;
  mappair(second) = ter_debug;
  */

  if (second[dim_x] > first[dim_x]) {
    del[dim_x] = second[dim_x] - first[dim_x];
    f[dim_x] = 1;
  } else {
    del[dim_x] = first[dim_x] - second[dim_x];
    f[dim_x] = -1;
  }

  if (second[dim_y] > first[dim_y]) {
    del[dim_y] = second[dim_y] - first[dim_y];
    f[dim_y] = 1;
  } else {
    del[dim_y] = first[dim_y] - second[dim_y];
    f[dim_y] = -1;
  }

  if (del[dim_x] > del[dim_y]) {
    a = del[dim_y] + del[dim_y];
    c = a - del[dim_x];
    b = c - del[dim_x];
    for (i = 0; i <= del[dim_x]; i++) {
      if ((mappair(first) < ter_floor) && i && (i != del[dim_x])) {
        return 0;
      }
      /*      mappair(first) = ter_debug;*/
      first[dim_x] += f[dim_x];
      if (c < 0) {
        c += a;
      } else {
        c += b;
        first[dim_y] += f[dim_y];
      }
    }
    return 1;
  } else {
    a = del[dim_x] + del[dim_x];
    c = a - del[dim_y];
    b = c - del[dim_y];
    for (i = 0; i <= del[dim_y]; i++) {
      if ((mappair(first) < ter_floor) && i && (i != del[dim_y])) {
        return 0;
      }
      /*      mappair(first) = ter_debug;*/
      first[dim_y] += f[dim_y];
      if (c < 0) {
        c += a;
      } else {
        c += b;
        first[dim_x] += f[dim_x];
      }
    }
    return 1;
  }

  return 1;
}

#ifdef __cplusplus
}
#endif
