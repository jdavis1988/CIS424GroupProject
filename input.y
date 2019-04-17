%{

//Peter Carle
//Spring 2019

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "userinput.h"


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
%token tINVENTORY tHELP
%token tSWIM
%token tMISC_WORD

%define locations

%%

program	: statement_list
	{ printf("STRING: %s\n", $1.str); }
		;

statement_list : statement_list statement '\n' newline
														
				{ strncpy($$.str, $1.str, STR_SIZE); strncat($$.str, $2.str, STR_SIZE); }
														
		| statement '\n' newline { strncpy($$.str, $1.str, STR_SIZE); }
		;
		
statement	: tGO { strncpy($$.str, $1.str, STR_SIZE); return GO; } 
	|	tUSE
				{ strncpy($$.str, $1.str, STR_SIZE); } 
	|	tDROP
				{ strncpy($$.str, $1.str, STR_SIZE); } 
	|	tTHROW
				{ strncpy($$.str, $1.str, STR_SIZE); }
	|	tKILL
				{ strncpy($$.str, $1.str, STR_SIZE); }	
	|	tUNLOCK
				{ strncpy($$.str, $1.str, STR_SIZE); }
	|	tOPEN
				{ strncpy($$.str, $1.str, STR_SIZE); }
	|	tUP
				{ strncpy($$.str, $1.str, STR_SIZE); }	
	|	tDOWN
				{ strncpy($$.str, $1.str, STR_SIZE); } 
	|	tRIGHT
				{ strncpy($$.str, $1.str, STR_SIZE); } 
	|	tLEFT
				{ strncpy($$.str, $1.str, STR_SIZE); }
	|	tINVENTORY
				{ strncpy($$.str, $1.str, STR_SIZE); }	
	|	tHELP
				{ strncpy($$.str, $1.str, STR_SIZE); } 
	|	tSWIM
				{ strncpy($$.str, $1.str, STR_SIZE); } 				
	|	tMISC_WORD
				{ strncpy($$.str, $1.str, STR_SIZE); }
;

newline		: 	
				'\n' newline	
									{ /*Eat the trailing newlines.*/ }
			|						
									
			;

%%

/*
void main()
{
	yyparse();
}
*/
