#ifndef PC_H
# define PC_H

#ifdef __cplusplus
extern "C"{
  #endif
  
# include <stdint.h>

# include "dims.h"
#include "dungeon.h"
#include "npc.h"


  #ifdef __cplusplus
  extern "C"}
  #endif

#ifdef __cplusplus

class pc: public character{
 public:
  terrain_type_t mpa[DUNGEON_Y][DUNGEON_X];
};

extern "C"
{

  #else
  
  
  typedef struct pc pc_t;

  #endif

typedef struct dungeon dungeon_t;
  
void pc_delete(pc_t *pc);
uint32_t pc_is_alive(dungeon_t *d);
void config_pc(dungeon_t *d);
uint32_t pc_next_pos(dungeon_t *d, pair_t dir);
void place_pc(dungeon_t *d);
#ifdef __cplusplus
}
#endif

#endif
