#include <ncurses.h>
#include <stdlib.h>
#include <string.h>

#include <algorithm>

#include "core.h"
#include "character.h"
#include "debug.h"
#include "dungeon.h"
#include "move.h"
#include "npc.h"
#include "objectfactory.h"
#include "pc.h"
#include "ui.h"

static void getPositionStr(char buf[50], Character *c)
{
	int i;
	for(i=0; i<50; i++) buf[i]=' ';

	int cx, cy, pcx, pcy;
	c->getLocation(&cx, &cy);
	pc->getLocation(&pcx, &pcy);

	int dx = cx - pcx;
	int dy = cy - pcy;

	if (dx>0)
		sprintf(buf + 2, "%02d E   ",  dx);
	else
		sprintf(buf + 2, "%02d W   ", -dx);
	if (dx==0)
		sprintf(buf + 2, "00   ");
	if (dy>0)
		sprintf(buf + 8, "%02d S   ",  dy);
	else
		sprintf(buf + 8, "%02d N   ", -dy);
	if (dy==0)
		sprintf(buf + 8, "00   ");
}

static int compareNPC(const void *a, const void *b)
{
	int ax, ay, bx, by, pcx, pcy;

	(*(Character **)a)->getLocation(&ax, &ay);
	(*(Character **)b)->getLocation(&bx, &by);
	pc->getLocation(&pcx, &pcy);

	return (ABS((ax-pcx))+ABS((ay-pcy)))
		- (ABS((bx-pcx))+ABS((by-pcy)));
}

int UI::help()
{
	FILE* fp = fopen("README", "r");

	if (!fp) {
		fprintf(stderr, "README not found\n");
		return -1;
	}

	// ncurses stuff
	initscr();
	start_color();
	raw();
	noecho();
	curs_set(0);
	keypad(stdscr, TRUE);

	int r = 0, c = 0;
	char buffer[255][80];
	while(fgets(buffer[r++], 80, fp));
	fclose(fp);

	int rmax = r;

	int from = 0;

	while(1) {
		clear();

		char tmp[80];
		char *p;

		for (r=0; r<22; r++) {
			p = tmp;

			for (c=0; c<80; c++) {
				if ('\t'==buffer[from+r][c]) {
					sprintf(p, "    ");
					p+=4;
				}
				else *p++ = buffer[from+r][c];
			}
			mvprintw(r, 0, "%s", tmp);
		}

		int color;
		init_pair(color = 9, COLOR_GREEN, COLOR_BLACK);

		attron(COLOR_PAIR(color));

		mvprintw(24-1, 0, 
				"Use arrow keys to scroll up and down. Press Q to quit.");

		attroff(COLOR_PAIR(color));

		refresh();

		int ch = getch();
		if (ch=='Q' || ch=='q') break;
		if (ch==KEY_DOWN) 
			if (from+22<rmax) 
				from++;
		if (ch==KEY_UP)   
			if (from>0)
				from--;
	}

	endwin();

	return 0;
}

int UI::initColors()
{
	init_pair(COLOR_PC, COLOR_RED, COLOR_YELLOW);
	// HP
	init_pair(COLOR_HP, COLOR_WHITE, COLOR_RED);
	// MP
	init_pair(COLOR_MP, COLOR_WHITE, COLOR_BLUE);
	// Frozen
	init_pair(COLOR_FROZEN, COLOR_BLACK, COLOR_CYAN);
	// Poizen
	init_pair(COLOR_POISON, COLOR_BLACK, COLOR_GREEN);

	for (int i = 0; i < 8; i++) {
		init_pair(i, i, COLOR_BLACK);
	}

	return 0;
}

static void mListFrom(int start)
{
	int i;
	char buf[50];

	int nummon = dungeon->nummon();

	mvprintw(0, 1, "Listing Monster %02d to %02d out of %02d "
			"(press ESC or Q to quit)", 
			start+1, MIN((start+21), nummon), nummon);

	std::sort(dungeon->npcv.begin(), dungeon->npcv.end(), compareNPC);

	for (i=start; i<MIN((start+21), nummon); i++) {
		Character *c = dungeon->npcv[i];
		getPositionStr(buf, c);

		mvprintw(i-start+1, 2, "  %s", buf);

		mvaddch(i-start+1, 18, ACS_VLINE);

		int color = c->getColor();

		attron(COLOR_PAIR(color));
		mvprintw(i-start+1, 2, "%c", c->getSymb());
		attroff(COLOR_PAIR(color));

	}
	int r = MIN((start+21), nummon)-start+1;
	for (int c=1; c<18; c++) {
		mvaddch(r, c, ACS_HLINE);
	}
	mvaddch(r, 18, ACS_LRCORNER);
}

