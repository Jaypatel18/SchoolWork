#include <stdio.h>
#include <stdint.h>
#include <endian.h>
#include <sys/stat.h>
#include <limits.h>
#include <errno.h>

#include "dungeon.h"
#include "utils.h"
#include "heap.h"

typedef struct corridor_path {
    heap_node_t *hn;
    uint8_t pos[2];
    uint8_t from[2];
    int32_t cost;
} corridor_path_t;

static uint32_t in_room(dungeon_t *d, int16_t y, int16_t x)
{
    int i;
    
    for (i = 0; i < d->num_rooms; i++) {
        if ((x >= d->rooms[i].position[dim_x]) &&
            (x < (d->rooms[i].position[dim_x] + d->rooms[i].size[dim_x])) &&
            (y >= d->rooms[i].position[dim_y]) &&
            (y < (d->rooms[i].position[dim_y] + d->rooms[i].size[dim_y]))) {
            return 1;
        }
    }
    
    return 0;
}

static int32_t corridor_path_cmp(const void *key, const void *with) {
    return ((corridor_path_t *) key)->cost - ((corridor_path_t *) with)->cost;
}

static void dijkstra_corridor(dungeon_t *d, pair_t from, pair_t to)
{
    static corridor_path_t path[DUNGEON_Y][DUNGEON_X], *p;
    static uint32_t initialized = 0;
    heap_t h;
    uint32_t x, y;
    
    if (!initialized) {
        for (y = 0; y < DUNGEON_Y; y++) {
            for (x = 0; x < DUNGEON_X; x++) {
                path[y][x].pos[dim_y] = y;
                path[y][x].pos[dim_x] = x;
            }
        }
        initialized = 1;
    }
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            path[y][x].cost = INT_MAX;
        }
    }
    
    path[from[dim_y]][from[dim_x]].cost = 0;
    
    heap_init(&h, corridor_path_cmp, NULL);
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            if (mapxy(x, y) != ter_wall_immutable) {
                path[y][x].hn = heap_insert(&h, &path[y][x]);
            } else {
                path[y][x].hn = NULL;
            }
        }
    }
    
    while ((p = heap_remove_min(&h))) {
        p->hn = NULL;
        
        if ((p->pos[dim_y] == to[dim_y]) && p->pos[dim_x] == to[dim_x]) {
            for (x = to[dim_x], y = to[dim_y];
                 (x != from[dim_x]) || (y != from[dim_y]);
                 p = &path[y][x], x = p->from[dim_x], y = p->from[dim_y]) {
                if (mapxy(x, y) != ter_floor_room) {
                    mapxy(x, y) = ter_floor_hall;
                    hardnessxy(x, y) = 0;
                }
            }
            heap_delete(&h);
            return;
        }
        
        if ((path[p->pos[dim_y] - 1][p->pos[dim_x]    ].hn) &&
            (path[p->pos[dim_y] - 1][p->pos[dim_x]    ].cost >
             p->cost + hardnesspair(p->pos))) {
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].cost =
                p->cost + hardnesspair(p->pos);
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y] - 1]
                                             [p->pos[dim_x]    ].hn);
            }
        if ((path[p->pos[dim_y]    ][p->pos[dim_x] - 1].hn) &&
            (path[p->pos[dim_y]    ][p->pos[dim_x] - 1].cost >
             p->cost + hardnesspair(p->pos))) {
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].cost =
                p->cost + hardnesspair(p->pos);
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y]    ]
                                             [p->pos[dim_x] - 1].hn);
            }
        if ((path[p->pos[dim_y]    ][p->pos[dim_x] + 1].hn) &&
            (path[p->pos[dim_y]    ][p->pos[dim_x] + 1].cost >
             p->cost + hardnesspair(p->pos))) {
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].cost =
                p->cost + hardnesspair(p->pos);
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y]    ]
                                             [p->pos[dim_x] + 1].hn);
            }
        if ((path[p->pos[dim_y] + 1][p->pos[dim_x]    ].hn) &&
            (path[p->pos[dim_y] + 1][p->pos[dim_x]    ].cost >
             p->cost + hardnesspair(p->pos))) {
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].cost =
                p->cost + hardnesspair(p->pos);
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y] + 1]
                                             [p->pos[dim_x]    ].hn);
            }
    }
}

/* This is a cut-and-paste of the above.  The code is modified to  *
 * calculate paths based on inverse hardnesses so that we get a    *
 * high probability of creating at least one cycle in the dungeon. */
