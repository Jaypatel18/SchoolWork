//
//  weatherio.c
//  C
//
//  Created by Jay Patel on 9/30/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#include "weatherio.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define maxline 500
#define lines 500
#define MAX_LENGTH 500

int validate_format(char *file_name)
{
    
    char row[256];
    
    FILE *fp;
    fp =fopen(file_name, "r");
    
    if(fp == NULL){
        printf("Wait, there is no such File");
        return -1;
    }
    char **header = (char**) malloc(sizeof(char*)*5000);
    read_header(fp, header);
    
    while(!feof(fp)){
        fgets(row,256, fp);
        printf("%s",row);
    }
    return 0;
    
}

int header_columns(char*file_name)
{
    FILE *fp;
    char *line = malloc(maxline);
    const char ch[2] = ",";
    char *tok;
    int col = 0;
    
    fp = fopen(file_name, "r");
    
    if(fp == NULL) {
        fprintf(stderr, "Wait, there is no such file");
        return -1;
    }
    
    while (fgets(line,sizeof(line),fp) != NULL)
    {
        for(tok = strtok(line,ch);tok != NULL ; tok = strtok(NULL,ch)){
            col ++;
        }
    }
    fclose(fp);
    
    return col;
}

int read_header (char *file_name , char **header)
{
    int col = 0;
    FILE *fp;
    char *line = malloc(maxline);
    const char ch[2] = ",";
    char *tok;
    
    
    fp = fopen(file_name, "r");
    
    if(fp == NULL){
        fprintf(stderr, "Wait, there is no such file");
    }
    while (fgets(line,sizeof(line), fp) != NULL)
    {
        for(tok = strtok(line,ch);tok != NULL; tok = strtok(NULL,ch)){
            header[col] = malloc(strlen(tok) + 1);
            strcpy(header[col], tok);
            col++;
        }
    }
    free(line);
    return col;
 
}

