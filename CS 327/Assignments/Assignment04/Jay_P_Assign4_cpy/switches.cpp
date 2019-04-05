//
//  switches.cpp
//  Assignment04
//
//  Created by Jay Patel on 11/10/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#include <vector>
#include <string>
#include "all.hpp"

using namespace std;
/**
    In here I am checking for all the switches that are required for the samples that were mentioned in the document, even though I couldnt finish all the snd types. I haven't done sndgen, and extra credit so it will just ignore that, even though I have written for thoes switches as well.
 
 */
void switches (string pp)
{
    /**
        This is going to check for sndcat and output its switches
     */
    if(pp.compare("sndcat") == 0)
    {
        cout << "Reads all sound file and mix in a single file that is concatenated \n This are the switches for sndcat" <<endl;
        cout << "-h : show the help screen" <<endl;
        cout << "-o file : specify the output file name; if omitted, write to standard output." <<endl;
        cout << "-w : optionally for bonus points output in .wav format instead of .cs229 format." <<endl;
        exit(1);
        
    }
    
    /**
        This is going to check for sndinfo and output its switches
     */
    else if (pp.compare("sndinfo")== 0)
    {
        
        cout << "Reads all sound files\n This are the switches for sndinfo" <<endl;
        cout << "THIS METHOD ONLY HAS ONE HELPER" <<endl;
        cout << "-h : show the help screen" <<endl;
        cout << "This are his corressponding features" <<endl;
        cout << "len of the sound" <<endl;
        cout << "Complete File name" <<endl;
        cout << "num of channels" <<endl;
        cout << "File Type" << endl;
        cout << "bit Depth" <<endl;
        cout << "sample rate" <<endl;
        cout << "num of samples" <<endl;

        exit(1);
        
    }
    /**
        This is going to check for sndmix and output its switches
     */
    else if(pp.compare("sndmix") == 0)
    {
        cout << "Reads all the sounds and mixes into a single file \n This are the switches for sndmix" <<endl;
        cout << "-h : show the help screen" <<endl;
        cout << "-o file : specify the output file name; if omitted, write to standard output." <<endl;
        exit(1);
    }
    /**
        This is going to check for sndgen and output its switches
     */
    else if (pp.compare("sndgen")==0)
    {
        cout << "This will produce a sound of specific frequency and waveform \n This are the switches for sndgen " <<endl;
        cout << "-h : show the help screen." <<endl;
        cout << "-o file : specify the output file name; if omitted, write to standard output." <<endl;
        cout << "--bits n: use a bit depth of n" <<endl;
        cout << "--sr n: use a sample rate of n" <<endl;
        cout << "-f r: use a frequency of r Hz" <<endl;
        cout << "-t r: total duration of r seconds" <<endl;
        cout << "-v p: Peak volume 0<=p<=1" <<endl;
        cout << "-a r: attack time of r seconds " <<endl;
        cout << "-d r: decay tme of r seconds" <<endl;
        cout << "-s r: sustain volme 0<=p<=1" <<endl;
        cout << "-- sine: generate of sine wave" <<endl;
        cout << "-- triangle: generate of traingle wave" <<endl;
        cout <<"-- sawtooth: generate of sawtooth wave" <<endl;
        cout <<"-- pulse: generate of pulse wave" <<endl;
        cout <<"--pf p: Fraction of the time the pulse wave is up" <<endl;
        exit(1);
        
    }
    /**
        This is going to check for sndcvt and output its switches
     */
    else if(pp.compare("sndcvt") == 0)
    {
        cout <<"This will convert from .wav to .cs229\n This are the switches for sndcvt" <<endl;
        cout << "-h: show the help screen" <<endl;
        cout << "-o file : specify the output file" <<endl;
    }
    
    /**
        This is going to check for sndfix and output its switches
     */
    else if(pp.compare("sndfx") == 0)
    {
        cout << "Adds effects to specific sounf file" <<endl;
        exit(1);
    }
    /**
        This is going to check for sndplay and output its switches
     */
    else if(pp.compare("sndplay") == 0)
    {
        cout << "Reads a music file in .abc229 format" <<endl;
        cout << "-h : show the help screen" << endl;
        cout << "-o file: specific output file name" <<endl;
        cout << "-w: output in .wav format rather than .cs229 format" <<endl;
        cout << "--bits n: use a bit depth of n" <<endl;
        cout << "--sr n: use a sample " <<endl;
        cout << "--mute n: do not play instrument n" <<endl;
        exit(1);
    }
    /**
        If user enters some other name apart from this then it will show this error
     */
    else
    
    {
        cout << "Nothing Switch found!" <<endl;
        exit(1);
        
    }
}

