
//  main.c
//  Assignment1.01
//  Created by Jay Patel on 9/1/16.
//  Copyright © 2016 Jay Patel. All rights reserved.


#include <stdio.h>
#include <time.h>
#include <stdlib.h>

// Creating a struct here so that I can use this struct later in the program to
// initialize width, height, x_value, y_value

struct room
{
    int width;
    int height;
    int x_value;
    int y_value;
};

char dung[80][21]; // as mentioned in the specifiications

//In this struct I am using mode operator so that I dont get larger x,y, width and height

struct room room_generator()
{
    struct room space;
    space.x_value = (rand() %78) + 1;
    space.y_value = (rand() % 19) + 1;
    space.width = (rand() %5) + 4;
    space.height = (rand() %4) + 3;

    //Checking if the x and width is greater than 78
    if(space.x_value + space.width >= 78)
    {
      //substracting it with width
        space.x_value -= - space.width;
    }
    //similar to above checking if it is greater than 19
    if(space.y_value + space.height >= 19)
    {
      // substracting from height
        space.y_value -= space.height;
    }
    
    return space;
}

int print_dung()//checking the column first and then row, initializing them into my char array so that it can print both row and column and then a new line
{
    int r;
    int c;
    // should be less than 21 as mentioned in the PDF
    for(c= 0 ; c < 21; c ++)
    {
      // Should be less than 80 as mentioned in PDF
        for(r = 0 ; r < 80; r ++)
        {
	  
            printf("%c", dung[r][c]);
        }
        printf("\n");
    }
    return 0;
}

// This will print room and takes a parameter space which is struct room type

int room_print (struct room space)
{
    int row;
    int col;
   
    int rS = (space.x_value + space.width + 1);
    int cS = (space.y_value + space.height + 1);
    // checking for row and stopping at less than rs
    for(row = space.x_value; row < rS; row++)
    {
      //checking for the column and stopping at less than cs
        for(col = space.y_value; col < cS; col++)
        {
            dung[row][col] = '.';
        }
    }
    
    return 0;
    
}

// This method takes 2 parameters of type struct that will keep track of my two values
int room_allocation(struct room one, struct room two)
{
    
    int min1 = (one.x_value - 1);
    int plus1 = (one.x_value + one.width + 1);
    int up1 = (one.y_value - 1);
    int down1 = (one.y_value + one.height + 1);
    
    int min2 = (two.x_value);
    int plus2 = (two.x_value + two.width);
    int up2 = (two.y_value);
    int down2 = (two.y_value + two.height);
    
    if(min1 <= plus2 && plus1 >= min2 && up1 <= down2 && down1 >= up2)
    {
        return -1;
    }
    
    return 0;
}

// made another struct which will help me compare two sides and see if they are bigger than 0 
struct room clean_r (struct room one, struct room two, struct room three, struct room four,
                     struct room five, struct room six)//
{
    while(room_allocation(one, two) < 0 || room_allocation(one, three) < 0 || room_allocation(one, four) < 0 || room_allocation(one, five) < 0 || room_allocation(one, six) < 0)
    {
        one = room_generator();
    }
    return one;
}
// This takes 7 parameters and 6 rooms as required from the PDF
int clean_dung(struct room one, struct room two, struct room three, struct room four,
               struct room five, struct room six, struct room space[6])
{
    one = clean_r(one, two, three, four, five, six);
    two = clean_r(two,one,three, four, five, six);
    three = clean_r(three, one, two, four, five, six);
    four = clean_r(four, one, two, three, five, six);
    five = clean_r(five, one, two, three, four, six);
    six = clean_r(six, one, two, three, four, five);
    
    space[0] = one;
    space[1] = two;
    space[2] = three;
    space[3] = four;
    space[4] = five;
    space[5] = six;
    return 0;
}
// In this method I am making corridors

int build_cord (struct room one, struct room two)
{
  
    
    int centerX1 = one.x_value + (one.width/2);
    int centerY1 = one.y_value + (one.height/2);
    int centerX2 = two.x_value + (two.width/2);
    int centerY2 = two.y_value + (two.height/2);
    
    // a left of b
    if(centerX1 < centerX2)
    {
        while(centerX1 < centerX2)
        {
            //For empty
            if(dung[centerX1][centerY1] == ' ')
            {
                //Make a door
                dung[centerX1][centerY1] = '#';
            }
	    //move to next
            centerX1 ++;
        }

	// for below
	if(centerY1 < centerY2)
    {
        while(centerY1 < centerY2) 
        {
	  // open space
	  if(dung[centerX1][centerY1] == ' ') 
            {
	      // draw the stage
                dung[centerX1][centerY1] = '#';
            }
	  //Move next
	  centerY1++; 
        }
    }
	// if not anything
    else
    {
      //for higher
        while(centerY1 > centerY2)
        {
	  //open space
            if(dung[centerX1][centerY1] == ' ')
            {
	      // build the stage using hashtags
                dung[centerX1][centerY1] = '#';
            }
	    //down
            centerY1--;
        }
    }
}
    // if nothing move here 
    else
    {
        while(centerX2 < centerX1)
        {
	  //open space
            if((dung[centerX2][centerY2] == ' '))
            {
	      //building the stage
                dung[centerX2][centerY2] = '#';
            }
	    // building up
            centerX2++;
        }
        
        if(centerY2 < centerY1)
        {
            while(centerY2 < centerY1)
            {
	      //space
                if(dung[centerX2][centerY2] == ' ')
                {
		  //stage
                    dung[centerX2][centerY2] = '#';
                }
		//build up
                centerY2++;
            }
        }
        else
        {
            while(centerY2 > centerY1)
            {
                if(dung[centerX2][centerY2] == ' ' )
                {
                    dung[centerX2][centerY2] = '#';
                }
		//build down
                centerY2--;
            }
        }
    }
    return 0;
}

//Just allocating the spaces here

int corridors (struct room spaces[6])
{
    build_cord(spaces[0], spaces[1]);
    build_cord(spaces[1], spaces[2]);
    build_cord(spaces[2], spaces[3]);
    build_cord(spaces[3], spaces[4]);
    build_cord(spaces[4], spaces[5]);
    return 0;
}

int main(int argc, const char * argv[]) {
    int i;
    int j;
    int col;
    int row;
    srand(time(NULL));
    
    
    int nr = 6;
    struct room spaces[nr];
    
    for(col = 0 ; col < 6; col ++)
    {
      //printf("Made it here");
        spaces[col] = room_generator();
	//printf("Made it here - after room generation");
    }
    //printf("Made it here- after for loop");
    clean_dung(spaces[0], spaces[1], spaces[2], spaces[3], spaces[4], spaces[5], spaces);
    
    
    for(i =0;i < 21; i++)
    {
      //printf("Made it here - after i");
        for(j =0 ; j < 80; j++)
        {
            dung[j][i] = ' ';
	   // printf("Made it here after the spaces");
	    //printf("%d\n", i);
	    // printf("%d\n",j);
	    
        }
	//printf("exited the inside loop");
	
    }
    //printf("exited outside loop");
    
    for(row = 0 ; row < 6; row++)
    {
      //printf("Made it here in the row section");
        room_print(spaces[row]);
      //printf("Made it here after the spaces in the row");
    }
    corridors(spaces);
    //printf("TEst");
    print_dung();
    //printf("Test2");
    
    return 0;
}

