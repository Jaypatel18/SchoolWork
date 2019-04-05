//  main.c
//  HW1
//  Created by Jay Patel on 10/7/17.
//  Copyright © 2017 Jay Patel. All rights reserved.

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <ctype.h>
#include <sys/stat.h>
#include <sys/shm.h>


#define MAX_LINE 80
#define BUFFER_SIZE 50

char k[MAX_LINE];
char history[10][MAX_LINE];
int history_size = 10;
int count = 0;

//Displays the history that was enterred
void History()
{
    
    printf("History for the commands that was enterred:\n");
    
    int i;
    int j = 0;
    int countHist = count;
    int counter = (count < 10 ? count : 10);
    
    for (i = counter; i > 0;i--)
    {
        printf("%d  ", countHist);
        while (history[i-1][j] != '\n' && history[i-1][j] != '\0')
        {
            printf("%c", history[i-1][j]);
            j++;
        }
        printf("\n");
        j = 0;
        countHist--;
        if (countHist ==  0)
            break;
    }
    
    printf("\n");
}

//adds to the history
void add(char history[10][MAX_LINE], char* k)
{
    
    for(int i = 0; i < 9; i++)
    {
        strcpy(history[i], history[i+1]);
        
    }
    //strcpy(history[9], inputBuffer);
    strcpy(history[9], k);
}

//checks for !! and !n
void exclamation(char *args[], char *inputBuffer, int count)
{
    //char arr[MAX_LINE];
    
    if(args[0] != NULL)
    {
        if(strcmp(args[0], "!!\n") == 0)
        {
            if(count < 10){ //checking that is smaller than 10
            strcpy(inputBuffer, history[(count - 1)%10]); //copying the history into input buffer
                strcpy(k, history[(count - 1)%10]); //this would prevent to show on history
            }
            else{
                strcpy(inputBuffer, history[8]); //copying the history into input buffer
                strcpy(k, history[8]);//this would prevent to show on history
            }
        
        }
        
        //checking for !n
        else if(strncmp(args[0], "!",1)== 0)
        {
            long length = strlen(args[0]);
            char cmd [MAX_LINE];
            strncpy(cmd, args[0]+1,length-1);
            long count_cmd = strlen(cmd);
            int his;
            his = atoi (cmd); //converting into int
       
            for(int i=0;i<count_cmd;i++)
            {
                //checking if its digit using isdigit function
                if(isdigit(cmd[i]!=0))
                {
                    printf("Invalid command\n");
                    break;
                }
            }
            
            //checking for invalid commands
            if(his < count - history_size || his > count)
            {
                printf("No such command\n");
                //exit(1);
            }
            
            else
            {
               // printf("in else\n");
                char nelement[MAX_LINE];
                int number;
                number = his - 1;
                printf("number: %d\ncount: %d\nhis: %d\n", number, count, his);
                strcpy(nelement,history[number]);
                printf("This is nelement: %s",nelement);
                char *b;
                b = strtok(nelement, " \n");
                printf("This is b: %s\n",b);
                int cc = 0;
                
                while(b != NULL)
                {
                  //  printf("in while\n");
                    args[cc] = b;
                    cc++;
                    b = strtok(NULL,  " \n");
                    
                }
                
                args[cc] = NULL;
                strcpy(inputBuffer,history[number]);
                    
            }
            
            
        }
    }
    
    
}

int main(void)
{
    char inputBuffer[MAX_LINE];
    int flag;
    char *args[MAX_LINE/2 + 1] = {};
    //int should_run =1;
    int *should_run;
    pid_t pid;
    int seg_id;
    
    seg_id = shmget(IPC_PRIVATE, sizeof(int), S_IRUSR|S_IWUSR);
    should_run=(int*)shmat(seg_id,NULL,0);
    *should_run = 1;
    
    
    while (*should_run)
    {
        flag = 0;
        printf("osh>");
        fflush(stdout);
        
        fgets(inputBuffer,MAX_LINE,stdin);
        
        exclamation(args, inputBuffer, count);
        
        if(count < 10){
            strcpy(history[count], inputBuffer);
            strcpy(k,inputBuffer);
        }
        else {
            add(history, k);
        }
        count++;
        
         //exclamation(args, inputBuffer, count);
       
   
        memset(args, 0, MAX_LINE);
        char * a;
        a = strtok(inputBuffer, " \n");
        int counter = 0;
        
        //for new line
        while(a != NULL)
        {
            args[counter] = a;
            counter++;
            a = strtok(NULL,  " \n");
            
        }
        
        //for history
        if(args[0] != NULL)
            if(strcmp(args[0], "history") == 0)
                History();
        
        int i = 0;
        
        while(args[i] != NULL){
            
            //for &
            if(strcmp(args[i], "&" ) == 0)
            {
                flag = 1;
                args[i] = NULL;
                break;
            }
            i++;
            
        }
        
        
        
        if(args[i + 1] != NULL) flag = 0;
        
        //child
        pid = fork();
        
        if (pid < 0)
        {
            printf("failed.\n");
            exit (1);
        }
        
        else if (pid == 0)
        {
            
            if (execvp(args[0], args) == -1)
            {
               // printf("Error\n");
            }
            
            if(strcmp(args[0], "exit") == 0)
            {
                *should_run = 0;
                continue;
            }
        }
        
        //any flags
        else
        {
            
            if (flag == 0)
            {
                wait(NULL);
            }
        }
        
    }
}
