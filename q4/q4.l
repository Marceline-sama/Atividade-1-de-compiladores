%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
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

"//".*                  { /* descarta comentario */ }

[ \t\n]+                { /* ignora */ }

.                       { printf("SIMBOLO %s\n", yytext); }

%%

int main(int argc, char *argv[])
{
    FILE *arquivo;

    if (argc < 2)
    {
        printf("Erro: informe o nome do arquivo de entrada.\n");
        return 1;
    }

    arquivo = fopen(argv[1], "r");

    if (arquivo == NULL)
    {
        printf("Erro: nao foi possivel abrir o arquivo '%s'.\n", argv[1]);
        return 1;
    }

    yyin = arquivo;

    yylex();

    fclose(arquivo);

    return 0;
}