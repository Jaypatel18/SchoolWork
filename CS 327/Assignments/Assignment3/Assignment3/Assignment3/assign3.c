//  hw3.c
//  C
//  Created by Jay Patel on 10/19/15.
//  Copyright © 2015 Jay Patel. All rights reserved.

#include "assign3.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "weatherio.h"
#include "struct.h"
#include "util.h"


//histogram <header> <bins> <start date/time> <end date/time>

float MinAppeal( char **head, int bins, int startDate, int endDate, int startHr, int endHr);
float MaxAppeal (char **head, int bins, int startDate, int endDate, int startHr, int endHr);

void  Histogram (char *file_name,char *appealStringValue ,struct appealHisto *appeal, int bin, char**header, int startDate, int startHrMn, int endDate, int endHrMn)
{
    float box [bin]; // this will keep my track of the bins
    int happens [bin]; // check when the occureences occur
    
    float low = MinAppeal(header, bin, startDate, endDate, startHrMn, endHrMn); // calling minappeal so that I dont have to worry to call it back later
    float high = MaxAppeal(header, bin, startDate, endDate, startHrMn, endHrMn); // same as min
    
    float diff = (high - low) / bin; // checking the difference between 2
    box[0] = low;
    
    for(int i =1;i < (bin+1) ; i++) {
       box[i] = box[i-1] + diff;
    }
    
    FILE *fp;
    fp = fopen(file_name, "r"); // opening the file and I will read it at the moment and then write it later on.
    char **col;
    void **row;
    
    
    if(file_name == NULL)
    {
        exit(-1);
    }
    char* appealKind = malloc(sizeof(char)*64); // here mallocing the size of char in all the char*'s
    char* head = malloc(sizeof(char)*64);
    char* numOfBins = malloc(sizeof(char)*10);
    char* begin = malloc(sizeof(char)*20);
    char* over = malloc(sizeof(char)*20);
    
    sscanf(appealStringValue, "%s %s %s %s %s", appealKind, head, numOfBins, begin, over); // scanning through them
    
    struct Decade *StartDate = malloc(sizeof(struct Decade)); // I have struct for this Decade which has dates
    struct Decade *OverDate = malloc(sizeof(struct Decade));
    struct Span *range = malloc(sizeof(struct Span));
    
    range -> bins = atoi(numOfBins);
    
    
    makeDate(begin, StartDate);
    makeDate(over, OverDate);
    
    appeal-> bins = atoi(numOfBins);
    appeal-> header = head;
    appeal-> startTimeofHisto = StartDate->CompleteStringForDecade;
    appeal-> endTimeofHisto = OverDate-> CompleteStringForDecade;
    
    // starting from here I have the same code for min max and avergae because I have to find all of them different the only difference is to see
    // what occur when so I did not create a helper function

    int cc = read_header(file_name, col);
    do {
        read_row(fp, col, row);
        
        for(int i =1; i <cc; i ++) {
            int currDate;
            int currHrMn;
            int dateInd;
            int endhrMn;
            int headerToQ = 0;
            
            // checking for the Date and then use it with the date
            if(strcmp(col[i], "Date") == 0) {
                dateInd = i;
                currDate = *(int*) row[dateInd];
            }
            // checkin for the HrMn and then use it with the end of date
            else if(strcmp(col[i], "HrMn") == 0) {
                endHrMn = i;
                endHrMn = *(int*) row[endHrMn];
            }
            // see for the header
            else if(strcmp(col[i], *header) == 0) {
                headerToQ = i;
            }
            
            // I have a helper function in the end called appealRange which will keep the range into limit
            if(appealRange(currDate, currHrMn, endDate, endHrMn, endhrMn, startDate)==1) {
                float curr = *(float*) row[headerToQ];
                for(int i=0;i< bin ; i++) {
                    if((curr >= box[i-1]) && (curr < box[i])) {  // checking for the histo if it is greater than the box but smaller than the curr
                        happens[i-1]++;
                    }
                }
            }
        }
    }
    
    while (!feof(fp));
    free(appealKind); // freeing all at the end
    free(head);
    free(numOfBins);
    free(begin);
    free(over);
    fp = fopen(file_name, "w"); // this wil help you to print on the file
    printf(" Temp Range and Occurences");
    for(int i = 0 ; i < atoi(numOfBins) ; i++)
        printf("%.2d", range -> bins);
}
// This method will find the min of the q
// in here I am doing excatly the same as Histogram since it has to find the min
float minAppeal (char**head, char*file_name, int bins, int startDate, int startHr, int endDate, int endHr)
{
    float min;
    FILE *fp;
    fp = fopen(file_name, "r");
    char **column;
    void **row;
    
    int cc = read_header(file_name , column);
    
    do{
        read_row(fp, column, row);
        for(int i =0;i < cc; i++)
        {
            int currDate;
            int currHr;
            int dateInd;
            int endHr;
            int headerToQ = 0;
            int minSet=0;
            
            if (strcmp(column[i], "Date") == 0) {
                dateInd =i;
                currDate = *(int*) row[dateInd];
            }
            else if(strcmp(column[i], "HrMn") ==0 ) {
                endHr = i;
                endHr = *(int*) row[endHr];
            }
            else if(strcmp(column[i], *head) == 0) {
                headerToQ =0;
            }
            
            
            if(appealRange(currDate, currHr,endHr, endDate, startDate, startHr)==1) {
                float cur = *(float*) row[headerToQ];
                
                if(minSet==1) {
                    minSet = cur;
                    cur =1;
                    
                }
                else if((minSet == 1) &&(cur < minSet)) { // checking if is smaller if it is then set it to the min
                    minSet = cur;
                }
            }
        }
    }
    
    while (!feof(fp));
    fp = fopen(file_name, "w"); // this is to print out in file
    printf("Temp Range and Occurences");
    for(int i =0 ; i <cc ; i++) {
        printf("%.4f", min);
    }
    return min;
  
}
// similar to Histo as well

