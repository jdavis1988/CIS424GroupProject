/*main.c, primary author: Sam.*/


#include <stdio.h>
#include <string.h>
//#define MAX_FILE_LEN 500
/*Definition moved to userinput.h*/

/*Header files included by Peter, April 16th*/
#include "locations.h"
#include "objects.h"
#include "input.tab.h"
#include "userinput.h"
//PC

static char input[STR_SIZE];

void printImage(FILE *fptr);

void printImage(FILE *fptr)
{
    char readFileString[MAX_FILE_LEN];

    while(fgets(readFileString,sizeof(readFileString),fptr) != NULL)
        printf("%s",readFileString);
}

/*
static int playerInput()
{
    printf("\n> ");
    return fgets(input, sizeof(input),stdin) != NULL;
}


static int parse()
{
    char *action = strtok(input, " \n");

    if (action != NULL)
    {
        if (strcmp(action, "quit") == 0 || strcmp(action, "exit") == 0)
        {
            return 0;
        }
        else
        {
            printf("I dont know what to do!\n");
        }

    }
    return 1;
}
*/

int main()
{
   char *filename = "titleLoneWanderer.txt";
   int index = 0;
   int token;
   int room = 0;

   	
   	
   	FILE *fptr = NULL;

   if ((fptr = fopen(filename,"r")) == NULL)
   {
     fprintf(stderr,"error opening %s\n",filename);
     return 1;
   }

   printImage(fptr);

   fclose(fptr);


	/*Object array initialization moved into main() from Jeremy's objects.c. file. ~Peter, April 16th~*/
	Object arr_obj[NUMBER_OF_OBJECTS];
	for(index = 0; index < NUMBER_OF_OBJECTS; index++)
    	arr_obj->Attribute = index;
//PC

	Loc arr_loc[NUMBER_OF_ROOMS];
	/*Default blank/unlocked values for room attributes: Peter, April 16th*/
	for(index = 0; index < NUMBER_OF_ROOMS; index++)
	{
		arr_loc[index].player_present = 0;
	
		arr_loc[index].obj_front = 0;
		arr_loc[index].obj_back = 0;
		arr_loc[index].obj_left = 0;
		arr_loc[index].obj_right = 0;
		
		arr_loc[index].door_front = 0;
		arr_loc[index].door_back = 0;
		arr_loc[index].door_left = 0;
		arr_loc[index].door_right = 0;
	}
	
	
	/*Initialization of Damir's locations: Peter, April 16th*/
	
	/*Room 0: Clearing*/
	arr_loc[0].player_present = 1;
	arr_loc[0].door_back = 1; /*Locked.*/

   printf("Hello...Welcome to The Lone Wanderer.\n");
   printf("You wake up from a deep slumber in a small forest clearing,\n");
   printf("quickly realizing nothing around you seems familiar,\nyou stumble to your feet and begin dusting yourself off to take a look around...\n\n");
   printf("Directly in front of you there is a dirt road that cuts between the trees.\n");
   printf("You notice a hill with a small cottage at the top to your left.\n");
   printf("Looking towards your right you notice a small stream.\n");
   printf("(Hint: try testing out commands like: go east or go right to begin exploring!)\n");
   printf("What would you like to do?\n");
   
   /*Main input loop altered a bit by Peter on April 16th*/
   while (1)
   {
   		token = yyparse();
   		
   		if(token == QUIT)
   			break;
   
   		Object_Update(token, arr_obj);
   
   		Location_Update(token, room, arr_loc);
   }



   printf("\nGoodbye!\n");



return 0;
}
