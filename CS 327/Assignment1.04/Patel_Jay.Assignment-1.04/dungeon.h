#ifndef DUNGEON_H
# define DUNGEON_H

# include "heap.h"
# include "macros.h"
# include "dims.h"

#define DUNGEON_X              80
#define DUNGEON_Y              21
#define MIN_ROOMS              6
#define MAX_ROOMS              10
#define ROOM_MIN_X             4
#define ROOM_MIN_Y             3
#define ROOM_MAX_X             14
#define ROOM_MAX_Y             8
#define SAVE_DIR               ".rlg327"
#define DUNGEON_SAVE_FILE      "dungeon"
#define DUNGEON_SAVE_SEMANTIC  "RLG327"
#define DUNGEON_SAVE_VERSION   0U

#define mappair(pair) (d->map[pair[dim_y]][pair[dim_x]])
#define mapxy(x, y) (d->map[y][x])
#define hardnesspair(pair) (d->hardness[pair[dim_y]][pair[dim_x]])
#define hardnessxy(x, y) (d->hardness[y][x])

typedef enum __attribute__ ((__packed__)) terrain_type {
    ter_debug,
    ter_wall,
    ter_wall_immutable,
    ter_floor,
    ter_floor_room,
    ter_floor_hall,
} terrain_type_t;

typedef struct room {
    pair_t position;
    pair_t size;
    uint32_t connected;
} room_t;

typedef struct pc {
    pair_t position;
} pc_t;

//New
typedef struct play
{
    
}play_t;

typedef struct numpc
{
    uint32_t bit;
    uint32_t x_pos;
    uint32_t y_pos;
    uint32_t x_used;
    uint32_t y_used;
}numpc_t;

typedef struct chartr
{
    uint32_t x;
    uint32_t y;
    uint32_t spd;
    char sybl;
    uint32_t up;
    uint32_t pc_q;
    uint32_t seq;
    
    union
    {
        play_t *play;
        numpc_t *numpc;
    };
}chartr_t;

typedef enum evnt
{
    check,
    chartr,
}evnt_t;


typedef struct event2
{
    uint32_t right;
    evnt_t typ;
    chartr_t *c;
}event2_t;

typedef struct dungeon {
    uint32_t num_rooms;
    room_t *rooms;
    uint32_t nummon;
    terrain_type_t map[DUNGEON_Y][DUNGEON_X];
    uint32_t seq;
    /* Since hardness is usually not used, it would be expensive to pull it *
     * into cache every time we need a map cell, so we store it in a        *
     * parallel array, rather than using a structure to represent the       *
     * cells.  We may want a cell structure later, but from a performanace  *
     * perspective, it would be a bad idea to ever have the map be part of  *
     * that structure.  Pathfinding will require efficient use of the map,  *
     * and pulling in unnecessary data with each map cell would add a lot   *
     * of overhead to the memory system.                                    */
    uint8_t hardness[DUNGEON_Y][DUNGEON_X];
    uint8_t pc_distance[DUNGEON_Y][DUNGEON_X];
    uint8_t pc_tunnel[DUNGEON_Y][DUNGEON_X];
    pc_t pc;
    chartr_t *mapofc[DUNGEON_Y][DUNGEON_X];
} dungeon_t;

void init_dungeon(dungeon_t *d);
void delete_dungeon(dungeon_t *d);
int gen_dungeon(dungeon_t *d);
void render_dungeon(dungeon_t *d);
int write_dungeon(dungeon_t *d);
int read_dungeon(dungeon_t *d, char *file);
int read_pgm(dungeon_t *d, char *pgm);
void render_distance_map(dungeon_t *d);
void render_tunnel_distance_map(dungeon_t *d);

#endif
