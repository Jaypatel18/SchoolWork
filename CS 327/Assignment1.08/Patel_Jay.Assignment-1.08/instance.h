#ifndef INSTANCE_H
# define INSTANCE_H

# include <stdint.h>
# include <iostream>
# include <stdint.h>
# include "descriptions.h"
#include "npc.h"
# include <vector>
# include <string>
# include "dice.h"

using namespace std;

class mon{
 public:
  string name;
  string description;
  uint32_t color;
  uint32_t abilities;
  uint32_t speed;
  uint32_t hitspeed;
  dice damage;
  char symbol;
 
};

class obj{
 public:
  string name;
  string description;
  object_type_t type;
  uint32_t color;
  uint32_t  hit;
  dice  damage;
  uint32_t dodge;
  uint32_t defence;
  uint32_t weight;
  uint32_t speed;
  uint32_t attrubute;
  uint32_t value;
};

class object{
public:
  std::string name, description;
  char symbol;
  uint32_t color;
  int hit, dodge, defence, weight, speed, attribute, value;
  dice damage; 
  pair_t position;
  object() {};

  object(object_description &od);
	
};

void init_object(dungeon_t *d);
int remove_obj(dungeon_t *d);

//void freeze (dungeon_t *d);
void monster_inst (dungeon_t *d, npc *m);

#endif
