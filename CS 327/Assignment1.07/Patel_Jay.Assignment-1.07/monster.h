#ifndef MONSTER_H
# define MONSTER_H

#include <string>
#include "dice.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

class Monster 
{
        public:
	
	string name;
	string symb;
	string color;
	string desc;
	Dice speed;
	Dice hp;
	Dice dam;
	int ability;

	Monster(string name, string symb, string color, string desc, Dice speed, Dice hp, Dice dam, int ability);

	Monster() {};

	
};

#endif
