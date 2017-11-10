#include <stdio.h>
#include <stdlib.h>

#include "dice.h"

ostream& operator<<(ostream& os, Dice &dice)
{
	os << dice.base << "+"
		<< dice.dice << "d"
		<< dice.side;
	return os;
}

Dice::~Dice()
{
}

Dice *Dice::parseDice(string &s)
{
	// TODO
	return NULL;
}

int Dice::roll()
{
	// TODO	
	return 0;
}
