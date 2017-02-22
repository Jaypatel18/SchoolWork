//  struct.h
//  Assignment3
//
//  Created by Jay Patel on 10/19/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#ifndef struct_h
#define struct_h

#include <stdio.h>
// this will help me with the date stuff and it made my life way easier
struct Decade{
    char *CurrDay;
    char *CurrMnth;
    char *CurrYr;
    char *CurrHr;
    char *CurrMin;
    char *CompleteStringForDecade;
    char *CompleteTimeForDecade;
    
};
// this will requestfor the histogram
struct appealHisto {
    char* header;
    int bins;
    char* startTimeofHisto;
    char*endTimeofHisto;
};
// this will see the Range
struct Span{
    int begRow;
    int endRow;
    int rowCount;
    float highTemp;
    float lowTemp;
    float average;
    char** header;
    int bins;
};



#endif /* struct_h */