static void oListFrom(int start)
{
	int i;
	char buf[50];

	int numobj = dungeon->numobj();

	mvprintw(0, 1, "Listing Object %d to %d out of %d "
			"(press ESC or Q to quit)", 
			start+1, MIN((start+21), numobj), numobj);

	for (i=start; i<MIN((start+21), numobj); i++) {
		Item *item = dungeon->itemv[i];

		sprintf(buf, "     %-12s", 
				ObjectFactory::TYPE[item->type].c_str());

		mvprintw(i-start+1, 1, "   %s", buf);

		int color = item->color;		
		attron(COLOR_PAIR(color));
		mvprintw(i-start+1, 2, "%c", item->getSymb());
		attroff(COLOR_PAIR(color));

		mvaddch(i-start+1, 18, ACS_VLINE);
	}
	int r = MIN((start+21), numobj);
	for (int c=1; c<18; c++)
		mvaddch(r, c, ACS_HLINE);
	mvaddch(r, 18, ACS_LRCORNER);
}

int UI::printEquipmentSlots()
{
	mvprintw(23, 44, "Equipment");
	
	//const char *equipment = "PC Equipment";

	int col=55;
	for (int i=0; i<12; i++) {
		mvprintw(22, col+i*2, "%c", (char) 'A'+i);

		mvprintw(23, col+i*2-1, "'");
		if(pc->tools[i])
{
		char symb = pc->tools[i]->symb;
		
		int color = i % 8;		
		attron(COLOR_PAIR(color));
		mvprintw(23, col+i*2, "%c", symb);
		attroff(COLOR_PAIR(color));
	}
}
	mvprintw(23, 78, "'");

	return 0;
}

int UI::printHP()
{
	int colored = int(16 * pc->hp/(double)pc->hpmax()+0.5);

	mvprintw(23, 1, "HP ""                ");

	char buf[50];
	sprintf(buf, "%d/%d""                ", pc->hp, pc->hpmax());
	buf[16] = 0;

	char coloredsubstr[colored + 1];
	memset(coloredsubstr, 0, sizeof(coloredsubstr));
	strncpy(coloredsubstr, buf, colored);

	attron(COLOR_PAIR(COLOR_HP));
	mvprintw(23, 4, "%s", coloredsubstr);
	attroff(COLOR_PAIR(COLOR_HP));

	if (colored < 16)
		mvprintw(23, 4 + colored, "%s", buf + colored);

	return 0;
}

int UI::printMP()
{
	int colored = int(16 * pc->mp/(double)pc->mpmax()+0.5);

	mvprintw(23, 21, "MP ""                ");

	char buf[50];
	sprintf(buf, "%d/%d""                ", pc->mp, pc->mpmax());
	buf[16] = 0;

	char coloredsubstr[colored + 1];
	memset(coloredsubstr, 0, sizeof(coloredsubstr));
	strncpy(coloredsubstr, buf, colored);

	attron(COLOR_PAIR(COLOR_MP));
	mvprintw(23, 24, "%s", coloredsubstr);
	attroff(COLOR_PAIR(COLOR_MP));

	if (colored < 16)
		mvprintw(23, 24 + colored, "%s", buf + colored);

	return 0;
}

int UI::printMonsterHP()
{
	printMonsterHP(pc->attacking);

	return 0;
}

