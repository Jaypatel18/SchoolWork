#include <stdlib.h>

#include "utils.h"
#include "npc.h"
#include "pc.h"
#include "dungeon.h"
#include "character.h"
#include "descriptions.h"
#include "move.h"
#include "path.h"
#include "event.h"
#include "instance.h"

using namespace std;

void monster_inst (dungeon_t *d, npc *m)
{
   int start, end;
   end = d -> monster_descriptions.size();
   start = rand_range(1,end - 1);

   m -> name = d->monster_descriptions[start].name;
   m -> desc = d -> monster_descriptions[start].description;
   m -> symbol = d->monster_descriptions[start].symbol;
   m -> color = d->monster_descriptions[start].color[0];
   m -> abilities = d->monster_descriptions[start].abilities;
   m -> speed = d->monster_descriptions[start].speed.roll();
   m -> hitpoint = d->monster_descriptions[start].hitpoints.roll();
   m -> damage = d->monster_descriptions[start].damage;
}

object::object(object_description &od)
{
   int list [] = {'*', '|', ')', '}', '[', ']', '(', '{', '\\', '=', '"' , '_', '~', '?', '!', '$', '/', ',', '-', '%', '&'};
   name = od.get_name();
   description = od.get_description();
   symbol = list[od.get_type()];
   color = od.get_color();
   hit = od.get_hit().roll();
   dodge = od.get_dodge().roll();
   defence = od.get_defence().roll();
   weight = od.get_weight().roll();
   speed = od.get_speed().roll();
   attribute = od.get_attribute().roll();
   value = od.get_value().roll();
   damage = od.get_damage(); 
   position[dim_x] = rand_range(1,79);
   position[dim_y]= rand_range(1,20);

}

void init_object(dungeon_t *d)
{
   int i;
	int index;
   //memset(d->obj2, 0, sizeof(d->obj2));
   for(i = 0 ; i < 11 ; i++)
    {
	 index = rand_range(0,d->object_descriptions.size()-1);
         //cout << object_description.size() <<endl;
         object *one;
	 one  = new object(d->object_descriptions[index]);
	 while(d->hardness[one->position[dim_y]][one->position[dim_x]] != 0 && !d->obj2[one->position[dim_y]][one->position[dim_x]])
	 {
		one->position[dim_x] = rand_range(1,79);
   		one->position[dim_y]= rand_range(1,20);
	 }
	   d->obj2[one->position[dim_y]][one->position[dim_x]] = one;
    }
}

/*
void freeze (dungeon_t *d)
{
   int a,b;
   for(b = d-> thepc ->position[dim_y]-3; b < d->thepc ->position[dim_y]+3; b++)
{
for(a = d-> thepc ->position[dim_y]-3; a < d->thepc ->position[dim_x]+3; a++) 
{
   if(d->obj2[b][a])
{
   d->map2[b][a] = '!';	
}

}	
}
}
*/

int remove_obj (dungeon_t *d)
{
  int x, y;
  for (y = 0; y < DUNGEON_Y; y++) {
    for (x = 0; x < DUNGEON_X; x++) {
      if(d->obj2[y][x])
	{
	  delete(d->obj2[y][x]);
	}
   }
  }
	return 0;
}

   

