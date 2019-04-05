//  main.c
//  C
//  Created by Jay Patel on 9/4/15.
//  Copyright (c) 2015 Jay Patel. All rights reserved.

#include <stdio.h>

int main() {
    
    int i, j ,x ;
    
    printf("Enter the nth value");                // This will prompt the user to enter the nth value
    
    scanf("%d",&x);                               // Scans the x variable
    
    for(i = 2; i <= x; i++)                       // This loop will start at x and ends at x so whatever
        
                                                  //  number you put in the printF statement
    {
        
        for(j = 2 ;j <= i ; j++)                  // resets it
        {
            
            if(i % j == 0)                         // Factor check
            {
                break;
            }
        }
        
        if( i == j)                              // since there is no factor so it will show prime no's.
        {
            printf("%d \n", i);
        }
    }
    
    return 0;
    
}