int UI::printMonsterHP(NPC *att)
{
	if (!att) {
		clearRow(0);
		return -1;
	}

	int colored = int(16 * att->hp/(double)(att->hpmax())+0.5);

	mvprintw(0, 1, "HP ""                ");

	char buf[50];
	sprintf(buf, "%d/%d""                ", att->hp, att->hpmax());
	buf[16] = 0;

	char coloredsubstr[colored + 1];
	memset(coloredsubstr, 0, sizeof(coloredsubstr));
	strncpy(coloredsubstr, buf, colored);

	attron(COLOR_PAIR(COLOR_HP));
	mvprintw(0, 4, "%s", coloredsubstr);
	attroff(COLOR_PAIR(COLOR_HP));

	if (colored < 16)
		mvprintw(0, 4 + colored, "%s", buf + colored);

	// monster info	
	mvprintw(0, 20, " <- ");

	attron(COLOR_PAIR(att->getColor()));
	mvprintw(0, 24, "%c", att->getSymb());
	attroff(COLOR_PAIR(att->getColor()));

	mvprintw(0, 26, "targeted");

	return 0;
}

int UI::clearRow(int row)
{
	int i;
	for(i=0; i<80; i++)
		mvaddch(row, i, ' ');

	return 0;
}

int UI::reprint()
{
	dungeon->printDungeon();

	printHP();
	printMP();

	printEquipmentSlots();

	return 0;
}

int UI::mList()
{
	int from = 0;

	mListFrom(from);
	refresh();

	while (1) {
		int ch = getch();

		int quit = 0;

		switch (ch) {
			case 'Q':
			case 'q':
			case 27: // ESC
				quit = 1;
				break;
			case KEY_DOWN:
				if (from>21-nummon && from<nummon-21) from++;
				mListFrom(from);
				refresh();
				break;
			case KEY_UP:
				from = MAX((from-1), 0);
				mListFrom(from);
				refresh();
				break;
		}
		if (quit)
			break;
	}

	for (int i=0; i<80; i++) {
		mvprintw(0,  i, " ");
		mvprintw(22, i, " ");
	}

	return 0;
}

int UI::oList()
{
	int from = 0;

	oListFrom(from);
	refresh();

	while (1) {
		int ch = getch();

		int quit = 0;

		switch (ch) {
			case 'Q':
			case 'q':
			case 27: // ESC
				quit = 1;
				break;
			case KEY_DOWN:
				if (from>21-nummon && from<nummon-21) from++;
				oListFrom(from);
				refresh();
				break;
			case KEY_UP:
				from = MAX((from-1), 0);
				oListFrom(from);
				refresh();
				break;
		}
		if (quit)
			break;
	}

	clearRow(0);
	clearRow(22);

	return 0;
}

