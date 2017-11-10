#ifndef PC_H
#define PC_H

#include "character.h"
#include "item.h"
#include <vector>

class PC : public Character
{
	public:
		PC();
		~PC();
		//	Item *equipment[NUM_EQUIPMENT];
		//	Item *inventory[NUM_INVENTORY];

		NPC *attacking; // currently attacking

		char *seenDungeon;
			
		void clearSeenDungeon();
		
		inline char *getSeenDungeon() { return seenDungeon; }
	
		void setLocation(int x, int y);
	
		int getSpeed();

		int getTotalDam();

		int getTotalDamRanged();

		int getTotalDef();

		int hpmax(); // hpmax plus item hit bonus

		Item* tools [12];
		vector <Item *> inventory;
};

extern PC *pc;

#endif












