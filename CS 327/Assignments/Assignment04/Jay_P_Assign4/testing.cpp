//
//  testing.cpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

/**
    In here all the data is covered in the snd. cpp and I made this to print the data either in console of the output file.
    Apart from this I think there is a minor issue in this one and thats why I am not getting a correct output for startdata in sndmix and sndcat.
    In this statements I am doing the same like for bit depth, getsample rate , getnum of channels.
 
 */

#include "all.hpp"
#include <string>

using namespace std;

void output (snd *f, string fn)
{
    int l = 0, k =0 , m =0;
    float *point = (float *) malloc(sizeof(float));
    
    if(fn.compare("NFN") == 0)
    {
        if ((f -> getFileTyp()).compare(".cs229") == 0)
        {
            cout <<"This is for .cs229" <<endl;
            cout <<"This are the bit rates" << f-> getBitDepth() << endl;
            cout <<"This are the sample rates" << f-> getSamRate() <<endl;
            cout <<"This are the number of sampples"  << f-> getNumSamp() <<endl;
            
            cout <<"This are the number of channels" << f-> getNumCha() <<endl;
            cout <<"Starting Data" <<endl;
            
            for(l =0 ; l < (f -> getNumSamp()); l++)
            {
                for(k =0; k< (f-> getNumCha()); k++)
                {
                    if(k != (f -> getNumCha() -1))
                    {
                        cout << (f -> pickData()) [m++];
                    }
                    
                }
                if(l != (f -> getNumSamp() - 1))
                {
                    continue;
                }
                cout << endl;
            }

        }
        // for .wav and .abc229 I havent dont yet
    }
    
    else {
        if ((f -> getFileTyp()).compare(".cs229") == 0)
        {
            cout <<"This is .cs229" <<endl;
            cout <<"This are the bit rates" << f-> getBitDepth() << endl;
            cout <<"This are the sample rates" << f-> getSamRate() <<endl;
            cout <<"This are the number of sampples"  << f-> getNumSamp() <<endl;
            
            cout <<"This are the number of channels" << f-> getNumCha() <<endl;
            cout <<"Starting Date" <<endl;
            
            point = f -> pickData().data();
            
            for(l =0 ; l < (f -> getNumSamp()); l++)
            {
                
                for(k =0; k< (f-> getNumCha()); k++)
                {
                    if(k != (f -> getNumCha() -1))
                    {
                        cout << (f -> pickData()) [m++] << " ";
                    }
                    
                    
                }
                cout << endl;
                // for .wav and .abc229 I havent done yet
            }
            
        }
    }

    }

