//
//  sndmix.cpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//


/**
    In this program we have to reads sound files that are passed in as arguments and mixes in to a single file.
 */
#include "all.hpp"
#include <vector>
#include <string>


void sndmix(vector <string> fileNo, vector<float>second, snd *files)
{
    
    float nonPer = 0;
    int bd = 0;
    int big = 1;
    int small = 1;
    int k = 1;
    int l = 1;
    string *pointers;
    vector<float> point;
    vector<snd *> newFile;
    long no = fileNo.size();
    long noD = 0;
    pointers = fileNo.data();
    
    /**
        In here I am checking for all types of samples using for loop so that it 
        will check and show the error is there is any.
     */
    
    for(k = 0 ; k <no; k++)
    {
        newFile.push_back(new class snd);
        newFile[k] -> rd(fileNo[k]);
    }
    
    /**
        checking for lens of sound
     */
    for(int k =1; k< no; k++)
    {
        if(newFile [k-1] -> lenofSnd() != newFile[k] -> lenofSnd())
        {
            cerr << "Incorrect Length of the sound! Check it again!" <<endl;
            exit(1);
        }
    }
    /**
        Checking for sample rate
     */
    for(int k= 1; k <no; k++)
    {
        if(newFile[k-1] -> getSamRate() != newFile[k] -> getSamRate())
        {
            cerr<< "Incorrect SampleRate! Check it again!" <<endl;
            exit(1);
        }
    }
    /**
        Checking for number of channels
     */
    for(k = 1; k<no ; k++)
    {
        if(newFile[k-1] -> getNumCha() != newFile[k] -> getNumCha())
        {
            cerr << "Incorrect Channels! Check it again!" <<endl;
            exit(1);
        }
    }
    /**
        Checking for file type
     */
    for(int k =1 ; k <no;k++)
    {
        if(newFile[k-1] -> getFileTyp() != newFile[k] -> getFileTyp())
        {
            cerr<< "Incorrect file type! Check it again!" <<endl;
            exit(1);
        }
    }
    /**
        Checkinf for num of samples
     */
    for(int k =1 ; k <no; k++)
    {
        if(newFile[k-1] -> getNumSamp() != newFile[k] -> getNumSamp())
        {
            cerr<< "Incorrect NumSamples! Check it again!" <<endl;
            exit(1);
        }
    }
    
    /**
        Checking for bit depth
     */
    for(k = 0; k <no;k++)
    {
        if(newFile[k] -> getBitDepth() > bd)
        {
            bd = newFile[k] -> getBitDepth();
        }
    }
     /**
      This will help for the output
      */
    files -> setFileNam(".cs229");
    files -> setFileTyp(newFile[0] -> getFileTyp());
    files -> setSamRate(newFile[0] -> getSamRate());
    files -> setNumCha(newFile[0] -> getNumCha());
    files -> setNumSamp(newFile[0] -> getNumSamp());
    files -> setlenofSnd(newFile[0] -> lenofSnd());
    files -> setBitDepth(bd);
    
    
    /**
        This will check if it is bigger or smaller than usual
     */
    for(k =1 ; k < bd; k++)
    {
        big *= 2;
    }
    small-- ;
    small = 0 - big;
    
    noD = newFile[0] -> pickData().size();

    
    for(k = 0 ; k < noD; k++)
    {
        for(l = 1; l< second.size() ; l++)
        {
            nonPer = nonPer + ((newFile[l] -> pickData())[k] * second[l]);
        }
        
        /**
            Checking if they are smaller than the temp and if it is then it is 
            initilizing to it and similar to the larger one
         */
        
        if(nonPer < small) {nonPer = small;}
        else if(nonPer > big) {nonPer = big;}
        point.push_back(nonPer);
        
    }
    files -> setDat(point);
    for(k = 0 ; k < newFile.size(); k++)
    {
        delete newFile[k];
    }
    
}