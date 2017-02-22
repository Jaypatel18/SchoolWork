//
//  sndcatMain.cpp
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
    int i = 0;
    string answer = "";
    vector<float> mux;
    mux.clear();
    string pp = argv[1];
    string small;
    string fns = "";
    snd *ans = new class snd;
    

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

};

