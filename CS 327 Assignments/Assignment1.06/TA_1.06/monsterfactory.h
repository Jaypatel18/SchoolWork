#ifndef MONSTERFACTORY_H
#define MONSTERFACTORY_H

#include <fstream>
#include <iostream>
#include <vector>

#include "dice.h"
#include "npc.h"

using namespace std;

class MonsterFactory
{	
	public:
		string name;
		string desc;
		string symb;
		string color;
		string speed;
		string abil;
		string hp;
		string dam;

		Dice *dspeed;
		Dice *dhp;
		Dice *ddam;
		
		static MonsterFactory *next(istream &is);
};

ostream &operator<<(ostream &os, MonsterFactory &);

#endif