int UI::sList()
{
	int color = COLOR_CYAN;	
	attron(COLOR_PAIR(color));

	mvprintw(17, 21, "B: Blast nearby area   cost: 30  ");
	mvprintw(18, 21, "F: Frozen ball         cost: 20  ");
	mvprintw(19, 21, "H: Heal PC             cost: 10  ");
	mvprintw(20, 21, "P: Poison ball         cost: 20  ");
	mvprintw(21, 21, "T: Teleport            cost: 30  ");

	attroff(COLOR_PAIR(color));

	int ch = getch(), cost, target, npcx, npcy;

	NPC *att;

	switch (ch) {
		case 'Q':
		case 'q':
		case 27: // ESC
			break;
		case 'B':
		case 'b':
			if (pc->mp < (cost = 30))
				break;
			for (int r=pcy-1; r<=pcy+1; r++) {
				for (int c=pcx-1; c<=pcx+1; c++) {
					if (r>=0 && r<21 &&
							c>=0 && c<80 && 
							dungeon->hmap[r][c]!=IMMUTABLE) {
						if (dungeon->hmap[r][c]>0) {
							dungeon->hmap[r][c]=0;
							dungeon->tmap[r][c]=CORR;
						}
						if (dungeon->cmap[r][c]&&!
								dungeon->cmap[r][c]->isPC())
							dungeon->cmap[r][c]->hp/=10;
					}
				}
			}
			pc->mp -= cost;
			pc->setLocation(pcx, pcy); // force update seen dungeon
			dungeon->printDungeon();
			refresh();
			break;
		case 'F':
		case 'f':
			if (pc->mp < (cost = 20))
				break;
			target = selectTarget();
			if (target < 0)
				break;
			att = dungeon->vnpcv[target];

			att->getLocation(&npcx, &npcy);

			// frozen ball spell
			for (int r=npcy-1; r<=npcy+1; r++) {
				for (int c=npcx-1; c<=npcx+1; c++) {
					if (r>=0 && r<21 &&
							c>=0 && c<80 && 
							dungeon->hmap[r][c]!=IMMUTABLE) {
						if (dungeon->cmap[r][c]&&!
								dungeon->cmap[r][c]->isPC()) {
							dungeon->cmap[r][c]->frozen = 25;
						}
					}
				}
			}
			pc->mp -= cost;
			pc->setLocation(pcx, pcy); // force update seen dungeon
			dungeon->printDungeon();	
			UI::printMP();
			refresh();
		case 'H':
		case 'h':
			if (pc->mp < (cost = 10))
				break;
			pc->hp += pc->hpmax() * 0.25;
			if (pc->hp > pc->hpmax())
				pc->hp = pc->hpmax();
			pc->mp -= cost;
			UI::printHP();
			UI::printMP();
			break;
		case 'P':
		case 'p':
			if (pc->mp < (cost = 20))
				break;
			target = selectTarget();
			if (target < 0)
				break;
			att = dungeon->vnpcv[target];

			att->getLocation(&npcx, &npcy);

			// poison ball spell
			for (int r=npcy-1; r<=npcy+1; r++) {
				for (int c=npcx-1; c<=npcx+1; c++) {
					if (r>=0 && r<21 &&
							c>=0 && c<80 && 
							dungeon->hmap[r][c]!=IMMUTABLE) {
						if (dungeon->cmap[r][c]&&!
								dungeon->cmap[r][c]->isPC()) {
							dungeon->cmap[r][c]->hp*=0.9;
							dungeon->cmap[r][c]->poison = 25;
						}
					}
				}
			}
			pc->mp -= cost;
			pc->setLocation(pcx, pcy); // force update seen dungeon
			dungeon->printDungeon();	
			UI::printMP();
			refresh();
			break;
		case 'T':
		case 't':
			if (pc->mp < (cost = 30))
				break;
			while (1) {
				int r = rand() % 21;
				int c = rand() % 80;
				if (!dungeon->hmap[r][c] && !dungeon->cmap[r][c]) {
					Move::move(pc, c, r);
					break;
				}
			}
			pc->mp -= cost;
			UI::printMP();
			break;
	}

	return 0;
}

int UI::wearItem()
{
   clear();
   mvprintw(1,1,"Please enter (0-9) for carry slot number: ");
   
   int a = 0;
   while (a == 0)
{
   int j = getch();
   switch(j) 
 {
   case '0':
	if(pc->inventory.size() > 0)
	{
	 Item* it = pc->inventory.at(0);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin());
             
	}
        a = 1;
	break;

   case '1':
         if(pc->inventory.size() > 1)
	{
		Item* it = pc->inventory.at(1);
	 	int itype = it->type;
	 	pc->tools[itype] = it;
 	 	pc->inventory.erase(pc->inventory.begin() + 1);
             
	}
        a = 1;
	break;
	
   case '2':
	if(pc->inventory.size() > 2)
	{

	 Item* it = pc->inventory.at(2);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 2);
             
	}
        a = 1;
	break;

   case '3':
	if(pc->inventory.size() > 3)
	{

	 Item* it = pc->inventory.at(3);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 3);
             
	}
        a = 1;
	break;

   case '4':
	if(pc->inventory.size() > 4)
	{

	 Item* it = pc->inventory.at(4);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 4);
             
	}
        a = 1;
	break;

   case '5':
	if(pc->inventory.size() > 5)
	{

	 Item* it = pc->inventory.at(5);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 5);
             
	}
        a = 1;
	break;

   case '6':
	if(pc->inventory.size() > 6)
	{

	 Item* it = pc->inventory.at(6);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin() + 6);
             
	}
        a = 1;
	break;

   case '7':
	if(pc->inventory.size() > 7)
	{

	 Item* it = pc->inventory.at(7);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 7);
             
	}
        a = 1;
	break;

   case '8':
	if(pc->inventory.size() > '8')
	{

	 Item* it = pc->inventory.at(8);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 8);
             
	}
        a = 1;
	break;

   case '9':
	if(pc->inventory.size() > 9)
	{

	 Item* it = pc->inventory.at(9);
	 int itype = it->type;
	 pc->tools[itype] = it;
 	 pc->inventory.erase(pc->inventory.begin()+ 9);
             
	}
        a = 1;
	break;

   case 27:
   case 'Q':
   case 'q':
	clear();
	return 0;
	break;  

   default:
	break;
}
   }
