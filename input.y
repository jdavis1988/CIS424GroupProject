%{

//Peter Carle
//Spring 2019

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/userinput.h"


//#define STR_SIZE 512

typedef struct
{
	int ival;
	int type;
	char str[STR_SIZE];
}langstruct;

#define YYSTYPE langstruct

int yylex();
void yyerror(char *s);

%}

%token tGO tGET
%token tUSE
%token tDROP
%token tTHROW
%token tKILL
%token tUNLOCK
%token tOPEN
%token tUP tDOWN tRIGHT tLEFT
%token tINVENTORY tHELP tQUIT
%token tSWIM
%token tMISC_WORD

%define locations

%%

/*
program	: statement_list
	{ printf("STRING: %s\n", $1.str); }
		;

statement_list : statement_list statement '\n' newline
														
				{ strncpy($$.str, $1.str, STR_SIZE); strncat($$.str, $2.str, STR_SIZE); }
														
		| statement '\n' newline { strncpy($$.str, $1.str, STR_SIZE); }
		;
*/
		
statement	: tGO '\n'
				 { strncpy($$.str, $1.str, STR_SIZE); return GO; } 
	|	tUSE '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return USE; } 
	|	tDROP '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return DROP; } 
	|	tTHROW '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return THROW; }
	|	tKILL '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return KILL; }	
	|	tUNLOCK '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return UNLOCK; }
	|	tOPEN '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return OPEN; }
	|	tUP '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return UP; }	
	|	tDOWN '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return DOWN; } 
	|	tRIGHT '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return RIGHT; } 
	|	tLEFT '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return LEFT; }
	|	tINVENTORY '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return INVENTORY; }	
	|	tHELP '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return HELP; } 
	|	tSWIM '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return SWIM; }
	|	tGET '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return GET; } 	
	|	tQUIT '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); return QUIT; }			
	|	tMISC_WORD '\n'
				{ strncpy($$.str, $1.str, STR_SIZE); printf("Miscellaneous words not yet implemented.\n"); }
;

/*
newline		: 	
				'\n' newline	
									{ /*Eat the trailing newlines. }
			|						
									
			;
*/
%%

/*
void main()
{
	yyparse();
}
*/
