#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include "character.h"
#include "heap.h"
#include "npc.h"
#include "pc.h"
#include "dungeon.h"
#include "dice.h"
#include "monster.h"


Monster::Monster(string name, string symb, string color, string desc, Dice speed, Dice hp, Dice dam, int ability)
{
  this->name = name;
  this->symb = symb;
  this->color = color;
  this->desc = desc;
  this->speed = speed;
  this->hp = hp;
  this->dam = dam;
  this->ability = ability;
  
}