return 0;

}

int UI:: tItem()
{
   clear();
   mvprintw(1,1,"Please enter (a-l) to  take off the item: ");
   int a = 0;
   while (a == 0)
{
   int j = getch();
   switch(j) {

   case 'a':
	if(pc->tools[0]){
		pc->inventory.push_back(pc->tools[0]);
		pc->tools[0] = NULL;
	}
	a =1;
	break; 

   case 'b':
	if(pc->tools[1]){
		pc->inventory.push_back(pc->tools[1]);
		pc->tools[1] = NULL;
	}
	a =1;
	break; 

   case 'c':
	if(pc->tools[2]){
		pc->inventory.push_back(pc->tools[2]);
		pc->tools[2] = NULL;
	}
	a =1;
	break; 

   case 'd':
	if(pc->tools[3]){
		pc->inventory.push_back(pc->tools[3]);
		pc->tools[3] = NULL;
	}
	a =1;
	break; 

   case 'e':
	if(pc->tools[4]){
		pc->inventory.push_back(pc->tools[4]);
		pc->tools[4] = NULL;
	}
	a =1;
	break; 

   case 'f':
	if(pc->tools[5]){
		pc->inventory.push_back(pc->tools[5]);
		pc->tools[5] = NULL;
	}
	a =1;
	break; 

   case 'g':
	if(pc->tools[6]){
		pc->inventory.push_back(pc->tools[6]);
		pc->tools[6] = NULL;
	}
	a =1;
	break; 

   case 'h':
	if(pc->tools[7]){
		pc->inventory.push_back(pc->tools[7]);
		pc->tools[7] = NULL;
	}
	a =1;
	break; 

   case 'i':
	if(pc->tools[8]){
		pc->inventory.push_back(pc->tools[8]);
		pc->tools[8] = NULL;
	}
	a =1;
	break; 

   case 'j':
	if(pc->tools[9]){
		pc->inventory.push_back(pc->tools[9]);
		pc->tools[9] = NULL;
	}
	a =1;
	break; 

   case 'k':
	if(pc->tools[10]){
		pc->inventory.push_back(pc->tools[10]);
		pc->tools[10] = NULL;
	}
	a =1;
	break; 

    case 'l':
	if(pc->tools[11]){
		pc->inventory.push_back(pc->tools[11]);
		pc->tools[11] = NULL;
	}

	a =1;
	break;
 
                case 27:
		case 'Q':
		case 'q':
			clear();
			return 0;
			a =1;
			break;

		default:
			break;	  
	 }
  
}
        
   return 0;
}




int UI::iList()
{
  clear();
  int i;
    for(i = 0; i < 10; i++)
    {
        if((int)pc->inventory.size() >= (i+1)) 
        {
	   mvprintw(1+i, 1, "Item is %s", 
	   pc->inventory.at(i)->name.c_str()); 
	}
        else
	{
	   mvprintw(1+i, 1, "Null Slot: %d", i);
	}
    }

    while(1){

    char j = getch();
    
	switch(j)
	{
		case 27:
		case 'Q':
		case 'q':
			clear();
			return 0;
			break;

		default:
			break;	  
	 }
        
   }
	
  return 0;
}