float maxAppeal (char **head, char*filename, int bins, int startate, int endDate, int startHr, int endHr) {
    float max;
    FILE *fp;
    fp = fopen(filename, "r");
    char **col;
    void **row;
    
    int cc = read_header(filename, col);
    
    do {
        read_row(fp,col, row);
        
        for(int i =0;i < cc ;i ++) {
            int currDate;
            int currHr;
            int dateInd;
            int endHr;
            int headerToQ =0 ;
            int startHr;
            int minSet;
            
            if(strcmp(col[i], "Date") == 0) {
                dateInd = i;
                currDate = *(int*) row[dateInd];
            }
            else if(strcmp(col[i], "HrMn") == 0) {
                endHr = i;
                endHr = *(int*) row[endHr];
            }
            else if(strcmp(col[i], *head) == 0) {
                headerToQ = i;
            }
            
            if(appealRange(currDate, currHr, startHr, endHr, startate, endDate)==1) {
                float cur = *(float*) row[headerToQ];
                if(minSet == 1) {
                    minSet = cur;
                    cur =1;
                }
                else if((minSet == 1) && (cur > minSet)) { // In this method I am doing opoosite of min I just check if it is greater than the curr and if it is the I just set it to the max
                    minSet = cur;
                }
                }
        }
    }
    while (!feof(fp));
    fp = fopen(filename, "w"); // this is for printing out in the file
    printf("Temp Range and occurence");
    for(int i =0 ; i <cc; i ++) {
        printf("%.2f", max);
    }
    return max; // returing the max
}

