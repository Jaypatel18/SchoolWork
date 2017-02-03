#include <stdlib.h>

#include <iostream>
#include <sstream>

#include "debug.h"
#include "monsterfactory.h"
#include "parser.h"

using namespace std;

MonsterFactory *MonsterFactory::next(istream &is)
{
	MonsterFactory *mf = new MonsterFactory;
	// TODO
	return mf;	
}

ostream& operator<<(ostream& os, MonsterFactory &mf)
{
	os << mf.name  << endl;
	os << mf.desc  << endl;
	os << mf.symb  << endl;
	os << mf.color << endl;
	os << mf.speed << endl;
	os << mf.abil  << endl;
	os << mf.hp    << endl;
	os << mf.dam   << endl;
	return os;
}
