%{
#include <string.h>
#include "parser.hpp"

int charPos=1;
int EM_tokPos;

extern void yyerror(char *);

extern "C" int yywrap(void)
{
 charPos=1;
 return 1;
}


void adjust(void)
{
 EM_tokPos=charPos;
 charPos+=yyleng;
}

%}

%%
" "	 {adjust(); continue;}
\t	 {adjust(); continue;}
\n	 {adjust(); /* EM_newline(); */ continue;}
","  {adjust(); return COMMA;}
":"  {adjust(); return COLON;}
";"  {adjust(); return SEMICOLON;}
"("  {adjust(); return LPAREN;}
")"  {adjust(); return RPAREN;}
"["  {adjust(); return LBRACK;}
"]"  {adjust(); return RBRACK;}
"{"  {adjust(); return LBRACE;}
"}"  {adjust(); return RBRACE;}
"."  {adjust(); return DOT;}
"+"  {adjust(); return PLUS;}
"-"  {adjust(); return MINUS;}
"*"  {adjust(); return TIMES;}
"/"  {adjust(); return DIVIDE;}
"="  {adjust(); return EQ;}
"<>" {adjust(); return NEQ;}
"<"  {adjust(); return LT;}
"<=" {adjust(); return LE;}
">"  {adjust(); return GT;}
">=" {adjust(); return GE;}
"&"  {adjust(); return AND;}
"|"  {adjust(); return OR;}
":=" {adjust(); return ASSIGN;}
array {adjust(); return ARRAY;}
if    {adjust(); return IF;}
then  {adjust(); return THEN;}
else  {adjust(); return ELSE;}
while {adjust(); return WHILE;}
for  	{adjust(); return FOR;}
to    {adjust(); return TO;}
do    {adjust(); return DO;}
let   {adjust(); return LET;}
in    {adjust(); return IN;}
end   {adjust(); return END;}
of    {adjust(); return OF;}
break {adjust(); return BREAK;}
nil   {adjust(); return NIL;}
function {adjust(); return FUNCTION;}
var   {adjust(); return VAR;}
type  {adjust(); return TYPE;}
[0-9]+	 {adjust(); yylval.ival=atoi(yytext); return INT;}
[a-zA-Z][0-9a-zA-Z_]* {adjust(); yylval.sval=yytext; return ID;}
.	 {adjust(); yyerror("illegal token");}

