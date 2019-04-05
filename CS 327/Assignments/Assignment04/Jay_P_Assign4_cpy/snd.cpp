//  sndinfo.cpp
//  Assignment4
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//  10 points

/**
 
 This program reads all sound files passed as arguments, and for each one, displays the
 following.
 file name
 file type
 bit depth
 number of channels
 number of samples
 length of the sound (in seconds)
 
*/

#include <vector>
#include "snd.hpp"
#include "all.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cctype>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

using namespace std;

/**
    This are all the functions that I am going to use through out, I also have sndinfo in this one since it was
    related to what I am doing in here.
    I am bascially setting each one of them into a variable that I have made in snd.hpp
 
 */

/**
 
    I am basically setting all those with my private variables
 
 */
void snd:: setFileNam(std::string a)   // setting filename to the parameter that will be passed in
{
    fileNam = a;
}

string snd:: getFileNam() // setting the file name to the varibale that I have made
{
    return fileNam;
}

void snd:: setFileTyp(std::string a)
{
    fileTyp = a;
}

string snd:: getFileTyp()
{
    return fileTyp;
}

void snd:: setSamRate(float i)
{
    SamRate = i;
}

float snd:: getSamRate()
{
    return SamRate;
}

void snd:: setBitDepth(int i)
{
    BitDepth = i;
}
int snd:: getBitDepth()
{
    return BitDepth;
}

void snd:: setNumCha(int i)
{
    NumCha = i;
}

int snd:: getNumCha()
{
    return NumCha;
}

void snd:: setNumSamp(float i)
{
    NumSamp = i;
}

float snd:: getNumSamp()
{
    return NumSamp;
}


/**
    This will read my file and alos output the corresponding sample
 */

void snd:: rd(string a)
{
    int small = 1;
    int big = 1;
    //std::string nonPer;
    string nonPer2;
    float dat = 0;
    sec = 0;
    string val = "";
    string type;
    //string type2;
   // int j = 0;
    int c = 0;
    SamRate = 0;
    NumCha = 0;
    NumSamp = 0;
    BitDepth = 0;
    
    std::ifstream f2(a.c_str());
    string fn = "";
    std::string length;
    //std::stringstream ss(nonPer);
    fileNam = "";
    fileTyp = "";
    newData.clear();
    /**
        Error checking
     */
    
    if(!f2.is_open())
    {
        cerr << "No File!Please check your file location again" <<endl;
        exit(1);
    }
    
    else
    {
        fileNam = a;
        setFileNam(fileNam);
        
        if(f2.good())
        {
            f2 >> length;
        
            fileTyp = flip(length);
            setFileTyp("."+fileTyp); // what type is it
        }
        /*
            Loops until the file is good and if it is then it will check for the first letter of ith index and checks for the following # " " and if it meets there it will skip it and move on to the next.
         */
        while(f2.good())
        {
            istringstream kk(length);
            std :: getline(f2, length);
            int j = 0;
            if(length[j])
            {
                if(length[0] == ' ')
                {
                    continue;
                }
                
                else if(length[0] == '#') // looking for #
                {
                    continue;
                }
                istringstream kk(length);
                std :: string nonPer;
                getline(kk, nonPer, ' '); // checking for space
               string type2 = flip(nonPer);
                
                
                /**
                    This will also check for the sample rate and check for the same error handling
                 */
                 if(type2.compare("samplerate") == 0)
                {
                    getline(kk, nonPer, ' ');
                    if(nonPer.empty() == true)
                    {
                        getline(kk, nonPer, ' ');
                    }
                    else
                    {
                        std :: stringstream kk (nonPer);
                        kk >> SamRate;
                        setSamRate(SamRate);
                    }
                }
                
            
                 else if(type2.compare("bitres") == 0)
                 {
                     getline(kk, nonPer, ' ');
                     if(nonPer.empty() == true)
                     {
                         getline(kk, nonPer, ' ');
                     }
                     else
                     {
                         std::stringstream kk(nonPer);
                         kk >> BitDepth;
                         setBitDepth(BitDepth);
                     }
                     
                     if(BitDepth != 8 && BitDepth!= 16 && BitDepth  != 32)
                     {
                         exit(1);
                     }
                     for(int i = 0 ; i < BitDepth ; i++)
                     {
                         big = big * 2;
                     }
                     big--;
                     small = 0 - big;
                     
                 }
                 else if(type2.compare("samples") == 0)
                {
                    getline(kk, nonPer, ' ');
                    if(nonPer.empty() == true)
                    {
                        getline(kk, nonPer, ' ');
                    }
                    else
                    {
                        std:: stringstream kk (nonPer);
                        kk >> NumCha;
                        setNumSamp(NumSamp);
                    }
                }
              
                
                else if(type2.compare("channels") == 0) {
                    getline(kk, nonPer, ' ');
                    if(nonPer.empty() == true)
                    {
                        getline(kk, nonPer, ' ');
                    }
                    else{
                        if( (NumCha < 0) || (NumCha > 128) )
                        {
                            exit(1);
                        }
                        std:: stringstream kk (nonPer);
                        kk >> NumCha;
                        setNumCha(NumCha);
                    }
                }
                
                else if(type2.compare("startdata") == 0)
                {
                    break;
                }
                
                else{
                    cerr << "Wrong Type" <<endl;
                    exit(1);
                }
            }
            
        }
        /**
            This will check for the numbers that are mention in bit depth and in this case its 8 and then move on to sampleRate which is 7 and move on like that for the next one.
         */
        if(BitDepth == 0 || SamRate == 0 || NumCha == 0)
        {
            cerr << "Wrong File, Please check again!" <<endl;
            exit(1);
        }
        newData.clear();
        
        /**
            Checking for the same as we did before
         */
        
        while (f2.good())
        {
            c++;
            std:: getline(f2, length);
            istringstream kk(length);
            string nonPer = "";
            
            for(int i = 0; i < NumCha; i++)
            {
                getline(kk, nonPer, ' ');
                std:: stringstream kk (nonPer);
                kk >> dat;
                if (dat < small || dat > big)
                {
                    exit(1);
                }
                newData.push_back(dat);
            }
            
        }
        setDat(newData);
        if(NumSamp != 0 && c != NumSamp)
        {
            exit(1);
        }
        setNumSamp(c);
        sec = NumSamp / SamRate;
        setlenofSnd(sec);
        f2.close();
    }
}
/**
    Setting the same for these as well.
 */
void snd :: setlenofSnd(float l)
{
    sec = l;
}

float snd:: lenofSnd()
{
    return sec;
}

void snd:: setDat(std::vector <float> k)
{
    newData = k;
}

vector<float> snd:: pickData()
{
    return newData;
}

/**
 
    This will print all the samples that are mentioned in the document in different order
*/

void sndinfo (string fileName)
{
    snd *f = new class snd;
    f -> rd(fileName);
    cout << "File Type" << f -> getFileTyp() << endl;
    cout << "Number of samples " << f -> getNumSamp() <<endl;
    cout << "Bit Depth " << f -> getBitDepth() <<endl;
    cout << "Length of sound " << f -> lenofSnd() <<endl;
    cout << "Number of channels " << f -> getNumCha() <<endl;
    cout << "Sample Rate "  <<f -> getSamRate() <<endl;
    cout << "File Name " << f -> getFileNam() <<endl;
    
    delete f;
    
}