static void dijkstra_corridor_inv(dungeon_t *d, pair_t from, pair_t to)
{
    static corridor_path_t path[DUNGEON_Y][DUNGEON_X], *p;
    static uint32_t initialized = 0;
    heap_t h;
    uint32_t x, y;
    
    if (!initialized) {
        for (y = 0; y < DUNGEON_Y; y++) {
            for (x = 0; x < DUNGEON_X; x++) {
                path[y][x].pos[dim_y] = y;
                path[y][x].pos[dim_x] = x;
            }
        }
        initialized = 1;
    }
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            path[y][x].cost = INT_MAX;
        }
    }
    
    path[from[dim_y]][from[dim_x]].cost = 0;
    
    heap_init(&h, corridor_path_cmp, NULL);
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            if (mapxy(x, y) != ter_wall_immutable) {
                path[y][x].hn = heap_insert(&h, &path[y][x]);
            } else {
                path[y][x].hn = NULL;
            }
        }
    }
    
    while ((p = heap_remove_min(&h))) {
        p->hn = NULL;
        
        if ((p->pos[dim_y] == to[dim_y]) && p->pos[dim_x] == to[dim_x]) {
            for (x = to[dim_x], y = to[dim_y];
                 (x != from[dim_x]) || (y != from[dim_y]);
                 p = &path[y][x], x = p->from[dim_x], y = p->from[dim_y]) {
                if (mapxy(x, y) != ter_floor_room) {
                    mapxy(x, y) = ter_floor_hall;
                    hardnessxy(x, y) = 0;
                }
            }
            heap_delete(&h);
            return;
        }
        
#define hardnesspair_inv(p) (in_room(d, p[dim_y], p[dim_x]) ? \
224                            : \
(255 - hardnesspair(p)))
        
        if ((path[p->pos[dim_y] - 1][p->pos[dim_x]    ].hn) &&
            (path[p->pos[dim_y] - 1][p->pos[dim_x]    ].cost >
             p->cost + hardnesspair_inv(p->pos))) {
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].cost =
                p->cost + hardnesspair_inv(p->pos);
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y] - 1][p->pos[dim_x]    ].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y] - 1]
                                             [p->pos[dim_x]    ].hn);
            }
        if ((path[p->pos[dim_y]    ][p->pos[dim_x] - 1].hn) &&
            (path[p->pos[dim_y]    ][p->pos[dim_x] - 1].cost >
             p->cost + hardnesspair_inv(p->pos))) {
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].cost =
                p->cost + hardnesspair_inv(p->pos);
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y]    ][p->pos[dim_x] - 1].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y]    ]
                                             [p->pos[dim_x] - 1].hn);
            }
        if ((path[p->pos[dim_y]    ][p->pos[dim_x] + 1].hn) &&
            (path[p->pos[dim_y]    ][p->pos[dim_x] + 1].cost >
             p->cost + hardnesspair_inv(p->pos))) {
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].cost =
                p->cost + hardnesspair_inv(p->pos);
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y]    ][p->pos[dim_x] + 1].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y]    ]
                                             [p->pos[dim_x] + 1].hn);
            }
        if ((path[p->pos[dim_y] + 1][p->pos[dim_x]    ].hn) &&
            (path[p->pos[dim_y] + 1][p->pos[dim_x]    ].cost >
             p->cost + hardnesspair_inv(p->pos))) {
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].cost =
                p->cost + hardnesspair_inv(p->pos);
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].from[dim_y] = p->pos[dim_y];
                path[p->pos[dim_y] + 1][p->pos[dim_x]    ].from[dim_x] = p->pos[dim_x];
                heap_decrease_key_no_replace(&h, path[p->pos[dim_y] + 1]
                                             [p->pos[dim_x]    ].hn);
            }
    }
}

/* Chooses a random point inside each room and connects them with a *
 * corridor.  Random internal points prevent corridors from exiting *
 * rooms in predictable locations.                                  */
static int connect_two_rooms(dungeon_t *d, room_t *r1, room_t *r2)
{
    pair_t e1, e2;
    
    e1[dim_y] = rand_range(r1->position[dim_y],
                           r1->position[dim_y] + r1->size[dim_y] - 1);
    e1[dim_x] = rand_range(r1->position[dim_x],
                           r1->position[dim_x] + r1->size[dim_x] - 1);
    e2[dim_y] = rand_range(r2->position[dim_y],
                           r2->position[dim_y] + r2->size[dim_y] - 1);
    e2[dim_x] = rand_range(r2->position[dim_x],
                           r2->position[dim_x] + r2->size[dim_x] - 1);
    
    /*  return connect_two_points_recursive(d, e1, e2);*/
    dijkstra_corridor(d, e1, e2);
    
    return 0;
}

static int create_cycle(dungeon_t *d)
{
    /* Find the (approximately) farthest two rooms, then connect *
     * them by the shortest path using inverted hardnesses.      */
    
    int32_t max, tmp, i, j, p, q;
    pair_t e1, e2;
    
    for (i = max = 0; i < d->num_rooms - 1; i++) {
        for (j = i + 1; j < d->num_rooms; j++) {
            tmp = (((d->rooms[i].position[dim_x] - d->rooms[j].position[dim_x])  *
                    (d->rooms[i].position[dim_x] - d->rooms[j].position[dim_x])) +
                   ((d->rooms[i].position[dim_y] - d->rooms[j].position[dim_y])  *
                    (d->rooms[i].position[dim_y] - d->rooms[j].position[dim_y])));
            if (tmp > max) {
                max = tmp;
                p = i;
                q = j;
            }
        }
    }
    
    /* Can't simply call connect_two_rooms() because it doesn't *
     * use inverse hardnesses, so duplicate it here.            */
    e1[dim_y] = rand_range(d->rooms[p].position[dim_y],
                           (d->rooms[p].position[dim_y] +
                            d->rooms[p].size[dim_y] - 1));
    e1[dim_x] = rand_range(d->rooms[p].position[dim_x],
                           (d->rooms[p].position[dim_x] +
                            d->rooms[p].size[dim_x] - 1));
    e2[dim_y] = rand_range(d->rooms[q].position[dim_y],
                           (d->rooms[q].position[dim_y] +
                            d->rooms[q].size[dim_y] - 1));
    e2[dim_x] = rand_range(d->rooms[q].position[dim_x],
                           (d->rooms[q].position[dim_x] +
                            d->rooms[q].size[dim_x] - 1));
    
    dijkstra_corridor_inv(d, e1, e2);
    
    return 0;
}

static int connect_rooms(dungeon_t *d)
{
    uint32_t i;
    
    for (i = 1; i < d->num_rooms; i++) {
        connect_two_rooms(d, d->rooms + i - 1, d->rooms + i);
    }
    
    create_cycle(d);
    
    return 0;
}

int gaussian[5][5] = {
    {  1,  4,  7,  4,  1 },
    {  4, 16, 26, 16,  4 },
    {  7, 26, 41, 26,  7 },
    {  4, 16, 26, 16,  4 },
    {  1,  4,  7,  4,  1 }
};

typedef struct queue_node {
    int x, y;
    struct queue_node *next;
} queue_node_t;

