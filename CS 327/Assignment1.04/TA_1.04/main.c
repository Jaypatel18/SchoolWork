#include "core.h"
#include "corridor.h"
#include "character.h"
#include "debug.h"
#include "dungeon.h"
#include "move.h"
#include "room.h"
#include "turn.h"
#include "dijkstra.h"

int pcx = 0; // 0 means unset
int pcy = 0; // 0 means unset

int cheat = 0;

Character *pc;
Character *npcs[1<<10];

char unify = 0;

unsigned int seed = 0;

int sight = 0;

int nummon = 10;
int nummonmax = 255;

int main(int argc, char** argv)
{
	char *home = getenv("HOME");

	// make ~/.rlg327 directory
	char dirpath[strlen(home) + strlen("/.rlg327") + 1];
	sprintf(dirpath, "%s/.rlg327", home);
	mkdir(dirpath, S_IRUSR | S_IWUSR | S_IXUSR);

	// ~/.rlg327/dungeon
	char filepath[strlen(home) + strlen("/.rlg327/dungeon") + 1];
	sprintf(filepath, "%s/.rlg327/dungeon", home);

	int i;

	/* options */
	if (argc > 1)
	{
		for (i=1; i<argc; i++)
		{
			if (!strcmp("--debug", argv[i]))
			{
				debug = 1;
			}
			else if (!strcmp("--load", argv[i]))
			{
				if (i+1<argc && argv[i+1][0]!='-')
					loadp = argv[++i];
				else
					loadp = filepath;
			}
			else if (!strcmp("--save", argv[i]))
			{
				if (i+1<argc && argv[i+1][0]!='-')
					savep = argv[++i];
				else
					savep = filepath;
			}
			else if (!strcmp("--nummon", argv[i]))
			{
				if (i+1<argc && argv[i+1][0]!='-')
				{
					nummon = atoi(argv[++i]);

					if (nummon > nummonmax)
					{
						fprintf(stderr, "nummon should not exceed %d\n",
								nummonmax);
						return 1;
					}
				}
				else
				{
					fprintf(stderr, "usage: rlg327 --nummon <number>\n");
					return 1;
				}
			}
			else if (!strcmp("--cheat", argv[i]))
			{
				cheat = 1;
			}
			else if (!strcmp("--pc", argv[i]))
			{
				if (i+2<argc)
				{
					pcx = atoi(argv[++i]);
					pcy = atoi(argv[++i]);
				}
				else
				{
					fprintf(stderr, "usage: rlg327 --pc <x> <y>\n");
					return 1;
				}
			}
			else if (!strcmp("--seed", argv[i]))
			{
				if (i+1<argc)
				{
					seed = atoi(argv[++i]);
				}
				else
				{
					fprintf(stderr, "usage: rlg327 --seed <seed>\n");
					return 1;
				}
			}
			else if (!strcmp("--sight", argv[i]))
			{
				sight = 1;
			}
			else if (!strcmp("--unify", argv[i]))
			{
				if (i+1<argc && argv[i+1][0]!='-')
				{
					unify = argv[++i][0];

					if (!(('0' <= unify && unify <= '9')
								||('a' <= unify && unify <= 'f')))
					{
						fprintf(stderr, "monster must be 0-9 a-f\n");
						return 1;
					}
				}
				else
				{
					fprintf(stderr, "usage: rlg327 --unify <monster>\n");
					return 1;
				}
			}
			// undefined option
			else
			{
				fprintf(stderr, "option %s is undefined.\n", argv[i]);
				fprintf(stderr, "see available options using -h switch.\n");
				return 1;
			}
		}
	}

	if (!seed) 
		// if seed is unset
		srand(seed = time(NULL));
	else 
		// seed is set by -s option
		srand(seed);

	debug_log("debug: seed: %d\n", seed);
	debug_log("debug: save path: %s\n", savep);
	debug_log("debug: load path: %s\n", loadp);

	if (loadp)
		dungeon_load();
	else
		dungeon_generate();

	pc = character_new(1);	

	// place PC	
	if (!pcx && !pcy) {
		character_place(pc); // randomly place if unset
	} else {
		pc->x = pcx;
		pc->y = pcy;

		cmap[pcy][pcx] = pc;
	}

	// init turn heap
	turn_init();
	// insert PC into turn heap
	turn_insert(pc);

	// create monsters and insert them into turn heap
	for (i=0; i<nummon; i++) {
		npcs[i] = character_new(0);
		character_place(npcs[i]);
		turn_insert(npcs[i]);
	}

	// unify all monsters to one type
	if (unify) {
		// unify characteristics
		char unifyc = unify >= 'a' ? unify - 'a' + 10 : unify - '0'; 
		for (i=0; i<nummon; i++)
			npcs[i]->c = unifyc;
	}

	// game simulation
	while (1) {
		dungeon_print();

		if (pc->dead || !nummon)
			break; // end of game

		usleep(100000);
		
		// move PC AI
		move_pc();

		// move monsters
		while (1) {
			Character *c = turn_extract();

			if (c->dead) {
				character_delete(c);
				continue;
			}

			turn_insert(c);

			if (ISPC(c)) {
				break; // break on PC turn
			} else {
				move_npc(c);
				if (pc->dead)
					break;
			}
		} // end of monsters turn
	} // end of game simulation

	turn_delete();

	if (savep)
		dungeon_save();

	for (i = 0; i < nummon; i++)
		free(npcs[i]);

	free(pc);

	return 0;
}