int UI:: eList()
{
    clear();
    if(pc->tools[0])
	mvprintw(1,1, "(a) [WEAPON] %s", pc->tools[0]->name.c_str());
    else 
	mvprintw(1,1,"(a) [WEAPON]");
    
    if(pc->tools[1])
	mvprintw(2,1, "(b) [OFFHAND] %s", pc->tools[1]->name.c_str());
    else 
	mvprintw(2,1,"(b) [OFFHAND]");

    if(pc->tools[2])
	mvprintw(3,1, "(c) [RANGED] %s",  pc->tools[2]->name.c_str());
    else 
	mvprintw(3,1,"(c) [RANGED]");

     if(pc->tools[3])
	mvprintw(4,1, "(d) [ARMOR] %s", pc->tools[3]->name.c_str());
    else 
	mvprintw(4,1,"(d) [ARMOR]");
 
     if(pc->tools[4])
	mvprintw(5,1, "(e) [HELMET] %s", pc->tools[4]->name.c_str());
    else 
	mvprintw(5,1,"(e) [HELMET]");

     if(pc->tools[5])
	mvprintw(6,1, "(f) [CLOAK] %s", pc->tools[5]->name.c_str());
    else 
	mvprintw(6,1,"(f) [CLOAK]");
  
    if(pc->tools[6])
	mvprintw(7,1, "(g) [GLOVES] %s", pc->tools[6]->name.c_str());
    else 
	mvprintw(7,1,"(g) [GLOVES]");

    if(pc->tools[7])
	mvprintw(8,1, "(h) [BOOTS] %s", pc->tools[7]->name.c_str());
    else 
	mvprintw(8,1,"(h) [BOOTS]");

     if(pc->tools[8])
	mvprintw(9,1, "(i) [AMULET] %s", pc->tools[8]->name.c_str());
    else 
	mvprintw(9,1,"(i) [AMULET]");

    if(pc->tools[9])
	mvprintw(10,1, "(j) [LIGHT] %s", pc->tools[9]->name.c_str());
    else 
	mvprintw(10,1,"(j) [LIGHT]");

    if(pc->tools[10])
	mvprintw(11,1, "(k) [lhs Ring] %s", pc->tools[10]->name.c_str());
    else 
	mvprintw(11,1,"(k) [lhs Ring]");

     if(pc->tools[11])
	mvprintw(12,1, "(l) [rhs Ring] %s", pc->tools[11]->name.c_str());
    else 
	mvprintw(12,1,"(l) [rhs Ring]");

    while(1){

    char j = getch();
    
	switch(j)
	{
		case 27:
		case 'Q':
		case 'q':
			clear();
			return 0;
			break;

		default:
			break;	  
	 }
        
   }
    return 0;
}

int UI:: oDesc()
{
	
  int j = getch(); 
  switch(j) {

  case '0':
	if(pc->inventory.size() > 0)
	mvprintw(2,1,pc->inventory.at(0)->desc.c_str()); 
	break;
  case '1':
	if(pc->inventory.size() > 1)
	mvprintw(2,1,pc->inventory.at(1)->desc.c_str()); 
	break;

  case '2':
	if(pc->inventory.size() > 2)
	mvprintw(2,1,pc->inventory.at(2)->desc.c_str()); 
	break;

   case '3':
        if(pc->inventory.size() > 3)
	mvprintw(2,1,pc->inventory.at(3)->desc.c_str()); 
	break;
   
   case '4':
	if(pc->inventory.size() > 4)
	mvprintw(2,1,pc->inventory.at(4)->desc.c_str()); 
	break;

   case '5':
	if(pc->inventory.size() > 5)
	mvprintw(2,1,pc->inventory.at(5)->desc.c_str()); 
	break;

   case '6':
	if(pc->inventory.size() > 6)
	mvprintw(2,1,pc->inventory.at(6)->desc.c_str()); 
	break;

   case '7':
	if(pc->inventory.size() > 7)
	mvprintw(2,1,pc->inventory.at(7)->desc.c_str()); 
	break;

   case '8':
	if(pc->inventory.size() > 8)
	mvprintw(2,1,pc->inventory.at(8)->desc.c_str()); 
	break;

   case '9':
	if(pc->inventory.size() > 9)
	mvprintw(2,1,pc->inventory.at(9)->desc.c_str()); 
	break;

 
   default:
	break;	  
	 }
   }
return 0;
}

int UI::perDel()
{
   clear();
   mvprintw(1,1,"Please choose the item (0-9) to drop: ");
   int a = 0;
   while (a == 0)
{
   int j = getch();
   switch(j) {
  case '0':
   if(pc->inventory.size() > 0){
        pc->inventory.erase(pc->inventory.begin());}
   break;
  
   case '1':
   if(pc->inventory.size() > 1){
        pc->inventory.erase(pc->inventory.begin()+1);}
   break;
  
   case '2':
   if(pc->inventory.size() > 2){
        pc->inventory.erase(pc->inventory.begin()+2);}
   break;

   case '3':
   if(pc->inventory.size() > 3){
        pc->inventory.erase(pc->inventory.begin()+3);}
   break;
   
   case '4':
   if(pc->inventory.size() > 4){
        pc->inventory.erase(pc->inventory.begin()+4);}
   break;

   case '5':
   if(pc->inventory.size() > 5){
        pc->inventory.erase(pc->inventory.begin()+5);}
   break;

   case '6':
   if(pc->inventory.size() > 6){
        pc->inventory.erase(pc->inventory.begin()+6);}
   break;

   case '7':
   if(pc->inventory.size() > 7){
        pc->inventory.erase(pc->inventory.begin()+7);}
   break;

   case '8':
   if(pc->inventory.size() > 8){
        pc->inventory.erase(pc->inventory.begin()+8);}
   break;

   case '9':
   if(pc->inventory.size() > 9){
        pc->inventory.erase(pc->inventory.begin()+9);}
        break;

                case 27:
		case 'Q':
		case 'q':
			clear();
			return 0;
			a =1;
			break;

		default:
			break;	  
	 }
  
}
        
   return 0;
}


