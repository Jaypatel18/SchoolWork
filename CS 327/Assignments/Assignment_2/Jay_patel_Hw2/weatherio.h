//
//  weatherio.h
//  C
//
//  Created by Jay Patel on 9/30/15.
//  Copyright © 2015 Jay Patel. All rights reserved.
//

#ifndef weatherio_h
#define weatherio_h

#include <stdio.h>


int validate_format(char*);
int header_columns (char *);
int read_header(char *file_name, char **header);
int read_row(FILE * ,char ** , void **);

#endif /* weatherio_h */
