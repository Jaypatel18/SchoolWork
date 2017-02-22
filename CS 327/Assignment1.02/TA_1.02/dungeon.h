#ifndef DUNGEON_H
#define DUNGEON_H

/* terrain */
char tmap[DUNG_H][DUNG_W];

/* hardness */
unsigned char hmap[DUNG_H][DUNG_W];

/* print dungeon */
int dungeon_print();

/* generate random dungeon */
int dungeon_generate();

/* load dungeon using --load <file> */
int dungeon_load();

/* save dungeon using --save <file> */
int dungeon_save();

#endif

