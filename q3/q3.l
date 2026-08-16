%{
#include <stdio.h>
%}

%option noyywrap

%%

"if"                    { printf("IF\n"); }
"else"                  { printf("ELSE\n"); }
"while"                 { printf("WHILE\n"); }
"return"                { printf("RETURN\n"); }

[0-9]+\.[0-9]+          { printf("NUMBER %s\n", yytext); }
[0-9]+                  { printf("NUMBER %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*  { printf("ID %s\n", yytext); }

"//".*                  { /* descarta comentario ate o fim da linha */ }

[ \t\n]+                { /* ignora espacos, tabulacoes e quebras de linha */ }

.                       { printf("SIMBOLO %s\n", yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}