int UI::dropList()
{
  clear();
   mvprintw(1,1,"Please choose the iteam (0-9) to drop: ");
   int a = 0;
   while (a == 0)
{
   int j = getch();
   switch(j) {
  case '0':
	if(pc->inventory.size() > 0){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(0);
        pc->inventory.erase(pc->inventory.begin());}
         a =1;
         break;

   case '1':
         if(pc->inventory.size() > 1){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(1);
        pc->inventory.erase(pc->inventory.begin()+1);}
         a =1;
         break;

   case '2':
   if(pc->inventory.size() > 2){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(2);
        pc->inventory.erase(pc->inventory.begin()+2);}
         a =1;
         break;

   case '3':
   if(pc->inventory.size() > 3){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(3);
        pc->inventory.erase(pc->inventory.begin()+3);}
         a =1;
         break;

    case '4':
    if(pc->inventory.size() > 4){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(4);
        pc->inventory.erase(pc->inventory.begin()+4);}
         a =1;
         break;

    case '5':
    if(pc->inventory.size() > 5){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(5);
        pc->inventory.erase(pc->inventory.begin()+5);}
         a =1;
         break;

    case '6':
    if(pc->inventory.size() > 6){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(6);
        pc->inventory.erase(pc->inventory.begin()+6);}
         a =1;
         break;

    case '7':
    if(pc->inventory.size() > 7){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(7);
        pc->inventory.erase(pc->inventory.begin()+7);}
         a =1;
         break;

    case '8':
    if(pc->inventory.size() > 8){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(8);
        pc->inventory.erase(pc->inventory.begin()+8);}
         a =1;
         break;
     
     case '9':
     if(pc->inventory.size() > 9){
	dungeon->imap[pc->getY()][pc->getX()] = pc->inventory.at(9);
        pc->inventory.erase(pc->inventory.begin()+9);}
         a =1;
         break;

                case 27:
		case 'Q':
		case 'q':
			clear();
			return 0;
			a =1;
			break;

		default:
			break;	  
	 }
  
}
        
   return 0;
}

int UI::selectNPC(NPC *npc)
{
	reprint();

	// mvprintw(1, 20, "  select target ");

	int x, y;
	npc->getLocation(&x, &y);

	mvprintw(y+1, x-1, "[");
	mvprintw(y+1, x+1, "]");

	printMonsterHP(npc);

	refresh();

	return 0;
}

int UI::selectTarget()
{	
	if (dungeon->vnpcv.empty())
		return -1;

	int index = 0;

	selectNPC(dungeon->vnpcv[index]);

	while (1) {
		bool quit = false;

		int ch = getch();

		switch (ch) {
			case 'Q':
			case 'q':
				quit = true;
				break;
			case ' ':
				pc->attacking = dungeon->vnpcv[index];
				return index;
			case KEY_DOWN:
			case KEY_RIGHT:
			case 'R':
			case 'r':
			case 'F':
			case 'f':
			case 'P':
			case 'p':
				index = (index + 1) 
					% (int)dungeon->vnpcv.size();
				selectNPC(dungeon->vnpcv[index]);
				break;
			case KEY_UP:
			case KEY_LEFT:
				index = (index - 1 + (int)dungeon->vnpcv.size()) 
					% (int)dungeon->vnpcv.size();
				selectNPC(dungeon->vnpcv[index]);
				break;
			default:
				break;
		}

		if (quit)
			break;
	}
	reprint();

	return -1;
}

