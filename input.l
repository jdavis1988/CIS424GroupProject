%{

//Peter Carle
//Spring 2019
//Agile Project: User input module

typedef struct
{
	int ival;
	int type;
	char str[512];
}langstruct;

#define YYSTYPE langstruct
#include <string.h>
#include "input.tab.h"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;

%}

%option yylineno

DIGIT  [0-9]
LETTER [A-Za-z]
WHITE  [ |\t|\f|\r|\v]

%%

{WHITE}
		
(?i:go|proceed|move|travel|walk|run)	{ strcpy(yylval.str, yytext); return tGO; }

(?i:get|obtain|grab|acquire|"pick up")	{ strcpy(yylval.str, yytext); return tGET; }

(?i:use|utilize|"make use of")			{ strcpy(yylval.str, yytext); return tUSE; }

(?i:drop|"let go of"|release)			{ strcpy(yylval.str, yytext); return tDROP; }

(?i:throw|hurl|toss|fling|chuck)		{ strcpy(yylval.str, yytext); return tTHROW; }

(?i:kill|slaughter|murder|"put to death")	{ strcpy(yylval.str, yytext); return tKILL; }

(?i:unlock)								{ strcpy(yylval.str, yytext); return tUNLOCK; }

(?i:open)								{ strcpy(yylval.str, yytext); return tOPEN; }

(?i:north|up)							{ strcpy(yylval.str, yytext); return tUP; }

(?i:south|down)							{ strcpy(yylval.str, yytext); return tDOWN; }

(?i:west|left)							{ strcpy(yylval.str, yytext); return tLEFT; }

(?i:east|right)							{ strcpy(yylval.str, yytext); return tRIGHT; }

(?i:inventory)							{ strcpy(yylval.str, yytext); return tINVENTORY; }

(?i:help|"help me"|"i don't know what i'm doing"|\?|directions)	{ strcpy(yylval.str, yytext); return tHELP; }

(?i:swim) 								{ strcpy(yylval.str, yytext); return tSWIM; }

{LETTER}+								{ strcpy(yylval.str, yytext); return tMISC_WORD; }

\n	{ return yytext[0]; }
.	{ return yytext[0]; }

%%

/*
Keywords:

go proceed move travel walk run

get obtain grab acquire "pick up"

use utilize "make use of"

drop "let go of" release

throw hurl toss fling chuck

kill slaughter murder "put to death"

unlock

open
*/


void yyerror(char *s)  /* Called by yyparse on error*/ 
{
  printf ("\terror: %s\n", s);
  printf ("ERROR: %s at line %d\n", s, yylineno);
}