static int smooth_hardness(dungeon_t *d)
{
    int32_t i, x, y;
    int32_t s, t, p, q;
    queue_node_t *head, *tail, *tmp;
    uint8_t hardness[DUNGEON_Y][DUNGEON_X];
    
#ifdef DUMP_HARDNESS_IMAGES
    FILE *out;
#endif
    
    memset(&hardness, 0, sizeof (hardness));
    
    /* Seed with some values */
    for (i = 1; i < 255; i++) {
        do {
            x = rand() % DUNGEON_X;
            y = rand() % DUNGEON_Y;
        } while (hardness[y][x]);
        hardness[y][x] = i;
        if (i == 1) {
            head = tail = malloc(sizeof (*tail));
        } else {
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
        }
        tail->next = NULL;
        tail->x = x;
        tail->y = y;
    }
    
#ifdef DUMP_HARDNESS_IMAGES
    out = fopen("seeded.pgm", "w");
    fprintf(out, "P5\n%u %u\n255\n", DUNGEON_X, DUNGEON_Y);
    fwrite(&hardness, sizeof (hardness), 1, out);
    fclose(out);
#endif
    
    /* Diffuse the vaules to fill the space */
    while (head) {
        x = head->x;
        y = head->y;
        i = hardness[y][x];
        
        if (x - 1 >= 0 && y - 1 >= 0 && !hardness[y - 1][x - 1]) {
            hardness[y - 1][x - 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x - 1;
            tail->y = y - 1;
        }
        if (x - 1 >= 0 && !hardness[y][x - 1]) {
            hardness[y][x - 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x - 1;
            tail->y = y;
        }
        if (x - 1 >= 0 && y + 1 < DUNGEON_Y && !hardness[y + 1][x - 1]) {
            hardness[y + 1][x - 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x - 1;
            tail->y = y + 1;
        }
        if (y - 1 >= 0 && !hardness[y - 1][x]) {
            hardness[y - 1][x] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x;
            tail->y = y - 1;
        }
        if (y + 1 < DUNGEON_Y && !hardness[y + 1][x]) {
            hardness[y + 1][x] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x;
            tail->y = y + 1;
        }
        if (x + 1 < DUNGEON_X && y - 1 >= 0 && !hardness[y - 1][x + 1]) {
            hardness[y - 1][x + 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x + 1;
            tail->y = y - 1;
        }
        if (x + 1 < DUNGEON_X && !hardness[y][x + 1]) {
            hardness[y][x + 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x + 1;
            tail->y = y;
        }
        if (x + 1 < DUNGEON_X && y + 1 < DUNGEON_Y && !hardness[y + 1][x + 1]) {
            hardness[y + 1][x + 1] = i;
            tail->next = malloc(sizeof (*tail));
            tail = tail->next;
            tail->next = NULL;
            tail->x = x + 1;
            tail->y = y + 1;
        }
        
        tmp = head;
        head = head->next;
        free(tmp);
    }
    
    /* And smooth it a bit with a gaussian convolution */
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            for (s = t = p = 0; p < 5; p++) {
                for (q = 0; q < 5; q++) {
                    if (y + (p - 2) >= 0 && y + (p - 2) < DUNGEON_Y &&
                        x + (q - 2) >= 0 && x + (q - 2) < DUNGEON_X) {
                        s += gaussian[p][q];
                        t += hardness[y + (p - 2)][x + (q - 2)] * gaussian[p][q];
                    }
                }
            }
            d->hardness[y][x] = t / s;
        }
    }
    
#ifdef DUMP_HARDNESS_IMAGES
    out = fopen("diffused.pgm", "w");
    fprintf(out, "P5\n%u %u\n255\n", DUNGEON_X, DUNGEON_Y);
    fwrite(&hardness, sizeof (hardness), 1, out);
    fclose(out);
    
    out = fopen("smoothed.pgm", "w");
    fprintf(out, "P5\n%u %u\n255\n", DUNGEON_X, DUNGEON_Y);
    fwrite(&d->hardness, sizeof (d->hardness), 1, out);
    fclose(out);
#endif
    
    return 0;
}

static int empty_dungeon(dungeon_t *d)
{
    uint8_t x, y;
    
    smooth_hardness(d);
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            mapxy(x, y) = ter_wall;
            if (y == 0 || y == DUNGEON_Y - 1 ||
                x == 0 || x == DUNGEON_X - 1) {
                mapxy(x, y) = ter_wall_immutable;
                hardnessxy(x, y) = 255;
            }
        }
    }
    
    return 0;
}

static int place_rooms(dungeon_t *d)
{
    pair_t p;
    uint32_t i;
    int success;
    room_t *r;
    uint8_t hardness[DUNGEON_Y][DUNGEON_X];
    uint32_t x, y;
    
    memcpy(&hardness, &d->hardness, sizeof (hardness));
    
    for (success = 0; !success; ) {
        success = 1;
        for (i = 0; success && i < d->num_rooms; i++) {
            r = d->rooms + i;
            r->position[dim_x] = 1 + rand() % (DUNGEON_X - 2 - r->size[dim_x]);
            r->position[dim_y] = 1 + rand() % (DUNGEON_Y - 2 - r->size[dim_y]);
            for (p[dim_y] = r->position[dim_y] - 1;
                 success && p[dim_y] < r->position[dim_y] + r->size[dim_y] + 1;
                 p[dim_y]++) {
                for (p[dim_x] = r->position[dim_x] - 1;
                     success && p[dim_x] < r->position[dim_x] + r->size[dim_x] + 1;
                     p[dim_x]++) {
                    if (mappair(p) >= ter_floor) {
                        success = 0;
                        /* empty_dungeon() regenerates the hardness map, which   *
                         * is prohibitively expensive to do in a loop like this, *
                         * so instead, we'll use a copy.                         */
                        memcpy(&d->hardness, &hardness, sizeof (hardness));
                        for (y = 1; y < DUNGEON_Y - 1; y++) {
                            for (x = 1; x < DUNGEON_X - 1; x++) {
                                mapxy(x, y) = ter_wall;
                            }
                        }
                    } else if ((p[dim_y] != r->position[dim_y] - 1)              &&
                               (p[dim_y] != r->position[dim_y] + r->size[dim_y]) &&
                               (p[dim_x] != r->position[dim_x] - 1)              &&
                               (p[dim_x] != r->position[dim_x] + r->size[dim_x])) {
                        mappair(p) = ter_floor_room;
                        hardnesspair(p) = 0;
                    }
                }
            }
        }
    }
    
    return 0;
}

static int make_rooms(dungeon_t *d)
{
    uint32_t i;
    
    for (i = MIN_ROOMS; i < MAX_ROOMS && rand_under(6, 8); i++)
        ;
    
    d->num_rooms = i;
    d->rooms = malloc(sizeof (*d->rooms) * d->num_rooms);
    
    for (i = 0; i < d->num_rooms; i++) {
        d->rooms[i].size[dim_x] = ROOM_MIN_X;
        d->rooms[i].size[dim_y] = ROOM_MIN_Y;
        while (rand_under(3, 4) && d->rooms[i].size[dim_x] < ROOM_MAX_X) {
            d->rooms[i].size[dim_x]++;
        }
        while (rand_under(3, 4) && d->rooms[i].size[dim_y] < ROOM_MAX_Y) {
            d->rooms[i].size[dim_y]++;
        }
        /* Initially, every room is connected only to itself. */
        d->rooms[i].connected = i;
    }
    
    return 0;
}

int gen_dungeon(dungeon_t *d)
{
    do {
        make_rooms(d);
    } while (place_rooms(d));
    connect_rooms(d);
    
    return 0;
}

void render_dungeon(dungeon_t *d)
{
    pair_t p;
    
    for (p[dim_y] = 0; p[dim_y] < DUNGEON_Y; p[dim_y]++) {
        for (p[dim_x] = 0; p[dim_x] < DUNGEON_X; p[dim_x]++) {
            if (p[dim_x] ==  d->pc.position[dim_x] &&
                p[dim_y] ==  d->pc.position[dim_y]) {
                putchar('@');
            } else {
                switch (mappair(p)) {
                    case ter_wall:
                    case ter_wall_immutable:
                        putchar(' ');
                        break;
                    case ter_floor:
                    case ter_floor_room:
                        putchar('.');
                        break;
                    case ter_floor_hall:
                        putchar('#');
                        break;
                    case ter_debug:
                        printf("Debug character at %d, %d\n", p[dim_y], p[dim_x]);
                        putchar('*');
                        break;
                }
            }
        }
        putchar('\n');
    }
}

void delete_dungeon(dungeon_t *d)
{
    free(d->rooms);
}

void init_dungeon(dungeon_t *d)
{
    empty_dungeon(d);
}

int write_dungeon_map(dungeon_t *d, FILE *f)
{
    uint32_t x, y;
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            fwrite(&d->hardness[y][x], sizeof (unsigned char), 1, f);
        }
    }
    
    return 0;
}

