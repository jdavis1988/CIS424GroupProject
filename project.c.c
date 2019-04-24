
#include <stdio.h>
#include <string.h>

#define DOOR_OPEN 1
#define USE 2
#define THROW 3
#define MOVE 4


struct UserInventory
{
  int  Key[3];  
  char *NotificationMessage[100];
};
typedef struct UserInventory UserInventory;


int main()
{
  int index = 0;
  unsigned int token;
  int const counter = 7;

  int UserInventory_Move(int token, UserInventory *arr_obj);
  int UserInventory_Open(int token, UserInventory *arr_obj);  
  int UserInventory_List(UserInventory *arr_obj);
  
  UserInventory arr_obj[counter]; // Define arr_obj


  for(index = 0; index < counter; index++)
    {
      arr_obj[0].Key[index] = index;
    }

  
  //arr_obj[0].NotificationMessage[index] = "";
  
  // Populate the UserInventory with values
  //for(index = 0; index < counter; index++)
  //  {
  //    arr_obj[0].Key[index] = index;

  //    arr_obj[0].NotificationMessage[index] = "Missing Necessary Key:Keep Searching";

  //  }

  //---------------------------------
  // Ask for user input for move
  printf("\nEnter move token:");  
  scanf("%d", &token); //User Input for move

  // Object Update function called passing user input
  UserInventory_Move(token, arr_obj);

  //------------------------------
  // Ask for user input for open
  printf("\nEnter use:");  
  scanf("%d", &token); //User Input for open
  UserInventory_Open(token, arr_obj);

  // Print out contents of Object
  //UserInventory_List(arr_obj); 
}


/*
  Function: UserInventory_Update
  Purpose:  Receive the token from user and update
*/

int UserInventory_Move(int token, UserInventory *arr_obj)
{
  if(token > 0 && token < 7)
    {
      printf("Key: %o \n", MOVE);      
    }
  else
    {
      printf("Empty \n\n");
    }
  

    // arr_obj[0].Str[token] = "Door is Open";
}

/*
  Function: UserInventory_Open
  Purpose:  Receive the token from user. In this context the token is 'use'.
*/

int UserInventory_Open(int token, UserInventory *arr_obj)
{
  if(token > 0 && token < 7)
    {
      printf("Door Open \n\n");      
    }
  else
    {
      printf("Missing necessary key. Keep searching! \n\n");
    }
  

    // arr_obj[0].Str[token] = "Door is Open";
}

/*
  Function: UserInventory_List
  Purpose:  Print out contents of UserInventory
*/

int UserInventory_List(UserInventory *arr_obj)
{
  int index = 0;
  
  for(index = 0; index < 7; index++)
   
    printf("Token: %d has a value of: %s\n", arr_obj[0].Key[index], arr_obj[0].NotificationMessage[index]);
}

