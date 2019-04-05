//
//  server.c
//  HW2
//
//  Created by Jay Patel on 10/29/17.
//  Copyright © 2017 Jay Patel. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <string.h>
#include <math.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <openssl/sha.h>

#define PORT 8089

/**
 Prototyping the methods of the code that was provided
 **/

void inplace_reverse(char*str);
int binaryToDecimal(long n);
long decimalToBinary(long n);
void stringToAscii(char *s);
void stringToReverseAscii(char *s);
void stringToEncodedAscii(char *s, int new_sock);

/*
 At very starting I have Server side code, and at the very bottom I have the code that was provided, I could not access the
 methods from that file in this file. So I decided to just add the code that was provided at the end
 */

int main(int argc, char const *argv[])
{
    int server_side;
    int sock_new;
    int read;
    struct sockaddr_in add;
    
    int temp_adder;
    temp_adder = sizeof(add);
    char buff[1024] = {0};
    
    
    
    /*
     Using the int variable I made above and initializting to AF_INET and Sock stream becuase that way you can have a file
     descriptor for socket
     
     SOCK_STREAM: Provides sequenced, reliable and two-way connection.
     */
    
    if ((server_side = socket(AF_INET, SOCK_STREAM, 0)) == 0)
    {
        //this is used for Interpretting the value of errno as an error message. I have used perror throughout this file
        perror("Failed within the Socket, please try again");
        
        //this is used for the conventional status value forsuccess and failure. I have used EXIT_FAILURE thoughout this file
        exit(EXIT_FAILURE);
    }
    
    
    /*
     In here I'm attaching to the port that was specified in our case its 8087
     
     AF_net is an implementation of the TCP/IP protocol suite for the LINUX
     operating system.
     
     When INADDR_ANY is specified in the bind call, the socket will be bound to all local interfaces.
     */
    
    add.sin_family = AF_INET;
    add.sin_addr.s_addr = INADDR_ANY;
    // this fucntion will convert the unsigned integer hostlong from host byte order to network byte order.
    add.sin_port = htons(PORT);
    
    //using bind because we want to create a server socket.
    if (bind(server_side, (struct sockaddr *)&add, sizeof(add)) < 0)
    {
        perror("Failed because its still running, please try again");
        
        exit(EXIT_FAILURE);
    }
    
    //listen will mark a connection-mode socket, specified by the socket argument, as accepting connections.
    if (listen(server_side, 3) < 0)
    {
        perror("Hearing now...");
        
        exit(EXIT_FAILURE);
    }
    
    for(;;){
        
        
        sock_new = accept(server_side, (struct sockaddr *)&add,(socklen_t*)&temp_adder);
        
        
        int pid = fork();
        
        if(pid < 0 )
        {
            printf("ERROR");
        }
        else if(pid == 0)
        {
            close(server_side);
            while(1)
            {
                
                
                
                //read the string passed
                read = recv( sock_new , buff, 1024, 0);
                send(sock_new, buff, 1024, 0);
                //testing purpose
                //printf("%s\n",buffer );
                //size_t length = sizeof(buffer);
                
                /*
                 Doing the Hash part here
                 */
                
                char buf[SHA_DIGEST_LENGTH];
                unsigned char hash[SHA_DIGEST_LENGTH];
                SHA1((const unsigned char*)buff, 14, hash);
                for(int i =0; i< SHA_DIGEST_LENGTH; i++)
                {
                    sprintf((char*)&(buf[i*2]), "%02x", hash[i]);
                }
                
                stringToEncodedAscii(buf , sock_new);
                exit(0);
                break;
            }
            
            
            close(sock_new);
            exit(0);
            
        }
        close(sock_new);
        exit(0);
    }
    
    
}

/**
 Professor code starting here
 **/

