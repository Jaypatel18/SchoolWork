#ifndef DICE_H
# define DICE_H

#include <string>

class Dice
{
 private:
  int base;
  int dice;
  int sides;

 public:
  Dice(int base,int dice, int sides);
  int get_value_base();
  int get_value_dice();
  int get_value_sides();

  Dice(){};
};

#endif