// again similar to the histo
float AverageAppeal (char **head, char *file_name, int bins, int startDate, int endDate, int startHr, int endHr)
{
    float avg;
    float t = 0.0;
    FILE *fp;
    fp = fopen(file_name, "r");
    
    char **column;
    void **row;
    
    int cc = read_header(file_name, column);
    
    do{
        read_row(fp, column, row);
        
        for(int i =0; i < cc ; i ++) {
            int currDate;
            int currHr;
            int dateInd;
            int endHr;
            int headerToQ =0;
            int values = 0;
            
            if(strcmp(column[i], "Date") == 0) {
                dateInd = i;
                currDate = *(int*) row[dateInd];
            }
            else if(strcmp(column[i], "HrMn") ==0 ) {
                endHr = i;
                endHr = *(int*) row[endHr];
                
            }
            else if(strcmp(column[i], *head) ==0 ) {
                headerToQ = i;
            }
            if(appealRange(currDate, currHr, startDate, endHr, startHr, endDate) == 1) // checking if the appeal range function  to 1
            {
                if(headerToQ  != 0) // say if it not equal to 0 then it will add up to the total and add it up to row at hte particulat index
                {
                    t += *(float*) row[headerToQ];
                    values ++; // incrementing the value of it
                }
                else
                {
                    exit(1);
                }
            }
            
            }
        }
    
    while (!feof(fp));
    fp = fopen(file_name, "w"); // writting into the file so that it wil output in the file
    printf("Temp average") ;
    for(int i =0 ; i < cc; i ++) {
        printf("%.2f", avg);
    }
    return avg;
    
}
// this method will check for the valid dates for example if it is from betwee 0 to2 it will say it is a day
void makeDate (char* strDate, struct Decade *date){
    
    int arr      = 0;
    char *onYear = malloc(sizeof(char)*4);
    char *CDate  = malloc(sizeof(char)*8);
    char *FDate  = malloc(sizeof(char)*8);
    char *onDay  = malloc(sizeof(char)*2);
    char *onMonth= malloc(sizeof(char)*2);
    char *onHour = malloc(sizeof(char)*2);
    char *onMin  = malloc(sizeof(char)*2);
    
    
    sscanf("%s%s%s%s%s%s%s",onYear,CDate,FDate,onYear,onMonth,onMin,onDay);
    
    int m;
    
    for(m = 3; m < 5 ; m++) // This will do for month
    {
        char p = strDate[m];
        onDay[arr] = p;
        arr++;
    }
    for(m = 6; m < 10; m++) { // This will do for year
        char p = strDate[m];
        onDay[arr] = p;
        arr++;
    }
    for(m = 0 ; m < 2 ; m ++) // This will do for day
    {
        char p = strDate[m];
        onDay[arr] = p;
        arr++;
    }
    for(m = 14; m < 16;m ++) { // This is for min
        char p = strDate[m];
        onDay[arr] = p;
        arr++;
    }
    for(m = 11 ; m < 13 ; m ++) // This will do for hour
    {
        char p = strDate[m];
        onDay[arr] = p;
        arr++;
    }
    
    
    int subTime;
    subTime = (int)strtol(FDate, (char**)NULL, 10);
    
    sprintf(FDate, "%s%s", onMin,onHour);  // this will print out the min and hour
    sprintf(FDate, "%s%s%s", onDay,onMonth,onYear); // this will print out the day, month and year
    
    char *newTime = malloc(sizeof(char)*4);
    sprintf(newTime, "%d", subTime);
    
    date -> CompleteStringForDecade = newTime;
    date -> CompleteStringForDecade = CDate;
    date -> CurrMnth = onMonth;
    date -> CurrYr = onYear;
    date -> CurrDay = onDay;
    date -> CurrMin = onMin;
    date -> CurrHr = onHour;
    
    free(onYear); // freeing the memory
    free(CDate);
    free(FDate);
    free(onMonth);
    free(onMin);
    free(onDay);
    free(onHour);
    
}
// this is the method I wrote to check the range using /2400.0 it will divide and see if it is in range of it
int appealRange ( char * file_name , struct Span *range, char* begin_date, char* over_date, int currHrMn, int lineHr, int endHr)
{
    char **totalrow;
    int dColumn;
    int tColumn;
    FILE *fp = fopen(file_name, "r");
    
    
    if(fp == NULL) {
        exit(1);
    }
    
    char **head = (char**) malloc(sizeof(char*) * 500);
    int cc = appealRows(fp, head);
    
    dColumn = columnFinder("Date", head, cc);
    tColumn = columnFinder("HrMn", head, cc);
    int temp;
    
    temp = atoi(totalrow[dColumn]);
    temp = atoi(totalrow[tColumn]);
    while(!feof(fp))
    {
        
        totalrow = (char**) malloc(sizeof(char*) * 500);
        
    }
    
    int curr = (int) currHrMn / 2400; // It should return an int thats why I have int for all
    int over = (int) begin_date +curr;
    
    int line = (int) lineHr/2400;
    int over2 = (int) begin_date+ line;
    
    int over3 = (int) endHr / 2400;
    int over4 = (int) over_date +over3;
    
    
    if((over >= over2) && (over <= over4)) { // this wil checking if it is oer the range from or greater than 2 and smaller than 4
        return 1;
    }
    
    else
    {
        return 0;
    }
    
    // Read through the data find min max and return max-min
    
}

// this methid will help me find the column by looping through the col and then check of they both are eq to 0
int columnFinder (char* nameOfC, char **head, int col){
    int counter = 0;
    for(int i = 0 ; i < col + 1 ; i++){
        if (strcmp(head[i], nameOfC) == 0){
            return i+1; // if they are then just increment by one
        }
    }
    return counter;
}

// this will help me to find the rows what I am doing is mallocing the size and then once it reaches the delimter it increments
int appealRows (FILE* fp, char **r)
{
    char stringOfHeader[256];
    fgets(stringOfHeader,256,fp);
    
    r[0] = (void*) malloc(256);
    char c = stringOfHeader[0];
    char *pointer = r[0];
    int counter = 0;
    int i = 0;
    while(c != '\n')
    {
        c = stringOfHeader[i];
        if(c != ',')
        {
            *pointer ++ =c;
            
        }
        else
        {
            *pointer = '\0';
            counter++;
            r[counter] = (char*)malloc(256);
            pointer = r[counter];
        }
        
    }
    
    return counter+1;
}