int read_row(FILE *fp ,char **header , void**row){
    int a = 6, b = 5, c= 8, e = 4 , f =1 , g = 3;
    char* line = malloc (maxline);
    const char ch[2] = ",";
    char *tok;
    int number;
    double number2;
    
    if(fp == NULL){
        fprintf(stderr, "Wait, there is no such file");
    }
    
    while (fgets(line, sizeof(line), fp) != NULL) {
        break;
    }
    
    while(fgets(line, sizeof(line), fp) != NULL){
        
        for(tok = strtok(line,ch); tok != NULL ; tok = strtok(NULL, ch)){
            
            for(int i = 0 ; i < 20 ; i++){
                if(strcmp(header[i] , "IDentification Name"))
                {
                    row[i] = malloc(sizeof(char));
                    row[i]= tok;
                }
                
                if(strcmp(header[i] , "USAF")){
                    if(a < (strlen(tok) -1 ))
                    {
                        fprintf(stderr, "Error");
                        return -1;
                    }
                       else
                           row[i] = malloc(sizeof(int));
                            number = atoi(tok);
                    
                }
                
                if(strcmp(header[i] , "NCDC")){
                    if(b < (strlen(tok) - 1)) {
                        fprintf(stderr, "Error");
                        return -1;
                    }
                       else{
                           row[i] = malloc(sizeof(int));
                           number = atoi(tok);
                           
                       }
                    if(strcmp(header[i] , "Date")){
                        if(c < (strlen(tok) - 1)){
                            fprintf(stderr, "Error");
                            return -1;
                        }
                        else{
                            row[i] = malloc(sizeof(int));
                            number = atoi(tok);
                        }
                        if (strcmp(header[i] , "HrMn")) {
                            if(e < (strlen(tok) - 1)) {
                                fprintf(stderr, "Error");
                                return -1;
                            }
                            else{
                                row[i] = malloc(sizeof(int));
                                number = atoi(tok);
                            }
                            if(strcmp(header[i] , "I"))
                            {
                                if(f < (strlen(tok) - 1)) {
                                    return -1;
                                }
                                   else {
                                       if(isdigit(tok == "1"||"2"||"3"||"4"||"5"||"6"||"7"||"8"))
                                       {
                                           row[i] = malloc(sizeof(int));
                                           number = atoi(tok);
                                       }
                                       
                                   }
                            }
                                   if(strcmp(header[i] , "TYPE")) {
                                       if(b < (strlen(tok) - 1)){
                                           fprintf(stderr, "Error");
                                           return -1;
                                       }
                                       else{
                                           row[i] = malloc(sizeof(NULL));
                                       }
                                   }
                                   if(strcmp(header[i] , "QCP")){
                                       row[i]= malloc(sizeof(int));
                                   }
                            
                                   if(strcmp(header[i] , "Wind Dir")) {
                                       if(g < (strlen(tok) - 1)) {
                                           fprintf(stderr, "Error");
                                           return -1;
                                       }
                                       else{
                                           row[i] = malloc(sizeof(int));                                     }
                                       
                                   }
                                if(strcmp(header[i] , "Wind Dir Q")){
                                    if(f < (strlen(tok) - 1)) {
                                        fprintf(stderr, "Error");
                                        return -1;
                                    }
                                    else{
                                        row[i]= malloc(sizeof(int));
                                    }
                                }
                            if(strcmp(header[i] , "Wind Dir I")) {
                                if( f < (strlen(tok) - 1)) {
                                    fprintf(stderr, "Error");
                                    return -1;
                                }
                                else{
                                    row[i] = malloc(sizeof(char));
                                }
                            }
                            if(strcmp(header[i] , "Wind Spd")){
                                if(e < (strlen(tok) - 1)) {
                                    fprintf(stderr, "Error");
                                    return -1;
                                }
                                else{
                                    row[i] = malloc(sizeof(double));
                                    number2 = strtod(ch, NULL);
                             
                                }
                            }
                            if(strcmp(header[i] , "Wind Spd Q")) {
                                if(f < (strlen(tok) - 1)) {
                                    fprintf(stderr, "Error");
                                    return -1;
                                }
                                else{
                                    row[i] = malloc(sizeof(int));
                                }
                            }
                            if(strcmp(header[i] , "Temp")) {
                                if(b < (strlen(tok) - 1)) {
                                    printf(stderr, "Error");
                                    return -1;
                                }
                                else{
                                    row[i]= malloc(sizeof(double));
                                    number2 = strtod(ch, NULL);
                                }
                            }
                            
                            if(strcmp(header [i] , "Temp Q")){
                                row[i] = malloc(sizeof(int));
                                number = atoi((tok));
                                
                            }
                            else{
                                row[i] = malloc(sizeof(char));
                                row[i]= tok;
                            }
                        }
                        if(strcmp(header[i] , "Dewpt")) {
                            if(b < (strlen(tok) -1 )){
                                fprintf(stderr, "Error");
                                return -1;
                            }
                            else{
                                number = atof(tok);
                                row[i] = number;
                            }
                        }
                        if(strcmp(header[i] , "Depth Q")){
                            row[i] = malloc(sizeof(int));
                            number = atoi(tok);
                        }
                        else{
                            row[i] = malloc(sizeof(char));
                            row[i] = tok;
                        }
                        
                        }
                    if(strcmp(header[i] , "Slp")) {
                        if(b < (strlen(tok) - 1)) {
                            fprintf(stderr, "Error");
                            return -1;
                        }
                        else{
                            row[i] = malloc(sizeof(double));
                            number2  = strtof(ch, NULL);
                        }
                    }
                    if(strcmp(header[i] , "Slp Q")){
                        if(f < (strlen(tok) - 1)) {
                            printf(stderr, "Error");
                            return -1;
                        }
                        else{
                            row[i] = malloc(sizeof(int));
                            number = atoi(tok);
                            
                        }
                    }
                    if(strcmp(header[i] , "RHx")){
                        if(g < (strlen(tok) - 1)){
                            fprintf(stderr, "Error");
                            return -1;
                        }
                           else{
                               row[i] = malloc(sizeof(int));
                               number = atoi(tok);
                               
                           }
                    }
                }
                }
            }
       
        }
    free (line);
    return 0;
    }


