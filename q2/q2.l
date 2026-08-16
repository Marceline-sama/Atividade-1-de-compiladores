%{
#include <stdio.h>
%}

%option noyywrap

%%

[0-9]+                  { printf("NUMBER %s\n", yytext); }

"("                     { printf("LPAREN\n"); }
")"                     { printf("RPAREN\n"); }

"+"                     { printf("PLUS\n"); }
"-"                     { printf("MINUS\n"); }
"*"                     { printf("TIMES\n"); }
"/"                     { printf("DIVIDE\n"); }
"|"                     { printf("ABS\n"); }

"%"                     { printf("MOD\n"); }
"^"                     { printf("POWER\n"); }

"<="                    { printf("REL_OP <=\n"); }
">="                    { printf("REL_OP >=\n"); }
"=="                    { printf("REL_OP ==\n"); }
"!="                    { printf("REL_OP !=\n"); }
"<"                     { printf("REL_OP <\n"); }
">"                     { printf("REL_OP >\n"); }

[ \t]+                  { /* ignora espacos e tabulacoes */ }

\n                      { printf("NEWLINE\n"); }

.                       { printf("Mystery character %s\n", yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}