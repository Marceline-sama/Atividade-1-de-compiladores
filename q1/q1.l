%{
#include <stdio.h>

int linhas = 0;
int palavras = 0;
int caracteres = 0;

int inteiros = 0;
int floats = 0;
int pontuacoes = 0;

int yywrap(void)
{
    return 1;
}
%}

%%

[0-9]+\.[0-9]+       { floats++; caracteres += yyleng; }
[0-9]+               { inteiros++; caracteres += yyleng; }
[a-zA-Z]+            { palavras++; caracteres += yyleng; }
[.,;:!?]             { pontuacoes++; caracteres += yyleng; }
[ \t]+               { caracteres += yyleng; }
\n                   { linhas++; caracteres += yyleng; }
.                    { caracteres += yyleng; }

%%

int main(void)
{
    yylex();

    printf("linhas: %d\n", linhas);
    printf("palavras: %d\n", palavras);
    printf("caracteres: %d\n", caracteres);
    printf("inteiros: %d\n", inteiros);
    printf("floats: %d\n", floats);
    printf("pontuacoes: %d\n", pontuacoes);

    return 0;
}