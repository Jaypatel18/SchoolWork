//
//  flip.cpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//
/**
    I have made this to check for the checking and reading the files that was required for sndinfo since we dont know when the user will type in lower case or upper case.
    This is basically my helper method, that I can call when I need to check for the flips of the alphabets
 */

#include <iostream>
#include <fstream>
#include <string>
#include <cctype>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "all.hpp"

using namespace std;


string flip(string s)
{
    long size= s.length();
    
    for(int k = 0; k < size ; k++)
    {
        if(s[k] == 'a' || s[k] == 'A') {s[k] = 'a';}
        
        else if(s[k] == 'b' || s[k] == 'B') {s[k] = 'b';}
        
        else if(s[k] == 'c' || s[k] == 'C') {s[k] = 'c';}
        
        else if(s[k] == 'd' || s[k] == 'D') {s[k] = 'd';}
        
        else if(s[k] == 'e' || s[k] == 'E') {s[k] ='e';}
        
        else if(s[k] == 'f' || s[k] == 'F') {s[k] = 'f';}
        
        else if(s[k] == 'g' || s[k] == 'G') {s[k] = 'g';}
        
        else if (s[k] == 'h' || s[k] == 'H') {s[k] = 'h';}
        
        else if(s[k] == 'i' || s[k] == 'I') {s[k] = 'i';}
        
        else if(s[k] == 'j' || s[k] == 'J') {s[k] = 'j';}
        
        else if(s[k] == 'm' || s[k] == 'M') {s[k] = 'm';}
        
        else if(s[k] == 'k' || s[k] == 'K') {s[k] = 'k';}
        
        else if(s[k] == 'n' || s[k] == 'N') {s[k] = 'n';}
        
        else if(s[k] == 'p' || s[k] == 'P') {s[k] = 'p';}
        
        else if(s[k] == 'o' || s[k] == 'O') {s[k] = 'o';}
        
        else if(s[k] == 'q' || s[k] == 'Q') {s[k] = 'q';}
        
        else if(s[k] == 'r' || s[k] == 'R') {s[k] = 'r';}
        
        else if(s[k] == 's' || s[k] == 'S') {s[k] = 's';}
        
        else if (s[k] == 'w' || s[k] == 'W') {s[k] = 'w';}
        
        else if(s[k] == 'u' || s[k] == 'U') {s[k] = 'u';}
        
        else if(s[k] == 'z' || s[k] == 'Z') {s[k] = 'z';}
        
        else if(s[k] == 'v' || s[k] == 'V') {s[k] = 'v';}
        
        else if(s[k] == 't' || s[k] == 'T') {s[k] = 't';}
        
        else if(s[k] == 'h' || s[k] == 'H') {s[k] = 'h';}
        
        else if(s[k] == 'l' ||  s[k] == 'L') {s[k] = 'l';}
        
        else if(s[k] == 'x' || s[k] == 'X') {s[k] = 'x';}
        
        else if(s[k] == 'y' || s[k] == 'Y') {s[k] = 'y';}
        
        
        else if(s[k] >= 0 || s[k] <= 9)
        {
//            cerr << "In Range" <<endl;
//            exit(1);
        }
        // if nothing is right
        else
        {
            cerr << "Error in the flips of the alphabets" <<endl;
            exit(1);
        }
        
        
    }
    return s;
}
