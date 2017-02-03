//
//  testformat.c
//  C
//
//  Created by Jay Patel on 9/21/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//


#include <string>
#include <stdio.h>
#include "weatherio.h"
#define MAX_LINE_LENGTH 500;
/**
    This will take the first command line argument and then varieifes that the files is a valid formatted file or not.
*/
int main(int argc,  char * argv[])
{
    int error;

    error = validate_format(argv[1]);
    
    if(error == 0) 
    {
        
        printf("It is valid");
        
    }
    else
    {
        printf("It is not valid");
    }
    



//    char *fn1 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t0.csv";
//    char *fn2 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t1.csv";
//    char *fn3 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t2.csv";
//    char *fn4 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t3.csv";
//    char *fn5 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t4.csv";
//    char *fn6 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t5.csv";
//    char *fn7 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t6.csv";
//    char *fn8 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t7.csv";
//    char *fn9 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t8.csv";
//    char *fn10 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t9.csv";
//    char *fn11 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t10.csv";
//    char *fn12 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t11.csv";
//    char *fn13 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t12.csv";
//    char *fn14 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t13.csv";
//    char *fn15 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t14.csv";
//    char *fn16 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t15.csv";
//    char *fn17 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t16.csv";
//    char *fn18 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t17.csv";
//    char *fn19 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t18.csv";
//    char *fn20 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t19.csv";
//    char *fn21 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t20.csv";
//    char *fn22 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t21.csv";
//    char *fn23 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t22.csv";
//    char *fn24 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t23.csv";
//    char *fn25 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t24.csv";
//    char *fn26 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t25.csv";
//    char *fn27 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t26.csv";
//    char *fn28 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t27.csv";
//    char *fn29 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t28.csv";
//    char *fn30 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t29.csv";
//    char *fn31 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t30.csv";
//    char *fn32 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t31.csv";
//    char *fn33 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t32.csv";
//    char *fn34 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t33.csv";
//    char *fn35 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t34.csv";
//    char *fn36 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t35.csv";
//    char *fn37 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/t0\36.csv";
//    
//    
//    char *fn38 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid0.csv";
//    char *fn39 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid1.csv";
//    char *fn40 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid2.csv";
//    char *fn41 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid3.csv";
//    char *fn42 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid4.csv";
//    char *fn43 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid5.csv";
//    char *fn44 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/header_invalid6.csv";
//    char *fn45 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid0.csv";
//    char *fn46 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid1.csv";
//    char *fn47 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid2.csv";
//    char *fn48 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid3.csv";
//    char *fn49 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid4.csv";
//    char *fn50 ="/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid5.csv";
//    char *fn51 = "/Users/jaypatel/Desktop/Fall_2015/CS_327/Assignments/Assignment_2/HW2_byInstructor/data_invalid6.csv";
//    
//    printf("%d\n",validate_format(fn1));
//    printf("%d\n",validate_format(fn2));
//    printf("%d\n",validate_format(fn3));
//    printf("%d\n",validate_format(fn4));
//    printf("%d\n",validate_format(fn5));
//    printf("%d\n",validate_format(fn6));
//    printf("%d\n",validate_format(fn7));
//    printf("%d\n",validate_format(fn8));
//    printf("%d\n",validate_format(fn9));
//    printf("%d\n",validate_format(fn10));
//    printf("%d\n",validate_format(fn11));
//    printf("%d\n",validate_format(fn12));
//    printf("%d\n",validate_format(fn13));
//    printf("%d\n",validate_format(fn14));
//    printf("%d\n",validate_format(fn15));
//    printf("%d\n",validate_format(fn16));
//    printf("%d\n",validate_format(fn17));
//    printf("%d\n",validate_format(fn18));
//    printf("%d\n",validate_format(fn19));
//    printf("%d\n",validate_format(fn20));
//    printf("%d\n",validate_format(fn21));
//    printf("%d\n",validate_format(fn22));
//    printf("%d\n",validate_format(fn23));
//    printf("%d\n",validate_format(fn24));
//    printf("%d\n",validate_format(fn25));
//    printf("%d\n",validate_format(fn26));
//    printf("%d\n",validate_format(fn27));
//    printf("Now it's invalid format:\n");
//    printf("%d\n",validate_format(fn28));
//    printf("%d\n",validate_format(fn29));
//    printf("%d\n",validate_format(fn30));
//    printf("%d\n",validate_format(fn31));
//    printf("%d\n",validate_format(fn32));
//    printf("%d\n",validate_format(fn33));
//    printf("%d\n",validate_format(fn34));
//    printf("%d\n",validate_format(fn35));
//    printf("%d\n",validate_format(fn36));
//    printf("%d\n",validate_format(fn37));
//    printf("%d\n",validate_format(fn38));
//    printf("%d\n",validate_format(fn39));
//    printf("%d\n",validate_format(fn40));
//    printf("%d\n",validate_format(fn41));
//    printf("%d\n",validate_format(fn42));
//    printf("%d\n",validate_format(fn43));
//    printf("%d\n",validate_format(fn44));
//    printf("%d\n",validate_format(fn45));
//    printf("%d\n",validate_format(fn46));
//    printf("%d\n",validate_format(fn47));
//    printf("%d\n",validate_format(fn48));
//    printf("%d\n",validate_format(fn49));
//    printf("%d\n",validate_format(fn50));
//    printf("%d\n",validate_format(fn51));
    
    return 0;

}
