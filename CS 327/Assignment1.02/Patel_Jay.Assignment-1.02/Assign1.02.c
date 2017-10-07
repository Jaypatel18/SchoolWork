
//  Assign1.02.c
//  Assignment1.02
//  Created by Jay Patel on 9/1/16.
//  Copyright © 2016 Jay Patel. All rights reserved.


#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <endian.h>

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
int hardness[80][21]; //New


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
            if(dung[centerX2][centerY2] == ' ')
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

//New for assignment 1.02
// In this struct I am allocating them to the one that I created for the assingment 1

struct room inside (int x_cor, int y_cor, int w_cor, int h_cor)
{
    struct room room;
    
    room.height = h_cor;
    room.width = w_cor;
    room.x_value = x_cor;
    room.y_value= y_cor;
    return room;
    
}

typedef struct
{
    struct room *arr;
    size_t allocated;
    size_t room1;
    
}space_arr;

//mallocing the size of the struct room, this method takes 2 parameters and setting them with the struct that I made before

int room_all(space_arr *one, size_t size)
{
    one -> arr = (struct room *) malloc(size *sizeof(struct room));
    one -> allocated = 0;
    one -> room1 = size;
    return 0;
}
// In this method, I a m passing one parameter *one
int space_mem(space_arr *one)
{
     //free the memory
    free(one -> arr);
    one -> arr = NULL;
    one -> allocated = one -> room1 = 0;
    return 0;
}
//this method takes two parameters where one of them is the struct of number and another is pointer to the rooms
int room_arr (space_arr *one, struct room num)
{
    //checking if the first is allocated and is equal to the room
    if(one -> allocated == one -> room1)
    {
        one -> room1 *= 2;
        one -> arr = (struct room*) realloc(one -> arr, one -> room1 * sizeof(struct room));
    }
    one -> arr[one -> allocated++] = num;
    return 0;
}
// In this I am going to loop through until the size of the room
space_arr to_Room_Array(struct room room[6])
{
    int t = 0;
    space_arr array;
    room_all(&array, 6);
     //looping until the size of the room
    for(t = 0; t <6; t ++)
    {
        //assigning the address of the array and to the room size
        room_arr(&array, room[6]);
    }
    
    return array;
}

space_arr roomarr;

int pra (space_arr *t)
{
    int j;
     // looping through until the size of where it is located
    for(j = 0 ; j < t -> allocated; j++)
    {
        //printing the room
        room_print(t ->arr[j]);
    }
    return 0;
}
//this will printout the output
int output ()
{
    int row, col;
    //looping until 21 according to the requirements in the assignment
    for(col = 0 ; col < 21 ;col ++)
    {
        // this is for the row instead of columna and checking until 80, as requested in t
        for(row = 0 ; row < 80 ; row ++)
        {
            //printing using the hardness inbuild function for row and column
            
            printf("%d %d %d \n", row, col, hardness[row] [col]);
        }
            //new line
        printf("\n");
    }
    
    return 0;
}
// Checking for the hardness for the assignemnt as requested in the PDF
int hardnes (char dung[80][21])
{
    int r, c, vol;
    srand(time(NULL));
    //checking for the row,until 80

    for(r= 0 ; r< 80; r++)
    {
        //checking for the coulmn until 21
        for(c = 0 ; c < 21; c++)
        {
            //checking few requiremnts and seeing if they are equal to . or #
            if(dung[r][c] == '.' || dung[r][c] == '#')
            {
                //assinging the hardness
                hardness[r][c] = 0;
            }
            else if (r == 0 || r == 79 || c == 0 || c == 20)
            {
                hardness[r] [c] = 255;
            }
            else
            {
                vol = (rand() % 255) + 1;
                hardness [r] [c] = vol;
            }
        }
    }
    return 0;
}
//this was the main for the previous assignment

