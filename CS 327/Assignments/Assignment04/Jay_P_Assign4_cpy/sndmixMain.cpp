//
//  sndmixMain.cpp
//  temp
//
//  Created by Jay Patel on 12/29/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

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
    string answer = "";
    vector<float> mux;
    mux.clear();
    string pp = argv[1];
    string small;
    string fns = "";
    snd *ans = new class snd;
    float muxi;



        // checking for sndmix and its switches
    
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
    };