int write_rooms(dungeon_t *d, FILE *f)
{
    uint32_t i;
    uint8_t p;
    
    for (i = 0; i < d->num_rooms; i++) {
        /* write order is xpos, ypos, width, height */
        p = d->rooms[i].position[dim_x];
        fwrite(&p, 1, 1, f);
        p = d->rooms[i].size[dim_x];
        fwrite(&p, 1, 1, f);
        p = d->rooms[i].position[dim_y];
        fwrite(&p, 1, 1, f);
        p = d->rooms[i].size[dim_y];
        fwrite(&p, 1, 1, f);
    }
    
    return 0;
}

uint32_t calculate_dungeon_size(dungeon_t *d)
{
    return (14 /* The semantic, version, and size */     +
            (DUNGEON_X * DUNGEON_Y) /* The hardnesses */ +
            (d->num_rooms * 4) /* Four bytes per room */);
}

int write_dungeon(dungeon_t *d)
{
    char *home;
    char *filename;
    FILE *f;
    size_t len;
    uint32_t be32;
    
    if (!(home = getenv("HOME"))) {
        fprintf(stderr, "\"HOME\" is undefined.  Using working directory.\n");
        home = ".";
    }
    
    len = (strlen(home) + strlen(SAVE_DIR) + strlen(DUNGEON_SAVE_FILE) +
           1 /* The NULL terminator */                                 +
           2 /* The slashes */);
    
    filename = malloc(len * sizeof (*filename));
    sprintf(filename, "%s/%s/", home, SAVE_DIR);
    makedirectory(filename);
    strcat(filename, DUNGEON_SAVE_FILE);
    
    if (!(f = fopen(filename, "w"))) {
        perror(filename);
        free(filename);
        
        return 1;
    }
    free(filename);
    
    /* The semantic, which is 6 bytes, 0-5 */
    fwrite(DUNGEON_SAVE_SEMANTIC, 1, strlen(DUNGEON_SAVE_SEMANTIC), f);
    
    /* The version, 4 bytes, 6-9 */
    be32 = htobe32(DUNGEON_SAVE_VERSION);
    fwrite(&be32, sizeof (be32), 1, f);
    
    /* The size of the file, 4 bytes, 10-13 */
    be32 = htobe32(calculate_dungeon_size(d));
    fwrite(&be32, sizeof (be32), 1, f);
    
    /* The dungeon map, 61440 bytes, 14-1495 */
    write_dungeon_map(d, f);
    
    /* And the rooms, num_rooms * 4 bytes, 1496-end */
    write_rooms(d, f);
    
    fclose(f);
    
    return 0;
}

int read_dungeon_map(dungeon_t *d, FILE *f)
{
    uint32_t x, y;
    
    for (y = 0; y < DUNGEON_Y; y++) {
        for (x = 0; x < DUNGEON_X; x++) {
            fread(&d->hardness[y][x], sizeof (d->hardness[y][x]), 1, f);
            if (d->hardness[y][x] == 0) {
                /* Mark it as a corridor.  We can't recognize room cells until *
                 * after we've read the room array, which we haven't done yet. */
                d->map[y][x] = ter_floor_hall;
            } else if (d->hardness[y][x] == 255) {
                d->map[y][x] = ter_wall_immutable;
            } else {
                d->map[y][x] = ter_wall;
            }
        }
    }
    
    
    return 0;
}

int read_rooms(dungeon_t *d, FILE *f)
{
    uint32_t i;
    uint32_t x, y;
    uint8_t p;
    
    for (i = 0; i < d->num_rooms; i++) {
        fread(&p, 1, 1, f);
        d->rooms[i].position[dim_x] = p;
        fread(&p, 1, 1, f);
        d->rooms[i].size[dim_x] = p;
        fread(&p, 1, 1, f);
        d->rooms[i].position[dim_y] = p;
        fread(&p, 1, 1, f);
        d->rooms[i].size[dim_y] = p;
        /* After reading each room, we need to reconstruct them in the dungeon. */
        for (y = d->rooms[i].position[dim_y];
             y < d->rooms[i].position[dim_y] + d->rooms[i].size[dim_y];
             y++) {
            for (x = d->rooms[i].position[dim_x];
                 x < d->rooms[i].position[dim_x] + d->rooms[i].size[dim_x];
                 x++) {
                mapxy(x, y) = ter_floor_room;
            }
        }
    }
    
    return 0;
}

