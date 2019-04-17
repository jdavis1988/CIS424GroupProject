/*objects.c, primary author: Jeremy*/


#include <stdio.h>

#include <string.h>
#include "userinput.h"

 
/*
#define DOOR_OPEN 1;

#define USE 2;

#define THROW 3;
*/
 

int token;

 
/*
struct Object

{

  char Str[100];

  int Attribute;

};

typedef struct Object Object;
*/
 

 
/*
int main()

{

  int Object_Update(int token, Object *arr_obj);

 

  Object arr_obj[3];

 

  int index = 0;

 

  for(index = 0; index < 3; index++)
    arr_obj->Attribute = index;

 

  token = 2; // User Inputs 2

 

  Object_Update(token, arr_obj); // Object Update function called passing user input

}
*/
 

 

/*

Function: Object_Update

Purpose:  Receive the token from user and update Attribute

*/

 

int Object_Update(int token, Object *arr_obj)

{

	/*  -> changed to . by Peter on April 16th.*/
  arr_obj.Attribute = token;
  
  
 return 0; 
}  
