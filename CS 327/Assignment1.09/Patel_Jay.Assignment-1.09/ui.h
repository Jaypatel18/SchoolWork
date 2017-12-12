#ifndef UI_H
#define UI_H

class UI
{
	private:
		static int printEquipmentSlots();

		static int selectNPC(NPC *);
		
	public:
		static int initColors();
		
		/* display a help page when -h is specified */
		static int help();

		static int clearRow(int row);
		static int reprint();

		static int iList();
	        static int oDesc();
		static int mList();
		static int oList();
		static int sList(); // spell list
		static int wearItem();
	        static int eList();
		static int tItem();
		static int dropList();
		static int perDel();

		static int printHP();
		static int printMP();

		static int printMonsterHP();
		static int printMonsterHP(NPC *);

		static int selectTarget();
};

#endif