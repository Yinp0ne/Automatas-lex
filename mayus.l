%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[A-Z]    { printf("%c", tolower(yytext[0])); }
[a-z]    { printf("%s", yytext); }
[^A-Za-z] { printf("%s", yytext); }

%%

int main() {
    printf("Introduce el texto: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}