//This map structure will be used to store the encodings
//Here, we have used decimal representation of the corresponding 3-bit binary numbers.
int binaryMap[8] = {6,7,5,4,3,2,0,1};
//inplace_reverse takes string as an input and reverses the contentsof the string inplace.
void inplace_reverse(char * str)
{
    if (str)
    {
        char * end = str + strlen(str) - 1;
        // swap the values in the two given variables
        // XXX: fails when a and b refer to same memory location
# define XOR_SWAP(a,b) do\
{\
a ^= b;\
b ^= a;\
a ^= b;\
} while (0)
        // walk inwards from both ends of the string,
        // swapping until we get to the middle
        while (str < end)
        {
            XOR_SWAP(*str, *end);
            str++;
            end--;
        }
# undef XOR_SWAP
    }
}
//binaryToDecimal will return the decimal number for the correspondingbinary form. for eg. decimal [5] for binary [101].
int binaryToDecimal(long n)
{
    int decimalNumber = 0, i = 0, remainder;
    while (n!=0)
    {
        remainder = n%10;
        n /= 10;
        decimalNumber += remainder*pow(2,i);
        ++i;
    }
    return decimalNumber;
}
//decimalToBinary will return the binary form for the correspondingdecimal form. for eg. binary [101] for decimal [5]
long decimalToBinary(long n) {
    int remainder;
    long binary = 0, i = 1;
    
    while(n != 0) {
        remainder = n%2;
        n = n/2;
        binary= binary + (remainder*i);
        i = i*10;
    }
    return binary;
}
//stringToAscii will print ASCII representation of a given string
void stringToAscii(char *s){
    char *ptr = s;
    char finalRes[256]="";
    
    //Go through each character in the string and append thecorrepsonding ASCII representaion to the final result
    while(*ptr){
        int asciiDecimal = (int)*ptr;
        int res = (int) decimalToBinary(asciiDecimal);
        
        char snum[5];
        sprintf(snum, "%d",res);
        strcat(finalRes,snum);
        
        ptr++;
    }
    
    //print the complete ASCII form
    printf("\nstringToAscii:: %s",finalRes);
    return;
}
//stringToReverseAscii will print the reverse ASCII representation ofthe given string
void stringToReverseAscii(char *s){
    char *ptr = s;
    char finalRes[256]="";
    
    //Visit each character in the string and append its ASCII    representation to a temp result
    while(*ptr){
        int asciiDecimal = (int)*ptr;
        int res = (int) decimalToBinary(asciiDecimal);
        
        char snum[5];
        sprintf(snum, "%d",res);
        strcat(finalRes,snum);
        
        ptr++;
    }
    
    //Reverse the temp result to get the final answer
    inplace_reverse(finalRes);
    
    printf("\nstringToReverseAscii:: %s",finalRes);
    return;
}
//stringToEncodedAscii prints the encoded representaion of the ASCIIrepresentaion of a given string(Encoding is based on encoding array atthe top of this file)
void stringToEncodedAscii(char *s,int new_sock){
    char *ptr = s;
    char finalRes[256]="";
    //First, get the ASCII representation of the given string
    while(*ptr){
        int asciiDecimal = (int)*ptr;
        int res = (int) decimalToBinary(asciiDecimal);
        
        char snum[10];
        sprintf(snum, "%d",res);
        strcat(finalRes,snum);
        
        ptr++;
    }
    
    //Since, we are encoding 3 bits at a time of the ASCII representaion, we need to pad extra 0s to the ASCII string to make
    //its length a multiple of 3.
    int lenOfFinalRes = (int) strlen(finalRes);
    if((lenOfFinalRes % 3) != 0){
        while((lenOfFinalRes % 3) != 0){
            strcat(finalRes,"0");
            lenOfFinalRes++;
        }
    }
    
    //printf("\nString length : %d\n",lenOfFinalRes);
    
    
    char *newPtr = finalRes;
    int j,k;
    char finalResEncoded[256] = "";
    
    //We now take 3 bits at a time, find the encoding from encodingtable at top and append the encoding to a new result string.
    for(j=0;j<(lenOfFinalRes/3);j++){
        char blk[10]= "";
        for(k=0;k<3;k++){
            //printf("\n next : %c\n",*newPtr);
            char ch[2];
            sprintf(ch, "%c",*newPtr);
            strcat(blk,ch);
            newPtr++;
        }
        
        long ret;
        char *ptr1;
        ret = strtol(blk, &ptr1, 10);
        int retI = binaryToDecimal(ret);
        int encodedRet = binaryMap[retI];
        int res = (int)decimalToBinary(encodedRet);
        
        char snum[10];
        sprintf(snum, "%d",res);
        
        //The following is to make sure that, we always have a 3 bitbinary representaion. For eg. decimal 3 is representated as 011 andnot 11
        char paddedStr[10] = "";
        sprintf(paddedStr, "%s","");
        int snumLen = (int)strlen(snum);
        if((snumLen%3) != 0){
            int z;
            for(z=0; z < (3-(snumLen%3)); z++)
            {
                strcat(paddedStr,"0");
            }
        }
        
        strcat(paddedStr,snum);
        
        // printf("\nnormal : %ld ; retI : %d; encodedRet : %d; encoded :%s",ret,retI,encodedRet ,paddedStr);
        strcat(finalResEncoded,paddedStr);
    }
    
    //made a new buffer
    char  buffer2[256] = {0};
    recv( new_sock , buffer2, 256, 0);
    printf("%s\n",buffer2);
    printf("\nstringToEncodedAscii :: %s",finalResEncoded);

    
    
    //doing part3 for true or false
    if(strcmp((char*)finalResEncoded, buffer2) == 0)
    {
        send(new_sock , "true" , 4 , 0 );
    }
    else
    {
        send(new_sock , "false" , 4 , 0 );
    }
    
    
}
/*
 Had to comment it out becuase there were more than one main and wasnt able to compile the code.
 
 int main() {
 char s[256];
 printf("enter the string : ");
 scanf("%s", s);
 
 stringToAscii(s);
 stringToReverseAscii(s);
 stringToEncodedAscii(s);
 return 0;
 }
 */