int calculate_num_rooms(uint32_t dungeon_bytes)
{
    return ((dungeon_bytes -
             (14 /* The semantic, version, and size */       +
              (DUNGEON_X * DUNGEON_Y) /* The hardnesses */)) /
            4 /* Four bytes per room */);
}

int read_dungeon(dungeon_t *d, char *file)
{
    char semantic[6];
    uint32_t be32;
    FILE *f;
    char *home;
    size_t len;
    char *filename;
    struct stat buf;
    
    if (!file) {
        if (!(home = getenv("HOME"))) {
            fprintf(stderr, "\"HOME\" is undefined.  Using working directory.\n");
            home = ".";
        }
        
        len = (strlen(home) + strlen(SAVE_DIR) + strlen(DUNGEON_SAVE_FILE) +
               1 /* The NULL terminator */                                 +
               2 /* The slashes */);
        
        filename = malloc(len * sizeof (*filename));
        sprintf(filename, "%s/%s/%s", home, SAVE_DIR, DUNGEON_SAVE_FILE);
        
        if (!(f = fopen(filename, "r"))) {
            perror(filename);
            free(filename);
            exit(-1);
        }
        
        if (stat(filename, &buf)) {
            perror(filename);
            exit(-1);
        }
        
        free(filename);
    } else {
        if (!(f = fopen(file, "r"))) {
            perror(file);
            exit(-1);
        }
        if (stat(file, &buf)) {
            perror(file);
            exit(-1);
        }
        
    }
    
    d->num_rooms = 0;
    
    fread(semantic, sizeof(semantic), 1, f);
    if (strncmp(semantic, DUNGEON_SAVE_SEMANTIC, 6)) {
        fprintf(stderr, "Not an RLG327 save file.\n");
        exit(-1);
    }
    fread(&be32, sizeof (be32), 1, f);
    if (be32toh(be32) != 0) { /* Since we expect zero, be32toh() is a no-op. */
        fprintf(stderr, "File version mismatch.\n");
        exit(-1);
    }
    fread(&be32, sizeof (be32), 1, f);
    if (buf.st_size != be32toh(be32)) {
        fprintf(stderr, "File size mismatch.\n");
        exit(-1);
    }
    read_dungeon_map(d, f);
    d->num_rooms = calculate_num_rooms(buf.st_size);
    d->rooms = malloc(sizeof (*d->rooms) * d->num_rooms);
    read_rooms(d, f);
    
    fclose(f);
    
    return 0;
}

int read_pgm(dungeon_t *d, char *pgm)
{
    FILE *f;
    char s[80];
    uint8_t gm[19][78];
    uint32_t x, y;
    uint32_t i;
    
    if (!(f = fopen(pgm, "r"))) {
        perror(pgm);
        exit(-1);
    }
    
    if (!fgets(s, 80, f) || strncmp(s, "P5", 2)) {
        fprintf(stderr, "Expected P5\n");
        exit(-1);
    }
    if (!fgets(s, 80, f)) {
        fprintf(stderr, "Expected comment\n");
        exit(-1);
    }
    if (!fgets(s, 80, f) || strncmp(s, "78 19", 5)) {
        fprintf(stderr, "Expected 78\n");
        exit(-1);
    }
    if (!fgets(s, 80, f) || strncmp(s, "255", 2)) {
        fprintf(stderr, "Expected 255\n");
        exit(-1);
    }
    
    fread(gm, 1, 19 * 78, f);
    
    fclose(f);
    
    /* In our gray map, treat black (0) as corridor, white (255) as room, *
     * all other values as a hardness.  For simplicity, treat every white *
     * cell as its own room, so we have to count white after reading the  *
     * image in order to allocate the room array.                         */
    for (d->num_rooms = 0, y = 0; y < 19; y++) {
        for (x = 0; x < 78; x++) {
            if (!gm[y][x]) {
                d->num_rooms++;
            }
        }
    }
    d->rooms = malloc(sizeof (*d->rooms) * d->num_rooms);
    
    for (i = 0, y = 0; y < 19; y++) {
        for (x = 0; x < 78; x++) {
            if (!gm[y][x]) {
                d->rooms[i].position[dim_x] = x + 1;
                d->rooms[i].position[dim_y] = y + 1;
                d->rooms[i].size[dim_x] = 1;
                d->rooms[i].size[dim_y] = 1;
                i++;
                d->map[y + 1][x + 1] = ter_floor_room;
                d->hardness[y + 1][x + 1] = 0;
            } else if (gm[y][x] == 255) {
                d->map[y + 1][x + 1] = ter_floor_hall;
                d->hardness[y + 1][x + 1] = 0;
            } else {
                d->map[y + 1][x + 1] = ter_wall;
                d->hardness[y + 1][x + 1] = gm[y][x];
            }
        }
    }
    
    for (x = 0; x < 80; x++) {
        d->map[0][x] = ter_wall_immutable;
        d->hardness[0][x] = 255;
        d->map[20][x] = ter_wall_immutable;
        d->hardness[20][x] = 255;
    }
    for (y = 1; y < 20; y++) {
        d->map[y][0] = ter_wall_immutable;
        d->hardness[y][0] = 255;
        d->map[y][79] = ter_wall_immutable;
        d->hardness[y][79] = 255;
    }
    
    return 0;
}

static char distance_to_char[] = "0123456789abcdefghijklmnopqrstuvwxyz"
"ABCDEFGHIJKLMNOPQRSTUVWXYZ";

