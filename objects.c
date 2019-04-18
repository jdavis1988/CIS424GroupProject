
/*objects.c, primary author: Jeremy*/




#include <stdio.h>

#include <string.h>

#include "include/userinput.h"
#include "include/objects.h"


 
/*
#define DOOR_OPEN 1;

#define OPEN 1;


#define USE 2;

#define THROW 3;
*/
 


int token;

 
/*
struct Object
=======
struct UserInventory


{

  int  Key[3]; 

  char *Str[100];

};


typedef struct Object Object;
*/

typedef struct UserInventory UserInventory;


 

 
/*
int main()

{

  int index = 0;

  int token;

 

  int UserInventory_Update(int token, UserInventory *arr_obj);

  int UserInventory_List(UserInventory *arr_obj);

 

  UserInventory arr_obj[3]; // Define arr_obj

 

  // Populate the UserInventory with values

  for(index = 0; index < 3; index++)

    arr_obj->Attribute = index;


    {

      arr_obj[0].Key[index] = index;

      arr_obj[0].Str[index] = "Missing Necessary Key:Keep Searching";


 

    }

 

  // Ask for user input

  printf("\nEnter token:"); 

  scanf("%d", &token); //User Input

 

  // Object Update function called passing user input

  UserInventory_Update(token, arr_obj);

 

  // Print out contents of Object

  UserInventory_List(arr_obj);

}
*/
 

 

/*

  Function: UserInventory_Update

  Purpose:  Receive the token from user and update

*/

 

int UserInventory_Update(int token, UserInventory *arr_obj)

{


  *arr_obj->Key = token;
  
  

 // arr_obj[0].Str[token] = "Door is Open"; Syntax error. Will fix later. 

  
  return 0;
}

 

/*

  Function: UserInventory_List

  Purpose:  Print out contents of UserInventory

*/

 

int UserInventory_List(UserInventory *arr_obj)

{

  int index = 0;

 

  for(index = 0; index < 3; index++)

    printf("Token: %d has a value of: %s\n", arr_obj[0].Key[index], arr_obj[0].Str[index]);

