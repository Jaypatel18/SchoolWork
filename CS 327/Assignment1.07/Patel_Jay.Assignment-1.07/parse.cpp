#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include "character.h"
#include "heap.h"
#include "npc.h"
#include "pc.h"
#include "dungeon.h"
#include "dice.h"
#include "parse.h"
#include "monster.h"

using namespace std;

int parseFile(string fileName)
{
  // ifstream file;
  string line = "";
  Dice hp, speed, dam;
  string nLine, name, desc, color;
  char symbol[100];
  char sym;
  int base,dice,sides;
  int num;
  char spd[100];
  char *flag;
  string symb;
  

  string fp = getenv("HOME");
  fp += "//rlg327//tt2.txt";
  ifstream file(fp.c_str());
 
  file.open(fileName.c_str(), ios::in);
  
  if(file.is_open())
    {
     
      while(getline(file,line))
	{
	  while(!file.eof())
	    {
	      
	    if(1)
	    {
	      getline(file,line);
	    }
	    
	  if(line  == "RLG327 MONSTER DESCRIPTION 1")
	    {
	       cout << line <<endl;
	       continue;
	       
	    }
	  
	  else if (line == "BEGIN MONSTER")
	    {
	      continue;
	    }
	  
	  else if(line.substr(0,4)  == "NAME")
	    {
	     cout << line.substr(5) <<endl;
	      name = line.substr(5);
	      continue;
	    }
	  
	  else if(line.substr(0,4)  == "SYMB")
	    {
	      //cout <<line.substr(5) <<endl;
	      //symb = line.substr(5);
	      strcpy(symbol,line.substr(5).c_str());
 	      
	      sym = symbol[0];
             cout << sym <<endl;
	      continue;
	    }
	  
	  else if(line.substr(0,5) == "COLOR")
	    {
	      int temp = 0;
	      cout <<line.substr(6, line.length()) <<endl;
	      vector <int> nums;
	      string str = line.substr(6);
	      istringstream sp(str);
	      while (sp) {
	      string tok;
	      sp >> tok;
	      if(tok == "BLACK"){temp = 1;}
	      else if (tok == "RED") {temp = 2;}
	      else if (tok == "GREEN") {temp = 3;}
	      else if (tok == "YELLOW") {temp = 4;}
	      else if (tok == "BLUE") {temp = 5;}
	      else if (tok == "MAGENTA") {temp = 6;}
	      else if (tok == "CYAN") {temp = 7;}
	      else if (tok == "WHITE") {temp = 8;}
              else if(!tok.empty()){temp = -1;}
              nums.push_back(temp);
	      
		}
 	      cout << temp <<endl;
	      continue;
	    }
	  
	  else if(line.substr(0,4) == "DESC")
	    {
	      nLine = "";
	      while(line != ".")
		{
		  
		  getline(file,line);
		  if(line != ".")
		    {
		      nLine = nLine + line + " ";
		    }	  
		}
	      
	      cout << nLine << endl;
	      desc = nLine;
	      continue;
	    }
	  
	  else if(line.substr(0,5) == "SPEED")
	    {
	      int a;
	       num = 0;
	      cout <<line.substr(6) <<endl;
	      strcpy(spd,line.substr(6).c_str());
	      flag = strtok(spd, " +d");
	      
	      while(flag != NULL)
		{
		  a = atoi(flag);
		  num++;
		    if(num == 1)
		    {
		      base = a;
		      cout << base << "base" <<endl;
		    }
		    else if(num == 2)
		      {
			dice = a;
			cout <<dice << "dice"<<endl;
			
		      }
		    else if(num == 3)
		      {
			sides = a;
			cout <<sides << "sides" <<endl;
		      }
		  cout << a << endl;
		  
		  flag = strtok (NULL, " +,d");
		}
	        speed = Dice(base,dice,sides);
	      continue;
	      
	    }
	 
	  else if(line.substr(0,3) == "DAM")
	    {
	      int b;
	       num = 0;
	      cout <<line.substr(4) <<endl;
	      strcpy(spd,line.substr(3).c_str());
	      flag = strtok(spd, " +d");
	      
	      while(flag != NULL)
		{
		  b = atoi(flag);
		  num++;
		    if(num == 1)
		    {
		      base = b;
		      cout << base << "base" <<endl;
		    }
		    else if(num == 2)
		      {
			dice = b;
			cout <<dice << "dice"<<endl;
			
		      }
		    else if(num == 3)
		      {
			sides = b;
			cout <<sides << "sides" <<endl;
		      }
		 
		  cout << b << endl;
		  flag = strtok (NULL, " +,d");
		}
	    dam = Dice(base,dice,sides);
	      continue;
	    }
	  
	  else if(line.substr(0,2) == "HP")
	    {
	      int c;
	      num = 0;
	      cout <<line.substr(3) <<endl;
	      strcpy(spd,line.substr(3).c_str());
	      flag = strtok(spd, " +d");
	      
	      while(flag != NULL)
		{
		  c = atoi(flag);
		  num++;
		    if(num == 1)
		    {
		      base = c;
		      cout << base << "base" <<endl;
		    }
		    else if(num == 2)
		      {
			dice = c;
			cout <<dice << "dice"<<endl;
			
		      }
		    else if(num == 3)
		      {
			sides = c;
			cout <<sides << "sides" <<endl;
		      }

		  cout << c << endl;
		  flag = strtok (NULL, " +,d");
		}
	       hp = Dice(base,dice,sides);
	      continue;
	    }
	  
	  else if(line.substr(0,4) == "ABIL")
	    {
	      int temp = 0;
	      vector <int> nums;
	      string str = line.substr(5);
	      istringstream sp(str);
	      while (sp) {
	      string tok;
	      
	      sp >> tok;
	      if(tok == "SMART"){temp += 2;}
	      else if (tok == "TELE") {temp += 4;}
	      else if (tok == "TUNNEL") {temp += 8;}
	      else if (tok == "ERRATIC") {temp += 16;}
	      else if (tok == "PASS") {temp += 32;}
              else if(!tok.empty()){temp = -1;}
	      
              nums.push_back(temp);
	    }
              string store;
	      if (temp & 1 <<1) {store += "SMART ";}
	      if (temp & 1 <<2) {store += "TELE ";}
	      if (temp & 1 <<3) {store += "TUNNEL ";}
	      if (temp & 1 <<4) {store += "ERRATIC ";}
	      if (temp & 1 <<5) {store += "PASS ";}
	      cout <<line.substr(5) <<endl;
	      cout <<store <<endl;
	      continue;
	    }
	  
	  else
	  {
	    break;
	  }
       }

	    cout << "\n" <<endl;
	  
     }
   }
  return 0;
}