void render_distance_map(dungeon_t *d)
{
    pair_t p;
    
    for (p[dim_y] = 0; p[dim_y] < DUNGEON_Y; p[dim_y]++) {
        for (p[dim_x] = 0; p[dim_x] < DUNGEON_X; p[dim_x]++) {
            switch (mappair(p)) {
                case ter_wall:
                case ter_wall_immutable:
                    putchar(' ');
                    break;
                case ter_floor:
                case ter_floor_room:
                    if (d->pc_distance[p[dim_y]][p[dim_x]] < 62) {
                        putchar(distance_to_char[d->pc_distance[p[dim_y]][p[dim_x]]]);
                    } else {
                        putchar('.');
                    }
                    break;
                case ter_floor_hall:
                    if (d->pc_distance[p[dim_y]][p[dim_x]] < 62) {
                        putchar(distance_to_char[d->pc_distance[p[dim_y]][p[dim_x]]]);
                    } else {
                        putchar('#');
                    }
                    break;
                case ter_debug:
                    printf("Debug character at %d, %d\n", p[dim_y], p[dim_x]);
                    putchar('*');
                    break;
            }
        }
        putchar('\n');
    }
}

void render_tunnel_distance_map(dungeon_t *d)
{
    pair_t p;
    
    for (p[dim_y] = 0; p[dim_y] < DUNGEON_Y; p[dim_y]++) {
        for (p[dim_x] = 0; p[dim_x] < DUNGEON_X; p[dim_x]++) {
            switch (mappair(p)) {
                case ter_wall:
                case ter_wall_immutable:
                    if (d->pc_tunnel[p[dim_y]][p[dim_x]] < 62) {
                        putchar(distance_to_char[d->pc_tunnel[p[dim_y]][p[dim_x]]]);
                    } else {
                        putchar(' ');
                    }
                    break;
                case ter_floor:
                case ter_floor_room:
                    if (d->pc_tunnel[p[dim_y]][p[dim_x]] < 62) {
                        putchar(distance_to_char[d->pc_tunnel[p[dim_y]][p[dim_x]]]);
                    } else {
                        putchar('.');
                    }
                    break;
                case ter_floor_hall:
                    if (d->pc_tunnel[p[dim_y]][p[dim_x]] < 62) {
                        putchar(distance_to_char[d->pc_tunnel[p[dim_y]][p[dim_x]]]);
                    } else {
                        putchar('#');
                    }
                    break;
                case ter_debug:
                    printf("Debug character at %d, %d\n", p[dim_y], p[dim_x]);
                    putchar('*');
                    break;
            }
        }
        putchar('\n');
    }
}


uint32_t pc_is_alive = 1;
uint32_t num_monsters = 0;

