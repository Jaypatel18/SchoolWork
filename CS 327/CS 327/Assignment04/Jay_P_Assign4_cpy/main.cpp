//  main.cpp
//  Assignment04
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.

/**
 This is the main for testing snd types which includes sndinfo, sndmix and sndcat through command line arugment.
 havent done any testing for other sndfiles since I have not done that yet.
 */
#include <iostream>
#include "all.hpp"
//#include "snd.hpp"
#include <string>
#include <vector>

using namespace std;

int main(int argc, const char * argv[])
{
    string switc ="";
    vector<string> fn;
    fn.clear();
    string prg;
    int i = 0;
    string answer = "";
    vector<float> mux;
    mux.clear();
    string pp = argv[1];
    string small;
    string fns = "";
    
    if(argc == 2)
    {
        getline (std:: cin, fns);
        sndinfo(fns);
    }
    
    else
    {
        
        switc = argv [2];
        
            if(switc.compare("-h")==0)
            {
                switches("sndinfo");
            }
            else
            {
                for(i = 2; i < argc ;i ++)
                {
                    fns = argv[i];
                    sndinfo(fns);
                }
            }
    }
    
};