int dungeon()
{
    int i;
    int j;
    int col;
    int row;
    srand(time(NULL));
    
    int nr;
    nr = 6;
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
    hardnes(dung);
    roomarr = to_Room_Array(spaces);
    //printf("TEst");
    print_dung();
    //printf("Test2");
    
    return 0;
}
// I am checking here for save dungeon
int save(int hardness[80][21], space_arr *two, int i)
{
    // Home dirc.
    char *temp = getenv("HOME");
    
     //flag
    if(i == 0)
    {
        //path
        char tem[] = "/.rlg327/dungeon";
        strcat(temp, tem);
    }
    //file
    
    FILE *fp;
    int l;
    int m;
    
    //using professor's notes
    uint32_t fz = 1694 + (two -> allocated *4);
    uint32_t fv = 0;
    unsigned char buf[1680];
    
    int o = 0;
      //looping until 21 as requested in PDF
    for(m = 0 ; m <21 ;  m++)
    {
        //loopig until 89 as requested in PDF
        for(l = 0 ; l < 80; l++)
        {
            buf[o] = (unsigned char) hardness[l][m];
            o++;
        }
    }
    char req[6] = "RLG327";
    //opening the file and writing it in binary
    fp = fopen(temp, "wb");
    //checking for flags
    if(!fp)
    {
        printf("%s\n", temp);
        printf("FILE NOT FOUND ERROR!!!");
        return 0;
    }
    
    unsigned char buf2[two -> allocated *4];
    // checking until the alloacated space
    
    for(o = 0 ; o < two -> allocated ; o++)
    {
        struct room room = two -> arr[o];
        buf2[o*4] = (unsigned char) room.x_value;
        buf2[o*4+2] = (unsigned char) room.y_value;
        buf2[o*4+1] = (unsigned char) room.width;
        buf2[o*4+3] = (unsigned char) room.height;
    }
    
    fwrite(req, 1, 6, fp);
    fv = htobe32(fv);
    fwrite(&fv, sizeof(uint32_t), 1, fp);
    fz = htobe32(fz);
    fwrite(&fz, sizeof(uint32_t), 1, fp);
    
    fwrite(buf, 1, 1680, fp);
    fwrite(buf2, 1, two -> allocated * 4, fp);
    
    fclose(fp);
    return 0;
}
// This is for load, I did very similar to save method.
int load ()
{
    int o, m, l;
    char *temp = getenv("HOME");
    char tem[] = "/.rlg327/dungeon";
    strcat(temp, tem);
    FILE *fp;
    
    
    //using professor's notes
    
    uint32_t fz;
    uint32_t fv;
    unsigned char buf[1680];
    char req[6];
    space_arr one;
    room_all(&one, 6);
    
	printf("path: %s\n", temp);

    fp = fopen(temp, "r");
    
        if(!fp)
        {
            printf("FILE NOT FOUND\n");
            return 0;
        }
    
    fread(req, 1, 6, fp);
    fread(&fv, sizeof(uint32_t), 1, fp);
    fv = be32toh(fv);
    fread(&fz, sizeof(uint32_t), 1, fp);
    fz = be32toh(fz);
    uint32_t appear = 1694;
    uint32_t num = (fz - appear)/4;
    unsigned char buf2[num*4];
    
    fread(buf, 1, 1680, fp);
    fread(buf2, 1, appear * 4, fp);
    
    fclose(fp);
    
    for(o = 0 ; o < num ; o ++)
    {
        struct room room;
        room.x_value = buf2[o*4];
        room.y_value = buf2[o*4 + 2];
        room.width = buf2[o*4 + 1];
        room.height = buf2[o*4 + 3];
        room_arr(&one, room);
    }
    
    o = 0;
    for(m = 0; m < 21; m++)
    {
        for(l = 0; l < 80; l++)
        {
            hardness[l][m] = (int) buf[o];
            o++;
        }
    }
    
    for(m = 0 ; m < 21; m++)
    {
        for(l = 0; l < 80; l++)
        {
            dung[l][m] = ' ';
        }
    }
    
    pra(&one);
    
    for(m = 0; m < 21; m++)
    {
        for(l = 0 ; l < 80; l++)
        {
            if(hardness[l][m] == 0 && dung[l][m] == ' ' && !(dung[l][m] == '.'))
            {
                dung[l][m] = '#';
            }
        }
    }
    pra(&one);
    print_dung();
    roomarr = one;
    
    return 0;
}
//checking my methods
int main (int argc, char *argv[])
{
    int m = 0, d = 0, o;
    
    enum output1
    {
        store,
        freight,
        add,
        wrong
    };
    
    enum output1 newoutput1 = wrong;
    // checking for the command line arguments that was requested in PDF
    for(o = 0;o < argc ;o++)
    {
        if(strcmp("--save", argv[o]) == 0)
        {
            m = 1;
        }
        if(strcmp("--load", argv[o])== 0)
        {
            d = 1;
        }
    }
        // if they are both 1 we will save
    
    if(m == 1 && d == 1)
    {
        newoutput1 = add;
    }
    // if one of them is one we will store
    else if (m == 1)
    {
        newoutput1 = store;
    }
    // if another one is one we will freight
    else if (d == 1)
    {
        newoutput1 = freight;
    }
    
    else
        // if nothing
    {
        printf("Wrong!");
        dungeon();
        return -1;
    }
        // this case we will call laod function
    if(newoutput1 == freight)
    {
        load();
    }
    //if not we will call dungeon method
    
    else if(newoutput1 == store)
    {
        dungeon();
        save(hardness, &roomarr, 0);
    }
    //if nothing then just load the dungeon
    else if (newoutput1 == add)
    {
        load();
        save(hardness, &roomarr, 1);
    }
    
    // freespace_arr(roomarr);

    return 0;
}
