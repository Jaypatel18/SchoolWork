//
//  main.c
//  C
//
//  Created by Jay Patel on 9/30/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#include <stdio.h>
#include "weatherio.h"
#define MAX_LINE_LENGTH 500;

int main(int argc, const char * argv[]) {
    char *file_name;
    char **header ;
    header = (char **)malloc (sizeof(char**));
    read_header(file_name, header);
    
    FILE *fp;
    if(fp == NULL) {
        fprintf(stderr, "No file");
        return -1;
    }
    else {
        fprintf(stderr, "Successfull");
    }
    char ch;
    while((ch = getc(fp)) != "\n"){
        void ** row;
        row = malloc(sizeof(void**));
                      int j = read_row(fp,header,row);
                      return 0;
    }
}
