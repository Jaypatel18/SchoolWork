//
//  hw3.h
//  C
//
//  Created by Jay Patel on 10/19/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#ifndef hw3_h
#define hw3_h
#include "struct.h"
#include <stdio.h>
#include "util.h"

void histogram ( char *, char * ,struct appealHisto *, int, char**, int, int, int,int);
float minAppeal (char**, char*, int, int,int,int,int);
float maxAppeal (char **, char *, int , int, int , int,int);
float averageAppeal (char** , char*, int, int,int ,int, int);
void makeDate (char* , struct Decade *);
int appelRange (char *, struct Span*, char*, char*, int, int,int);
int columnFinder (char* , char **, int );
int appealRows (FILE* , char **);

#endif /* hw3_h */


