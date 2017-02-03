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
    snd *ans = new class snd;
    float muxi;

    if(argc == 1)
    {
        cout <<"Low parameters" <<endl;
        exit(1);
    }
    
    else
    {
        prg = argv[1];
        small = flip(prg);
        
    }
    
    if(small.compare("sndinfo") == 0)  // check for sndifo and its switches
    {
        if (argc == 2)
        {
            getline(std::cin, fns);
            sndinfo(fns);
        }
        else
        {
            switc = argv[2];
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
    }
    else if (small.compare("sndmix") == 0)
        // checking for sndmix and its switches
    {
        if(argc == 2)
        {
            cout << "Low Parameters" <<endl;
            exit(1);
        }
        else
        {
            switc = argv[2];
            if(switc.compare("-h") == 0)
            {
                
                    switches("sndmix");
                
            }
            else if( switc.compare("-o") == 0)
            {
                if(argc < 8)
                {
                    cout << "Low Parameters" <<endl;
                    exit(1);
                }
                else
                {
                    answer = argv [3];
                    switc = argv [4];
                    if(switc.compare("-w") == 0)
                    {
                        
                    }
                    else
                    {
                        for( int i  = 3; i < argc ; i ++)
                        {
                            fn.push_back(argv[i++]);
                            istringstream kk(argv[i]);
                            
                            kk >> muxi;
                            mux.push_back(muxi);
                            
                        }
                        sndmix(fn, mux, ans);
                        output(ans, answer);
                        
                        delete ans;
                    }
                }
            }
            else if (switc.compare("-w") == 0)
            {
                cerr << "This is for wav files" <<endl;
            }
            else
            {
                if (argc < 6)
                {
                    cerr <<"Low parameters" <<endl;
                    exit(1);
                }
                for(int i =2 ; i < argc ; i++)
                {
                    fn.push_back(argv[i++]);
                    istringstream kk(argv[i]);
                    kk >> muxi;
                    mux.push_back(muxi);
                }
                sndmix(fn, mux, ans);
                output(ans, "NFN");
                delete ans;
            }
        }
    }

    else if (small.compare("sndcat") == 0) // checking for sndcat and its some of the switches
    {
        if(argc == 2)
        {
            cout << "Low parameters" <<endl;
            exit(1);
        }
        else
        {
            switc = argv[2];
            answer = "NFN";
            if(switc.compare("-h") == 0)
            {
                switches("sndcat");
                
            }
            else if(switc.compare("-o") == 0)
            {
                answer = argv[3];
                for(i = 4; i < argc ; i++)
                {
                    fn.push_back(argv[i]);
                }
               sndcat(fn,ans);
               output(ans,answer);
                delete ans;
                
            }
//            else if (switc.compare("-w")== 0)
//            {
//                cout << "Extra Credit" <<endl;
//            }
            else {
                if (argc == 3)
            {
                cout << "Low Parameters" <<endl;
                exit(1);
                
            }
           
            for(int i = 2; i < argc ; i ++)
            {
                fn.push_back(argv[i]);
                
            }
           sndcat(fn, ans);
           output(ans,"NFN");
            delete ans;
            
        }
        
    }
    
}


};