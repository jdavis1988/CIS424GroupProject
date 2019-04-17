/*Header file by Peter on April 16th*/

#include <stdio.h>
#include <stdlib.h>
#include "userinput.h"

   /*Jeremy's object struct*/
struct Object
{
  	char Str[STR_SIZE];
  	int Attribute;
};
typedef struct Object Object;
//PC

int Object_Update(int token, Object arr_obj[NUMBER_OF_OBJECTS]);

