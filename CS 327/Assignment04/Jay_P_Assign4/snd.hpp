//
//  snd.hpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//
/**
    This is the header file that I have for my snd.cpp, in this class all I have is all the varibales that I will be using in my snd.cpp
 */
#ifndef snd_hpp
#define snd_hpp

#include <stdio.h>
#include <string>
#include "snd.hpp"
#include <vector>
#include "snd.hpp"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cctype>
#include <stdio.h>
#include <stdlib.h>


class snd

{
    
public:
    
    void rd(std::string a);
    
    float lenofSnd();
    
    void setlenofSnd(float l);
    
    void setFileNam(std::string a);
    
    std::string getFileNam();
    
    void setFileTyp(std::string a);
    
    std::string getFileTyp();
    
    void setSamRate(float i);
    
    float getSamRate();
    
    void setBitDepth(int i);
    
    int getBitDepth();
    
    void setNumCha(int i);
    
    int getNumCha();
    
    void setNumSamp(float i);
    
    float getNumSamp();
    
    void sndFile(std::string a);
    
    std::vector<float> pickData();
    
    void initilizeData(std::vector <float> k);
    
    void setDat(std::vector<float>);
    
    
private:
    
    std::string fileNam;
    
    std::string fileTyp;
    
    float SamRate;
    
    int BitDepth;
    
    int NumCha;
    
    int NumSamp;
    
    int data;
    
    float sec;
    
    int numOfNewSamples;
    
    std::vector<float> newData;
    
};


#endif /* snd_hpp */