int32_t evnt_cmp( const void *e1, const void *e2){
    event2_t *ev1 = (event2_t*) e1;
    event2_t *ev2 = (event2_t*) e2;
    if(ev1->right - ev2->right == 0){
        return ev1->c->seq - ev2->c->seq;
    }
    return ev1->right - ev2->right;
}
void heapify (heap_t *heap, event2_t *e){
    heap_insert(heap, e);
}
void gen_event(chartr_t *c, heap_t *heap){
    event2_t *event = malloc(sizeof(*event));
    event->right = chartr;
    event->right = 0;
    event->c = c;
    heapify (heap, event);
}
void character_gen (dungeon_t *d, numpc_t *npc, heap_t *h){
    chartr_t *c = malloc(sizeof(*c));
    c->x = rand()%78 + 1;
    c->y = rand()%19 + 1;
    c->seq = d->seq;
    d->seq = d->seq +1;
    while(d->hardness[c->y][c->x] != 0 || d->mapofc[c->y][c->x] != NULL){
        c->x = rand()%78 + 1;
        c->y = rand()%19 + 1;
    }
    d->mapofc[c->y][c->x]= c;
    c->spd = rand()%16 + 5;
    char syms[16] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
    c->sybl = syms[npc->bit];
    c->up = 1;
    c->pc_q = 0;
    c->numpc = npc;
    gen_event(c, h);
}
void numPC_creator (dungeon_t *d, heap_t *h){
    numpc_t *npc = malloc(sizeof(*npc));
    npc->bit = rand() % 16;
    npc->x_pos = d->pc.position[dim_x];
    npc->y_pos = d->pc.position[dim_y];
    npc->x_used = 0;
    npc->y_used = 0;
    character_gen (d,npc, h);
}
void mon_creater (dungeon_t *d, heap_t *h){
    int i;
    for(i = 0; i < d->nummon; i++){
        numPC_creator (d, h);
    }
}
void pc_generator (dungeon_t *d, heap_t *h){
    play_t *player = malloc(sizeof(*player));
    chartr_t *c = malloc(sizeof(*c));
    c->play =  player;
    c->sybl = '@';
    c->up = 1;
    c->pc_q = 1;
    c->seq = 0;
    c->x = d->pc.position[dim_x];
    c->y = d->pc.position[dim_y];
    d->mapofc[c->y][c->x]= c;
    c->spd = 10;
    gen_event(c, h);
}
void pc_event(event2_t *e){
    free(e->c->play);
    free(e->c);
    free(e);
}
void npc_event(event2_t *e){
    free(e->c->numpc);
    free(e->c);
    free(e);
}
void stop (dungeon_t *d, heap_t *h){
    event2_t *e = heap_remove_min(h);
    while(e != NULL){
        if(e->c->pc_q == 1){
            pc_event(e);
            pc_is_alive = 0;
        }
        else{
            npc_event(e);
            num_monsters--;
        }
        e = heap_remove_min(h);
    }
}
void pcp_event (dungeon_t *d, heap_t *h, event2_t *e){
    if(e->c->up == 0){
        pc_event(e);
        stop (d,h);
        pc_is_alive = 0;
    }
    else{
        e->right += 100/e->c->spd;
        heap_insert(h, e);
        render_dungeon(d);
        // sleep(.25);
    }
    render_dungeon(d);
}
int rand_move_pc (dungeon_t *d, chartr_t *c){
    int err;
    int random;
    err = 0;
    random = rand() %8;
    while(err ==0){
        if(4 & c->numpc->bit){
            if(random == 0 && (c->x -1)>0 && (c->x -1)<79  && (c->y -1)>0 && (c->y -1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 1 && (c->y -1)>0 && (c->y -1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 2 && (c->x +1)>0 && (c->x +1)<79  && (c->y -1)>0 && (c->y -1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 3 && (c->x -1)>0 && (c->x -1)<79 ){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 4 && (c->x +1)>0 && (c->x +1)<79 ){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 5 && (c->x -1)>0 && (c->x -1)<79  && (c->y +1)>0 && (c->y +1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 6  && (c->y +1)>0 && (c->y +1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 7 && (c->x +1)>0 && (c->x +1)<79  && (c->y +1)>0 && (c->y +1)<20){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            random = rand()%8;
        }
        else{
            if(random == 0 && (c->x -1)>0 && (c->x -1)<79  && (c->y -1)>0 && (c->y -1)<20 && d->hardness[c->y -1][c->x -1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 1 && (c->y -1)>0 && (c->y -1)<20 && d->hardness[c->y -1][c->x] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 2 && (c->x +1)>0 && (c->x +1)<79  && (c->y -1)>0 && (c->y -1)<20 && d->hardness[c->y -1][c->x +1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                c->y -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 3 && (c->x -1)>0 && (c->x -1)<79 && d->hardness[c->y ][c->x -1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 4 && (c->x +1)>0 && (c->x +1)<79 && d->hardness[c->y ][c->x +1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                if(d->mapofc[c->y][c->x] != NULL)
                {
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 5 && (c->x -1)>0 && (c->x -1)<79  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y +1][c->x - 1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x -= 1;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up= 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 6  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y +1][c->x] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            if(random == 7 && (c->x +1)>0 && (c->x +1)<79  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y +1][c->x +1] == 0){
                d->mapofc[c->y][c->x] = NULL;
                c->x += 1;
                c->y += 1;
                if(d->mapofc[c->y][c->x] != NULL){
                    d->mapofc[c->y][c->x]->up = 0;
                }
                d->mapofc[c->y][c->x] = c;
                err = 1;
            }
            random = rand()%8;
        }
    }
    return random;
}
int can_see_pc(dungeon_t *d, chartr_t *c){
    int i;
    for (i = 0; i < d->num_rooms; i++) {
        if ((c->x >= d->rooms[i].position[dim_x]) &&
            (c->x < (d->rooms[i].position[dim_x] + d->rooms[i].size[dim_x])) &&
            (c->y >= d->rooms[i].position[dim_y]) &&
            (c->y < (d->rooms[i].position[dim_y] + d->rooms[i].size[dim_y]))
            && (d->pc.position[dim_x] >= d->rooms[i].position[dim_x]) &&
            (d->pc.position[dim_x] < (d->rooms[i].position[dim_x] + d->rooms[i].size[dim_x])) &&
            (d->pc.position[dim_y] >= d->rooms[i].position[dim_y]) &&
            (d->pc.position[dim_y] < (d->rooms[i].position[dim_y] + d->rooms[i].size[dim_y]))) {
            c->numpc->x_used = d->pc.position[dim_x];
            c->numpc->y_used = d->pc.position[dim_y];
            return 1;
        }
    }
    return 0;
}

int move_long_line (dungeon_t *d, chartr_t *c){
    int x_cor;
    int y_cor;
    x_cor = d->pc.position[dim_x] - c->x;
    y_cor = d->pc.position[dim_y] - c->y;
    if(x_cor < 0 && y_cor <0 && d->hardness[c->y -1][c->x -1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor == 0 && y_cor <0 && d->hardness[c->y-1][c->x] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL)
        {
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor <0 && d->hardness[c->y-1][c->x + 1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor < 0 && y_cor == 0 && d->hardness[c->y][c->x - 1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor == 0 && d->hardness[c->y][c->x + 1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor < 0 && y_cor < 0 && d->hardness[c->y -1][c->x - 1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor == 0 && y_cor < 0 && d->hardness[c->y -1][c->x] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor < 0 && d->hardness[c->y -1][c->x +1] == 0){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    return x_cor;
}
int move_long_line_tun (dungeon_t *d, chartr_t *c)
{
    int x_cor;
    int y_cor;
    x_cor = d->pc.position[dim_x] - c->x;
    y_cor = d->pc.position[dim_y] - c->y;
    if(x_cor < 0 && y_cor <0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor == 0 && y_cor <0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor <0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor < 0 && y_cor == 0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor == 0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        if(d->mapofc[c->y][c->x] != NULL) {
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor < 0 && y_cor < 0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x -= 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor == 0 && y_cor < 0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    if(x_cor > 0 && y_cor < 0 ){
        d->mapofc[c->y][c->x] = NULL;
        c->x += 1;
        c->y -= 1;
        if(d->mapofc[c->y][c->x] != NULL){
            d->mapofc[c->y][c->x]->up = 0;
        }
        d->mapofc[c->y][c->x] = c;
    }
    return x_cor;
}
int move_untun (dungeon_t *d, chartr_t *c){
    int err;
    int random;
    err = 0;
    random = rand() %8;
    while(err ==0)
    {
        if(random == 0 && (c->x -1)>0 && (c->x -1)<79  && (c->y -1)>0 && (c->y -1)<20 &&  d->hardness[c->y-1][c->x -1] == 0 && d->pc_tunnel[c->y -1][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 1 && (c->y -1)>0 && (c->y -1)<20 && d->hardness[c->y-1][c->x] == 0 && d->pc_tunnel[c->y -1][c->x] < d->pc_tunnel[c->y-1][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 2 && (c->x +1)>0 && (c->x +1)<79  && (c->y -1)>0 && (c->y -1)<20 && d->hardness[c->y -1][c->x +1] == 0 && d->pc_tunnel[c->y -1][c->x +1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 3 && (c->x -1)>0 && (c->x -1)<79 && d->hardness[c->y ][c->x - 1] == 0 && d->pc_tunnel[c->y][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 4 && (c->x +1)>0 && (c->x +1)<79 && d->hardness[c->y][c->x +1] == 0 && d->pc_tunnel[c->y][c->x +1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 5 && (c->x -1)>0 && (c->x -1)<79  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y + 1][c->x - 1] == 0 && d->pc_tunnel[c->y + 1][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 6  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y +1][c->x] == 0 && d->pc_tunnel[c->y + 1][c->x] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 7 && (c->x +1)>0 && (c->x +1)<79  && (c->y +1)>0 && (c->y +1)<20 && d->hardness[c->y +1][c->x +1] == 0 && d->pc_tunnel[c->y + 1][c->x+1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        random = rand()%8;
    }
    return random;
}
int move_tun (dungeon_t *d, chartr_t *c)
{
    int err;
    int random;
    err = 0;
    random = rand() %8;
    while(err ==0)
    {
        if(random == 0 && (c->x -1)>0 && (c->x -1)<79  && (c->y -1)>0 && (c->y -1)<20 && d->pc_tunnel[c->y -1][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 1 && (c->y -1)>0 && (c->y -1)<20  && d->pc_tunnel[c->y -1][c->x] < d->pc_tunnel[c->y-1][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 2 && (c->x +1)>0 && (c->x +1)<79  && (c->y -1)>0 && (c->y -1)<20  && d->pc_tunnel[c->y -1][c->x +1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            c->y -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 3 && (c->x -1)>0 && (c->x -1)<79  && d->pc_tunnel[c->y][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 4 && (c->x +1)>0 && (c->x +1)<79  && d->pc_tunnel[c->y][c->x +1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 5 && (c->x -1)>0 && (c->x -1)<79  && (c->y +1)>0 && (c->y +1)<20  && d->pc_tunnel[c->y + 1][c->x -1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x -= 1;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 6  && (c->y +1)>0 && (c->y +1)<20  && d->pc_tunnel[c->y + 1][c->x] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        if(random == 7 && (c->x +1)>0 && (c->x +1)<79  && (c->y +1)>0 && (c->y +1)<20  && d->pc_tunnel[c->y + 1][c->x+1] < d->pc_tunnel[c->y][c->x])
        {
            d->mapofc[c->y][c->x] = NULL;
            c->x += 1;
            c->y += 1;
            if(d->mapofc[c->y][c->x] != NULL)
            {
                d->mapofc[c->y][c->x]->up = 0;
            }
            d->mapofc[c->y][c->x] = c;
            err = 1;
        }
        random = rand()%8;
    }
    return random;
}
//erratic
int move_char_PC(dungeon_t *d, chartr_t *c)
{
    if(8 & c->numpc->bit)
    {
        int i;
        i = rand()%2;
        if(i == 1)
        {
            return rand_move_pc (d,c);
        }
    }
    if(!(4 & c->numpc->bit) && !(2 & c->numpc->bit) && !(1 & c->numpc->bit))
    {
        int can_see;
        can_see = can_see_pc(d,c);
        if(can_see == 1)
        {
            return move_long_line (d,c);
        }
        else
        {
            return 0;
        }
    }
    if(!(4 & c->numpc->bit) && !(2 & c->numpc->bit) && (1 & c->numpc->bit))
    {
        int can_see;
        can_see = can_see_pc(d,c);
        if(can_see == 1)
        {
            return move_untun (d,c);
        }
        else
        {
            return 0;
        }
    }
    if((4 & c->numpc->bit) && !(2 & c->numpc->bit) && (1 & c->numpc->bit))
    {
        int can_see;
        can_see = can_see_pc(d,c);
        if(can_see == 1)
        {
            return move_tun (d,c);
        }
        else
        {
            return 0;
        }
    } //telepathic
    
    if(!(4 & c->numpc->bit) && (2 & c->numpc->bit) && !(1 & c->numpc->bit))
    {
        return move_long_line (d,c);
        
    }
    if(!(4 & c->numpc->bit) && (2 & c->numpc->bit) && (1 & c->numpc->bit))
    {
        return move_untun (d,c);
        
    }
    if((4 & c->numpc->bit) && !(2 & c->numpc->bit) && !(1 & c->numpc->bit))
    {
        int can_see;
        can_see = can_see_pc(d,c);
        if(can_see == 1)
        {
            return move_long_line_tun(d,c);
        }
        else
        {
            return 0;
        }
        
    }
    if((4 & c->numpc->bit) && (2 & c->numpc->bit) && !(1 & c->numpc->bit))
    {
        return move_long_line_tun(d,c);
    }
    if((4 & c->numpc->bit) && (2 & c->numpc->bit) && (1 & c->numpc->bit))
    {
        return move_tun (d,c);
    }
    return -1;
}

void mon_event (dungeon_t *d, heap_t *h, event2_t *e)
{
    if(e->c->up == 0)
    {
        d->mapofc[e->c->y][e->c->x] = NULL;
        npc_event(e);
        num_monsters--;
    }
    else
    {
        e->right += 100/e->c->spd;
        e->c->numpc->x_pos = d->pc.position[dim_x];
        e->c->numpc->y_pos = d->pc.position[dim_y];
        if(d->hardness[e->c->y][e->c->x] != 0)
        {
            if(d->hardness[e->c->y][e->c->x] - 85 < 0)
            {
                d->hardness[e->c->y][e->c->x] = 0;
            }
            else
            {
                d->hardness[e->c->y][e->c->x] -= 85;
            }
        }
        else
        {
            move_char_PC(d, e->c);
        }
        heap_insert(h, e);
    }
}

void monster_die(dungeon_t *d,heap_t *h, event2_t *e)
{
    d->mapofc[e->c->y][e->c->x] = NULL;
    npc_event(e);
    num_monsters--;
}

void game_pre (dungeon_t *d, heap_t *h)
{
    event2_t *e = heap_remove_min(h);
    if(e == NULL)
    {
        printf("Error\n");
    }
    if(e->c->up == 1)
    {
        if(e->c->pc_q ==1)
        {
            pcp_event (d,h,e);
        }
        else
        {
            mon_event(d,h,e);
        }
    }
    else
    {
        if(e->c->pc_q ==1)
        {
            pc_event(e);
            stop (d,h);
        }
        else
        {
            monster_die(d,h,e);
        }
    }
}

void run_simulation(dungeon_t *d)
{
    heap_t heap;
    d->seq = 1;
    num_monsters = d->nummon;
    printf("Heap\n");
    heap_init(&heap, evnt_cmp, NULL);
    mon_creater(d, &heap);
    printf("Monsters\n");
    pc_generator (d, &heap);
    printf("PC\n");
    render_dungeon(d);
    printf("Dungeon\n");
    
    while(pc_is_alive !=0 && num_monsters > 0)
    {
        printf("numOfMon = %d pc_alive = %d \n", num_monsters, pc_is_alive);
        game_pre (d, &heap);
    }
    
    printf("Game\n");
    stop (d,&heap);
    printf("Game over\n");
}


