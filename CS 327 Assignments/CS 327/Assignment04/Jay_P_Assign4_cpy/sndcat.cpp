//
//  sndcat.cpp
//  Assignment4
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
// 15 points

/**
This program reads all sound files passed as arguments, and writes a single sound file that is the concatenation of the inputs. If no files are passed as arguments, then the program should read from standard input. You must support the following switches. Note that there are situations that make it hard to concatenate sound files such as ones with different numbers of channels. You must choose how to resolve these types of situations. One way here is to convert each sound to the maximum number of channels of any sound file, or simply give an error to the user.
*/


#include "all.hpp"
#include <vector>
#include <string>
#include <iostream>
#include <stdlib.h>


using namespace std;

void sndcat(vector<string> fileno, snd *filesZ)
{
    int k = 0;
    int l =0;
    std :: vector<float> point;
    std :: vector<snd *> newFile;
    point.clear();
    newFile.clear();
    float sec = 0;
    float sampl = 0;
    long len = fileno.size();
    
    for(k = 0 ; k<len;k++ )
    {
        snd *nonPer = new class snd;
        newFile.push_back(nonPer);
        newFile[k] -> rd(fileno[k]);
    }
    /**
        In this case we are checking for the samplesRate and I did the same for the others as well
     */
    
    
    for(k = 1; k < len ; k++)
    {
        if(newFile[k-1] -> getSamRate() != newFile[k] -> getSamRate())
        {
            cerr << "Incorrect SampleRate! Check again" <<endl;
            exit(1);
        }
    }
    
    filesZ -> setFileNam(".cs229");
    filesZ -> setFileTyp(newFile[0] -> getFileTyp());
    
    
    /**
        In here I am checking for len of sound
     
     */
    for(k= 0 ;k < len ; k++)
    {
        sec = sec + newFile[k] -> lenofSnd();
    }
    filesZ -> setlenofSnd(sec);
    filesZ -> setSamRate(newFile[0] -> getSamRate());
    
    /**
        In here I am checking for bit depth
     */
    for(k = 1; k < len; k++)
    {
        if(newFile[k-1] -> getBitDepth() > (newFile[k] -> getBitDepth()))
            
            filesZ -> setBitDepth(newFile[k-1] -> getBitDepth());
        
        else
        {
            filesZ -> setBitDepth(newFile[k] -> getBitDepth());
        }
    }
    
    filesZ -> setNumCha(newFile[0] -> getNumCha());
    
    
    /**
        In here I am checking for num of samples
     
     */
    for(k = 0 ; k <len ; k++)
    {
        sampl = sampl + newFile[k] -> getNumSamp();
    }
    filesZ -> setNumSamp(sampl);
   
    
    /**
        In here I am checking for num of channels
     */
    for(k = 1; k < len; k++)
    {
        if(newFile[k-1] -> getNumCha() != newFile[k] -> getNumCha())
        {
            cerr << "Incorrect Channels! Check it agian" <<endl;
            exit(1);
        }
    }
    
    
    /**
        This will help for the output and check for all those samples that I have in before
     */
    
    for(k = 0 ; k < len ; k++)
    {
        
        for(int l = 0 ; l < (newFile[k] -> pickData().size()); l++)
        {
            
            point.push_back((newFile[k] -> pickData())[l]);
        }
    }
    filesZ -> setDat(point);
    
   // newFile[k] -> pickData().clear();
    
    for (l =0; l < newFile.size(); l++)
    
    {
        newFile[l] -> pickData().clear();
        delete newFile[l];
    }
   
}

