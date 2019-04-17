/*Header file by Peter, April 16th*/

#include <stdio.h>
#include <stdlib.h>
#include "userinput.h"

   	/*Implementation of location struct by Peter on April 16th*/
   	struct Loc
   	{
   		char name[STR_SIZE];
   		
   		int player_present;
   		
   		int obj_front;
   		char name_obj_front[STR_SIZE];
   		
   		int obj_back;
   		char name_obj_back[STR_SIZE];
   		
   		int obj_left;
   		char name_obj_left[STR_SIZE];
   		
   		int obj_right;
   		char name_obj_right[STR_SIZE];
   		
   		int door_front;
   		int door_back;
   		int door_left;
   		int door_right;
   	};
   	typedef struct Loc Loc;
   	//PC
   	

int Location_Update(int token, int room, Loc arr_loc[NUMBER_OF_ROOMS]); 


