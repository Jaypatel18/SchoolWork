//
//  main.c
//  C
//  Created by Jay Patel on 10/19/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "assign3.h"
#include "struct.h"
#include "weatherio.h"

int main (int argc, char *argv[])
{
    char *appealInput = malloc (sizeof(char)*256); // malocing hte size of char
    char *strings = "";
    int sMonth = 0;
    int sYear =0;
    int sHour = 0;
    
  
        while(strncmp(appealInput, "quit",4) != 0) // checking if the user input quit
    {
        printf("Please tell me your request: "); // request
        fgets(appealInput,256,stdin);
        char* requestType = malloc(sizeof(char)*256);
        sscanf(appealInput, "%s" , requestType);
        
        if(strcmp(requestType, "historgram") == 0) {
            struct appealHisto *histogramRequest = malloc(sizeof(struct appealHisto));
            printf("Histogram: %s\n", histogramRequest -> startTimeofHisto); // it will print the histogram
            
            
        }
        
        else{
            printf("Error");
        }
        
        }
    
    if(argc > 4) // checing if the argc is greater than 4
    {
        printf("Error");
        exit(1);
    }
    else if (argc == 2) // checking if it is eq to 2
    {
        int great = 0;
        strings = (char*) argv[1];
        
        char *token = strtok(strings, "="); // if it find "="
        
        if(strcmp(token, "df")){
             great = 1;
            token = strtok(NULL, "=");
        }
        else if(strcmp(token, "of")==0) { // if it find the token "of", doing the same for next error checking as well
            great = 1;
            token = strtok(NULL, "=");
        }
        else if(strcmp(token, "if")==0){ // if the find the toke "if"
            great = 1;
            token = strtok (NULL, "="); // again "="
        }
        else{
            printf("You are wrong, TRY AGAIN!");
            exit(1);
        }
    }
    else if (argc == 3) // one missing here I am checking for hte same tokens
    {
        int strTest ="";
        int good =0;
        int good2 =0;
        int good3 =0;
        strTest = (char*) argv[1];
        char *token = strtok(strTest, "=");
        
        if(strcmp(token, "df") == 0) {
            good =1;
            token = strtok(NULL, "=");
        }
        else if(strcmp(token, "of") == 0) {
            good2 =1;
            token = strtok(NULL, "=");
        }
        else if(strcmp(token, "if")==0) {
            good3 = 1;
            token = strtok(NULL, "=");
        }
        else{
            exit(1);
        }
        
    }
    else if(argc == 4) // 2 mising checking for the same tokens
    {
       int strTest = "";
        
        int good = 0;
        int good1 =0;
        int good2 =0;
        strTest = (char*)argv[1];
        char *t = strtok(strTest, "=");
        
        if(strcmp(t,"df")==0)
        {
            good = 1;
            t = strtok(NULL, "=");
        }
        else if(strcmp(t, "of")) {
            good1 =1;
            t = strtok(NULL, "=");
        }
        else if(strcmp(t, "if")) {
            good2 = 1;
            t = strtok(NULL, "=");
            
        }
        else
        {
            exit(1);
        }
 
    }
    char *date = malloc(sizeof(20*sizeof(char)));
    char *sDate = date;
    char *tok2 = strtok(sDate, "/");
    
    if(atoi(tok2) != 0)
    {
        if(strlen(tok2) != 2 || strcmp(tok2, "00") || sMonth > 12) // if it is not equal to 0 then it will check if hte tok is 00 and it is then it is an error
        {
            printf("Error");
            exit(1);
        }
        
        else{
            printf("New error");
            exit(1);
        }
        
        
            tok2 = strtok(sDate, "/"); // it will see of this delimeter
            tok2 = strtok(sDate, "-"); // it will see for this delimeter
        
        if(atoi(tok2) != 0) {
            sYear = atoi(tok2);
            if(strlen(tok2) != 4 || strcmp(tok2, "0000")) {
                printf("Error");
                exit(1);
            }
        }
        else{
            printf("new Error");
        }
        
        tok2 = strtok(NULL, "-"); // this is the delimeter it will see
        tok2 = strtok(tok2, ":");
        
        if(atoi(tok2) != 0) {
            sHour =atoi (tok2);
            
            if(strlen(tok2) != 2 || sHour > 23) // chekcs if it is greater than 23
            {
                exit(1);
            }
        }
        else{
            printf("New Error");
        }
        
    }
        return 0;

    
}
