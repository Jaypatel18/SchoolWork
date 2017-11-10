#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include "character.h"
#include "heap.h"
#include "npc.h"
#include "pc.h"
#include "dungeon.h"
#include "parse.h"
#include "monster.h"
#include "dice.h"


Dice::Dice(int base, int dice, int sides)
{
  this->base = base;
  this->dice = dice;
  this->sides = sides;
}

int Dice::get_value_base()
{
  return base;
}

int Dice::get_value_dice()
{
  return dice;
}

int Dice::get_value_sides()
{
  return sides;
}

