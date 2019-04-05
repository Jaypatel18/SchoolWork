//
//  all.hpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//
/**
    In here I am showing all the functions that I have used so far
 */
#ifndef all_hpp
#define all_hpp
#include "snd.hpp"
#include <fstream>
#include <string>
#include <stdlib.h>
#include <sstream>
#include <iostream>
#include <stdio.h>
#include <cctype>
#include <vector>

using namespace std;

    void sndinfo (string fileName);
    string flip (string s);
    void sndmix (vector <string> fileNo, vector<float>, snd *files);
    void sndcat (vector <string> fileNo, snd *filesZ);
    void switches (string pp);
    void output (snd *f, string fn );


#endif /* all_hpp */
