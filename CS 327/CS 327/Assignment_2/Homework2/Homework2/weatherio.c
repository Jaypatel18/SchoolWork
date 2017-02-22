//  weatherio.c
//  C
//  Created by Jay Patel on 9/21/15.
//  Copyright © 2015 Jay Patel. All rights reserved.

#include "weatherio.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define maxline 500
#define lines 500
#define MAX_LENGTH 500

int validate_format(char *file_name)
{
    char *head;                                          // This is the pointer header that I have which will keep track of.
    char **h = (char**) malloc(sizeof(char*)*21);       // mallocing the size
    void **data = (void**) malloc(sizeof(char*)*21);    // mallocing the size
    int numOfLines = 1;                                  // this will keep track of my number of lines
    int headerr = 0;                                     // this will keep track of my headeer in the file                                              // This is for the loop
    int success =1;                                      // if it passes then its a success
    char str1[400];
    char *goodFN = (char *) malloc(sizeof(50));
    
    int IDentification_Name = 0;                        // I took all of this values from the csv file that were suppose to pass in
    int USAF = 0;
    int NCDC = 0;
    int Date = 0;
    int HrMn =0;
    int I = 0;
    int Type = 0;
    int QCP = 0;
    int Wind_Dir = 0;
    int Wind_Dir_Q = 0;
    int Wind_Dir_I = 0;
    int Wind_Spd = 0;
    int Wind_Spd_Q = 0;
    int Temp = 0;
    int Temp_Q = 0;
    int Dewpt = 1;
    int Dewpt_Q = 0;
    int Slp = 0;
    int Slp_Q = 0;
    int RHx = 0;
    
    FILE *fp = fopen(file_name, "r");           // opening the file and reading it.
    if(fp == NULL) {                            // checking if it is null
        
        return -1;                              // Just the error
    }
    else if (fgets(str1,sizeof(str1), fp) == NULL)
    {                                                 // scanning through the line
        return numOfLines;                           // returning the total number of lines.
    }
    else
    {
        headerr = read_header(file_name,h);  // if none of the above is true then this will happen
        for (int i = 0; i < headerr ; i++ )
        {
            head = h[i];
            
            /**
             I am checking all the variables that are mentioned in csv file and comparing to the total length of the particaular name and then incrementing to
             one so that it will move to the next one. and checking it is is greater than 1 and if it is then its a success. But there are some words which starts
             with the same letters so I am comparing them with strlen and if it is has the same length that only it will exceute the particular varibale from csv file.
             */
            if(strncmp(head, "IDentification Name", 19)==0)
            {
                IDentification_Name = IDentification_Name + 1;
                
                if(IDentification_Name > 1)
                {
                    return success;
                }
            }
            
            else if (strncmp(head, "USAF", 4) == 0)
            {
                USAF = USAF + 1;
                if(USAF > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "NCDC", 4) == 0)
            {
                NCDC = NCDC + 1;
                if(NCDC > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "Date", 4) == 0)
            {
                Date = Date + 1;
                if(Date > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "HrMn", 4) == 0)
            {
                HrMn = HrMn + 1;
                if(HrMn > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "I", 1) == 0)
            {
                I = I + 1;
                if(I > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "Type", 4) == 0)
            {
                Type = Type + 1;
                if(Type > 1)
                {
                    return success;
                }
            }
            
            else if(strncmp(head, "QCP", 3) == 0)
            {
                QCP = QCP + 1;
                if(QCP > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==8 && strncmp(head, "Wind Dir", 8) == 0)
            {
                Wind_Dir = Wind_Dir + 1;
                if(Wind_Dir > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==10 && strncmp(head, "Wind Dir Q", 10) == 0)
            {
                Wind_Dir_Q = Wind_Dir_Q + 1;
                if(Wind_Dir_Q > 1)
                {
                    return success;
                }
                
            }
            else if(strlen(head)==10 && strncmp(head, "Wind Dir I", 10) == 0)
            {
                Wind_Dir_I = Wind_Dir_I + 1;
                if(Wind_Dir_I > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==8 && strncmp(head, "Wind Spd", 8) == 0)
            {
                Wind_Spd = Wind_Spd + 1;
                if(Wind_Spd > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==10 && strncmp(head, "Wind Spd Q", 10) == 0)
            {
                Wind_Spd_Q = Wind_Spd_Q + 1;
                if(Wind_Spd_Q > 1)
                {
                    return success;
                }
            }
            
            
            else if(strlen(head)==4 && strncmp(head, "Temp", 4) == 0)
            {
                Temp = Temp + 1;
                if(Temp > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==6 && strncmp(head, "Temp Q", 6) == 0)
            {
                Temp_Q = Temp_Q + 1;
                if(Temp_Q > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==5  && strncmp(head, "Dewpt", 5) == 0)
            {
                Dewpt = Dewpt + 1;
                if(Dewpt > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==7  && strncmp(head, "Dewpt Q" , 7) == 0)
            {
                Dewpt_Q = Dewpt_Q + 1;
                if(Dewpt_Q > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==3  && strncmp(head, "Slp", 3) == 0)
            {
                Slp = Slp + 1;
                if(Slp > 1)
                {
                    return success;
                }
            }
            else if(strlen(head)==5 && strncmp(head, "Slp Q", 5) == 0)
            {
                Slp_Q = Slp_Q + 1;
                if(Slp_Q > 1)
                {
                    return success;
                }
            }
            else if(strncmp(head, "RHx", 3) == 0)
            {
                RHx = RHx + 1;
                if(RHx > 1)
                {
                    return success;
                }
            }
            // if everything is right and there are errors than it will move out of the braces and return -1
            else
            {
                return success;
            }
            
        }
        // looping through to see if there is any erros by calling read_row
        while(feof(fp) == 0)
        {
            numOfLines = numOfLines + 1;
            int wrong = read_row(fp, h, data);
            if(wrong != 0)
            {
                return numOfLines;
            }
        }
    }
    free(goodFN);
    free(data); // I am freeing all the data here because we dont need it ahead
    free(h);
    
    return 0; // returns 0 at the end.
}

int header_columns(char*file_name) // this will return the number of data columns
{
    int value = 0;              // this will keep track of sum of the values.
    char ch;                    // this wil keep track of chars that I use to loop through
    
    FILE *fp;
    fp = fopen(file_name, "r"); // I am going open the file and read it
    if(fp == NULL) {                    // checking if it is Null
        
        return -1;                      // if it is then it has an error so returns -1
    }
    
    while((ch = getc(fp)) != '\n')
    {    // looping through it and checking if it is not the last line
        if(ch == ',')
        {                 // once it reaches the delimeter then it will move on to next
            value++;
        }
    }
    fclose(fp);
    return value++;                 // returning the value+1 so it wont affect the last char
}


int read_header (char *file_name , char **header) // this will return the number of data column in the file
{
    FILE *fp = fopen(file_name, "r");           // This will open the file and read it
    if(fp == NULL)
    {                            // if it is null then it will return -1
        return -1;
    }
    
    int count = 0;
    header[0] = (char*) malloc(sizeof(char) * 64); // I am mallocing the size here so that it doesnt go more than
    char *j;
    j = header[0];
    char ch;
    // looping through it so that it will see if its not end of file and the then see if it reaches the
    // delimeter, I am using the same one in read_row
    while ((ch=getc(fp)) != '\n' && ch!= EOF && ch != '\r')
    {
        if(ch != ',')
        { // checks if it has delimeter
            *j++ = ch;
        }
        else
        {
            *j = '\0';
            count = count + 1;
            header[count] = (char*)malloc(sizeof(char) * 64); // again I am mallocing the size of the char
            j = header[count];
        }
    }
    
    *j = '\0';
    header[count + 1] = (char*) malloc(sizeof(char)*64);
    header[count+1] = NULL;
    
    fclose(fp);       // closing the file
    
    return count + 1; // so that we can move to next one
   
}

int read_row(FILE *fp ,char **header , void**row)
{
    
    int number = 0;   // number of headers
    char *head;       // char headers
    char* dats;       // char datas where it has datas
    int numOfHeader = 0;// number of headers
    char *pFromReadheader;// this is the one from read header
    char ch;             // char c this wil keep track of my char
    // int count = 0;      // this is the count 0
    long leng, newlength; // I dont know the lengths so thats why I wrote long
    int newData = 0;     // this is for new Data which I am using in the end
    float doubleData = 0.0;    // this will keep track of my data which is in float
    int element = 0, elements = 0;
    int conts;
    leng = strlen (dats);
    char space[leng];
    int nonValue = 0;
    int add =0;
    int sub = 0;
    int front = 0;
    int d = 0;
    int c = 0;
    int Full = 0;
    int symbol = 0;
    char *right = (char*) malloc (sizeof(char)*50);
    
    // this while loop will check if it not null and if it is not then it will move one by one.
    
    while (header[numOfHeader] != NULL)
    {
        numOfHeader = numOfHeader + 1;
    }
    
    row[0] = (char*) malloc(sizeof(char)*64); //mallocing the size of char
    
    pFromReadheader = row[0];
    if(fp == NULL)
    {
        
        return -1;          // this will print an error if is is NULL
    }
    
    //  this is the one which i used in read header I used it the same since it has the same logic and it works
    
    while ((ch = getc(fp)) != '\n' && ch!= EOF)
    {
        if(ch!= ',') // check if it is not equal delimeter
        {
            *pFromReadheader++ = ch;
        }
        else
        {
            *pFromReadheader = '\0';
            number = number + 1;
            row[number] = (char*) malloc(sizeof(char)*64); // mallocing the size of char
            pFromReadheader = row[number]; // this is from the header and it will check if the header is the count at the array of the count.
        }
    }
    
    *pFromReadheader = '\0';
    row[number + 1] = (char*) malloc(sizeof(char)*64); // mallocing the size of the number
    row[number+1] = NULL;
    number = number + 1;
    
    // if it is not equal to the number it will return 1
    
    if(numOfHeader != number)
    {
        return 1;
    }
    // if that doesnt work then it will loop less than number
    else
    {
        
        for(int i = 0 ; i < number ; i++)
        {
            head = header [i];
            dats = row[i];
            char strings[20];
            
            // From here I am comparing all the values from Csv file and looping through all the lenght so that it doesnt mess up if it has the same starting values and also I am checking for spacing ans return 2 if they are equal to 0. I am using else if statements for all because if one if wrong it will check the other one, and for example if it has all the letters same except the last one it will check the length of the whole string and then compare it so that it will know if is the same or not. example would be Wind and Wind Dir.
            
            if(strncmp(head, "IDentificaiton Name", 19) == 0)
            {
                
                row[0] = (char*)row[0];
                leng = strlen(dats);
                char space [leng];
                for( long i = 0; i < leng ; i ++)
                {
                    space[i] = ' ';
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    return 2;
                }
            }
            else if(strncmp(head,"USAF",4) == 0)  // For USAF
            {
                leng = strlen(dats);
                if(leng > 6)
                {
                    return 2;
                }
                
                if(leng != 1)
                {
                    for(nonValue = 0 ; nonValue < leng ; nonValue ++)
                    {
                        nonValue ++;
                        char ch = dats[nonValue];
                        if(ch != '\0')
                        {
                            break;
                            
                        }
                    }
                }
                
                newData = atoi(row[i]);
                sprintf(strings, "%d", newData);
                newlength = strlen(strings);
                if(leng != newlength + nonValue)
                {
                    return 2;
                }
                else
                {
                    row[i] = (int*) malloc(sizeof(int));
                    *((int*) row[i]) = newData;
                }
            }
            else if (strncmp(head, "NCDC", 4) == 0) //checking for NCDC
            {
                leng = strlen(row[i]);
                if(leng > 5)
                {
                    return 2;
                }
                row[i] = (char*) malloc(sizeof(int));
                *((char*) row[i]) = newData;
                
            }
            else if(strncmp(head, "Date", 4) == 0) //checking for Date
            {
                leng = strlen(row[i]);
                if(leng > 8)
                {
                    return 2;
                }
                newData = atoi(row[i]);
                sprintf(strings, "%d", newData);
                newlength = strlen(strings);
                if(leng != newlength)
                {
                    return 2;
                }
                else
                {
                    row[i] = (int*) malloc(sizeof(int));
                    *((int*) row[i]) = newData;
                }
            }
            else if(strncmp(head, "HrMn", 4)== 0) //checking for hr and min
            {
                leng = strlen(row[i]);
                if( leng > 4)
                {
                    return 2;
                }
                int nonValue = 0;
                if(leng != 1)
                {
                    for (nonValue = 0 ; nonValue < leng ; nonValue ++)
                        
                    {
                        nonValue ++;
                        char ch = dats[nonValue];
                        if(ch != '0'){
                            break;
                        }
                    }
                }
                newData = atoi(row[i]);
                sprintf(strings, "%d", newData);
                newlength = strlen(strings);
                if(leng != newlength +nonValue)
                {
                    return 2;
                }
                else
                {
                    row[i] = (int*) malloc(sizeof(int));
                    *((int*) row[i]) = newData;
                }
                
            }
            else if(strncmp(head, "I", 1)== 0) //checking for I
            {
                
                char*cont[22] = {"1","2","3","4","5","6","7","8","A","B","C","D","E","F","G","H","I","J","K","L","M","N"};
                int conts = 0;
                leng = strlen(row[i]);
                char space[leng];
                for(long j = 0 ; j <leng; j++)
                {
                    space[j] = ' ';
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    leng =0;
                }
                
                if(leng == 0)
                {
                    row[i] = "9";
                    leng = 1;
                }
                else
                {
                    if(leng != 1)
                    {
                        return 2;
                    }
                    int m;
                    for( m = 0 ; m < 22 ; m++)
                    {
                        if(strncmp(row[i], cont[m], 1) == 0)
                        {
                            conts = 1;
                        }
                    }
                    if(conts != 1)
                    {
                        return 2;
                    }
                }
            }
            else if(strncmp(head, "Type", 4) == 0)
            {
                char *cont [38] = {"AERO","AUST","AUTO","BOGUS","BRAZ","COOPD","COOPS","CRB","CRN05","CRN15","FM-12","FM-13","FM-14","FM-15","FM-16","FM-18","GREEN","MESOS","MEXIC","NSRDB","PCP15","PCP60","S-S-A","SA-AU","SAO","SAOSP","SHEF","SMARS","SOD","SOM","SURF","SY-AE", "SY-AU", "SY-MT", "SY-SA", "WBO", "WNO", "99999"};
                
                int conts = 0;
                leng = strlen(row[i]);
                char space[leng];
                for(long i=0;i<leng;i++)
                {
                    space[i]= ' ';
                }
                if(strncmp(dats, space, leng)==0)
                {
                    leng =0;
                }
                if(leng == 0)
                {
                    row[i] = "99999";
                    leng = 5;
                }
                else
                {
                    if(leng >5)
                    {
                        return 2;
                    }
                    for(int l =0; l <= 38;l++)
                    {
                        if(strncmp(row[i], cont[l], 5) == 0)
                        {
                            conts = 1;
                        }
                    }
                    if(conts != 1)
                    {
                        return 2;
                    }
                }
                
            }
            else if( strlen(head) == 8 && strncmp(head, "Wind Dir", 8) == 0) // checking for Wind Dir
            {
                leng = strlen(row[i]);
                char space[leng];
                for(long j = 0 ; j < leng ; j ++)
                {
                    space[j] = ' ';
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    leng = 0;
                }
                int nonValue = 0;
                if(leng != 1)
                {
                    for(nonValue = 0 ; nonValue < leng ; nonValue ++)
                    {
                        char ch = dats[nonValue];
                        
                        if(ch != '0')
                        {
                            break;
                        }
                    }
                }
                if(leng == 0)
                {
                    row[i] = "999";
                    leng = 3;
                }
                else{
                    if(leng > 3)
                    {
                        return 2;
                    }
                    newData = atoi(row[i]);
                    sprintf(strings, "%d", newData);
                    newlength = strlen(strings);
                    if(leng != newlength + nonValue)
                    {
                        return 2;
                    }
                    else
                    {
                        row[i] = (int*) malloc(sizeof(int));
                        *((int*) row[i]) = newData;
                        
                    }
                }
            }
            else if (strlen(head) == 10 && strncmp(head, "Wind Dir Q", 10) == 0) // checking for wind dir q
            {
                char*cont[9] = {"1","2","3","4","5","6","7","9","0"};
                leng = strlen(row[i]);
                char ch[leng];
                for(long ik = 0;ik < leng; ik++)
                {
                    ch[ik] = ' ';
                }
                if(strncmp(dats, ch, leng) == 0)
                {
                    leng = 0;
                }
                if(leng == 0)
                {
                    row[i] = "9";
                    leng = 1;
                }
                else
                {
                    if(leng > 1)
                    {
                        return 2;
                    }
                    for(int l = 0 ; l < 9 ; l ++)
                    {
                        if(strncmp(row[i], cont[l], 1) == 0)
                        {
                            element = 1;
                        }
                    }
                    if(element != 1)
                    {
                        return 2;
                    }
                }
                element = atoi(row[i]);
                row[i] = (int*) malloc(sizeof(int));
                *((int*) row) = conts;
            }
            else if(strlen(head) == 10 && strncmp(head, "Wind Dir I", 10) == 0) //checking for wind Dir I
            {
                char *cont[9] = {"A","B","C","H","N","Q","R","T","V"};
                leng = strlen(dats);
                char space[leng];
                for(long j=0;j<leng;j++)
                {
                    space[j] = ' ';
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    leng = 0;
                }
                if(leng == 0)
                {
                    row[i] = "9";
                    leng = 1;
                    
                }
                else
                {
                    if(leng >1 )
                    {
                        return 2;
                    }
                    for(int k =0;k < 9; k++)
                    {
                        if(strncmp(row[i], cont[k], 1)==0)
                        {
                            elements = 1;
                        }
                    }
                    if(elements != 1)
                    {
                        return 2;
                    }
                }
            }
            else if(strlen(head)== 8 && strncmp(head, "Wind Spd", 8) == 0) // checking for wind spd
            {
                //                    leng = strlen(dats);
                //                    char space[leng];
                //                    int add = 0;
                //                    int sub = 0;
                //                    int front =0;
                //                    int d = 0;
                //                    int c =0;
                //                    int Full = 0;
                //                    int symbol = 0;
                //                    char*right = (char*) malloc(sizeof(char)*50);
                
                if(dats[0] == '+')
                {
                    symbol = symbol + 1;
                    add = add + 1;
                    if(dats[1] == '.')
                    {
                        front =1;
                        right[0] = '0';
                        c = 1;
                    }
                }
                else if (dats[0] == '-')
                {
                    symbol = symbol + 1;
                    sub = sub + 1;
                    right[0] = '-';
                    c = 1;
                    
                    if(dats[1] == '.')
                    {
                        front = 1;
                        right[1] = '0';
                        c = 2;
                    }
                    
                }
                else if(dats[0] == '.')
                {
                    front = 1;
                    right[0] = '0';
                    c =1;
                }
                for(long k = 0 ; k <leng ; k ++)
                {
                    space[k] = ' ';
                    if(dats[k]== '.')
                    {
                        Full =  Full + 1;
                    }
                }
                if(symbol != 0)
                {
                    d += 1;
                }
                
                for(int l = d ; l<leng; l++)
                {
                    right[c] = dats[d];
                    c++;
                    d++;
                }
                
                if(strncmp(dats, space, leng) == 0)
                {
                    leng =0;
                }
                if(leng == 0)
                {
                    row[i] = "9999";
                    leng = 4;
                }
                else
                {
                    if(leng-Full>4)
                    {
                        return 2;
                    }
                    doubleData = atof(row[i]);
                    sprintf(strings, "%f", doubleData);
                    
                    if((symbol == 0 && Full == 0 && strncmp(dats, strings, leng-1)!= 0) || ((add != 0 || Full != 0) && strncmp(right, strings, leng-symbol) != 0) )
                    {
                        return 2;
                    }
                }
                row[i] = (float *) malloc(sizeof(float));
                *((float*) row[i]) =  doubleData;
            }
            else if(strlen(head)== 10 && strncmp(head, "Wind Spd Q", 10) ==0) { // checking for wind spd q
                leng = strlen(row[i]);
                char space[leng];
                for(long k = 0; k < leng;k++)
                {
                    space[k]= ' ';
                }
                if(strncmp(dats, space, leng)==0)
                {
                    leng =0;
                }
                if(leng == 0 )
                {
                    row[i] = "9";
                    leng =1;
                }
                else
                {
                    if(strncmp(row[i], "8", 1)==0)
                    {
                        return 2;
                    }
                    leng = strlen(row[i]);
                    if(leng >1){
                        return 2;
                    }
                    newData = atoi(row[i]);
                    sprintf(strings, "%d", newData);
                    newlength = strlen(strings);
                    if(leng != newlength)
                    {
                        return 2;
                    }
                }
                row[i] = (int*) malloc(sizeof(int));
                *((int*) row[i]) = newData;
            }
            
            
            else if ( strlen(head) == 4 && strncmp(head, "Temp", 4) == 0) // checking for temp
            {
                leng = strlen(dats);
                char space[leng];
                int fullStop =0;
                int symbols =0;
                int indD =0;
                int indC =0;
                int adding =0;
                int substracting =0;
                char *correction =(char*) malloc(sizeof(char)*50);
                if(dats[0] == '+')
                {
                    symbols+=1;
                    adding +=1;
                    if(dats[1] == '.')
                    {
                        fullStop = 1;
                        correction[0] = '0';
                        indC = 1;
                    }
                }
                else if (dats[0] == '-')
                {
                    symbols += 1;
                    substracting += 1;
                    correction[0]= '-';
                    indC = 1;
                    if(dats[1] == '.')
                    {
                        fullStop = 1;
                        correction[1]='0';
                        indC = 2;
                    }
                }
                else if(dats[0] == '.')
                {
                    fullStop = 1;
                    correction[0] = '0';
                    indC = 1;
                }
                for(long i = 0;i< leng;i++)
                {
                    space[leng]= ' ';
                    if(dats[i] == '.' )
                    {
                        fullStop += 1;
                    }
                }
                if(symbols != 0)
                {
                    indD += 1;
                }
                for(int j = indD ; j< leng; j++)
                {
                    correction[indC++] = dats[indD++];
                }
                if(strncmp(dats, space, leng)==0)
                {
                    leng =0;
                }
                if(leng == 0)
                {
                    row[i]= "99999"; // error add + and remove one 9
                    leng =5;
                }
                else
                {
                    if(leng-fullStop>5)
                    {
                        return 2;
                    }
                    doubleData = atof((char*) row[i]);
                    sprintf(strings, "%f", doubleData);
                    if((symbols == 0 && fullStop == 0 && strncmp(dats, strings, leng-1) != 0) || ((adding != 0 || fullStop != 0) && strncmp(correction, strings, leng-symbols) != 0))
                    {
                        return 2;
                    }
                }
                row[i] = (float*) malloc(sizeof(float));
                *((float*)row[i]) = doubleData;
                
            }
            
            else if(strlen(head)==6 && strncmp(head, "Temp Q", 6) == 0) // checking for tempq
            {
                char *contents[16] = {"0","1","2","3","4","5","6","7","9","A","C","I","M","P","R","U"};
                int elements =0;
                leng = strlen(dats);
                if(leng >1)
                {
                    return 2;
                }
                for(int p =0 ; p< 16;p++)
                {
                    if(strncmp(row[i], contents[p], 1)==0)
                    {
                        elements = 1;
                    }
                }
                if(elements != 1)
                {
                    return 2;
                }
                
            }
            
            
            else if(strlen(head) == 5 && strncmp(head, "Dewpt", 5) == 0) // checking for dewpt
            {
                int stop = 0;
                int sym = 0;
                int indexD = 0;
                int indexC = 0;
                int pos =0;
                int neg =0;
                int front =0;
                char* correct = (char*) malloc(sizeof(char)*50);
                char space[leng];
                leng = strlen(dats);
                
                if(dats[0] == '+')
                {
                    sym += 1;
                    pos += 1;
                    if(dats[1] == '.')
                    {
                        front  = 1;
                        correct[0] = '0';
                        indexC =1;
                    }
                }
                else if(dats[0] == '-')
                {
                    sym += 1;
                    neg +=1;
                    correct[0] = '-';
                    indexC = 1;
                    if(dats[1] == '.' )
                    {
                        front =1;
                        correct[1]='0';
                        indexC =2;
                    }
                }
                else if(dats[0] == '.')
                {
                    front = 1;
                    correct[0]= '0';
                    indexC =1;
                    
                }
                for(long j = 0; j <leng;j++)
                {
                    space[j] = ' ';
                    if(dats[j]== '.'){
                        stop +=1;
                    }
                }
                if(sym != 0){
                    indexD += 1;
                }
                for(int j = indexD;j < leng;j++)
                {
                    correct[indexC]= dats[indexD];
                    indexC++;
                    indexD++;
                }
                if(strncmp(dats, space, leng)==0)
                {
                    leng =0;
                }
                if(leng == 0)
                {
                    row[i]= "99999"; // same here as well
                    leng = 5;
                }
                else
                {
                    
                    if(leng-stop-sym>5 || sym> 1 || sym > 1)
                    {
                        return 2;
                    }
                    doubleData = atof((char*)row[i]);
                    sprintf(strings, "%f",doubleData);
                    if((sym == 0 && stop == 0 && leng > 1 && strncmp(dats, strings, leng-1) != 0) || (sym == 0 && stop == 0 && leng == 1 && strncmp(dats, strings, leng) != 0) || ((pos != 0 || stop != 0) && strncmp(correct,strings, leng-sym) != 0))
                    {
                        return 2;
                    }
                }
                row[i]= (float*) malloc(sizeof(float));
                *((float*) row[i]) = doubleData;
            }
            else if(strlen(head)==7 && strncmp(head, "Dewpt Q", 7) == 0) {
                char* conts[16] = {"0","1","2","3","4","5","6","7","9","A","C","I","M","P","R","U"};
                int element = 0;
                leng = strlen(row[i]);
                char space[leng];
                for(long i =0 ; i <leng;i ++)
                {
                    space[i]= ' ';
                    
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    leng = 0;
                }
                if(leng == 0)
                {
                    row[i] = "9";
                    leng = 1;
                    
                }
                else
                {
                    if(leng > 1)
                    {
                        return 2;
                    }
                    for(int p = 0; p < 16;p++)
                    {
                        if(strncmp(row[i], conts[p], 1) == 0)
                        {
                            element = 1;
                        }
                    }
                    if(element != 1)
                    {
                        return 2;
                    }
                }
            }
            else if(strlen(head) == 3 && strncmp(head, "Slp", 3)==0)
            { // checking for slp
                char* oldData = (char*)malloc(sizeof(char)*50);
                int boo = 0;
                int stop =0;
                char space[leng];
                for(long i = 0 ; i <leng;i ++)
                {
                    space[i] = ' ';
                    if(dats[i]== '.') {
                        stop += 1;
                    }
                    
                }
                
                if(strncmp(dats,space, leng)==0)
                {
                    leng =0;
                }
                int noValues =0;
                if(leng != 1)
                {
                    for( noValues = 0; noValues < leng; noValues++)
                    {
                        char ch = dats[noValues];
                        if(ch!= '0')
                        {
                            break;
                        }
                    }
                }
                if(dats[0]== '.')
                {
                    oldData[0] = '0';
                    boo =1;
                    for(int p =0;p< leng;p++)
                    {
                        oldData[p+1] = dats[p];
                    }
                    oldData[leng+ 1] = '\0';
                    
                }
                if(leng ==0)
                {
                    row[i] = "9999.9";
                    leng =5;
                }
                else
                {
                    if(leng-stop > 5)
                    {
                        return 2;
                    }
                    doubleData = atof ((char*)dats);
                    sprintf(strings,"%f", doubleData );
                    if( (boo ==1 && strncmp(oldData, strings, leng) != 0) || (boo == 0 && strncmp (dats, strings, leng) != 0 ))
                    {
                        return 2;
                    }
                }
                row[i] = (double*)malloc(sizeof(double));
                *((double*)row[i]) = doubleData;
                
            }
            else if(strlen(head) == 5 && strncmp(head, "Slp Q", 5) == 0)
            { // checking for slp q
                leng = strlen(dats);
                if(strncmp(row[i], "8", 1)==0)
                {
                    return 2;
                }
                char space[leng];
                for(long j =0;j<leng;j++)
                {
                    space[j]= ' ';
                    
                }
                if(strncmp(dats, space, leng)==0)
                {
                    leng = 0;
                }
                if(leng == 0)
                {
                    row[i] = "9";
                    leng = 1;
                }
                else
                {
                    if(leng > 1)
                    {
                        
                        return 2;
                    }
                    newData = atoi((char*)row[i]);
                    sprintf(strings, "%d", newData);
                    newlength = strlen(strings);
                    if(leng != newlength)
                    {
                        return 2;
                    }
                }
                row[i] = (int *) malloc(sizeof(int));
                *((int*) row[i]) = newData;
            }
            
            else if(strncmp(head, "RHx", 3) == 0)
            {
                leng = strlen(dats);
                char space[leng];
                for(long i=0;i<leng;i++){
                    space[i]= ' ';
                    
                }
                if(strncmp(dats, space, leng) == 0)
                {
                    leng =0 ;
                }
                
                if(leng != 1)
                {
                    for(int  nonValue=0;nonValue < leng; nonValue++)
                    {
                        char ch = dats[nonValue];
                        if(ch != '0')
                        {
                            break;
                        }
                    }
                    
                }
                if(leng == 0)
                {
                    row[i] = "999";
                    leng =3;
                }
                else
                {
                    if(leng > 3)
                    {
                        return 2;
                    }
                    int nonValue = 0;
                    newData = atoi(row[i]);
                    sprintf(strings, "%d", newData);
                    newlength = strlen (strings);
                    if(leng != newlength+ nonValue)
                    {
                        return 2;
                    }
                }
                row[i] = (int *) malloc(sizeof(int));
                *((int*) row[i]) = newData;
                
            }
            else if (strncmp(head, "QCP", 3) ==0 )
            {
                leng = strlen(row[i]);
                if(leng > 4)
                {
                    return 2;
                }
            }
            else
            {
                return 3;  // nothing then it will return 3
            }
        }
    }
    return 0;
}
