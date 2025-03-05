%{
#include<stdio.h>
#include<stdlib.h>
%}

DIGITO [0-9]
LETRA [A-Z]
RFC [A-Z]{4}[0-9]{6}[A-Z0-9]{3}
CURP {LETRA}{4}{DIGITO}{6}[HM]{LETRA}{5}({LETRA}|{DIGITO}){DIGITO}
EMAIL [a-zA-Z0-9._%+-]+@uaeh\.edu\.mx
DECIMAL {DIGITO}+\.{DIGITO}+
ENTERO {DIGITO}+
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO}|_)*

%%
{RFC} { printf("RFC: %s\n", yytext); }
{CURP} { printf("CURP: %s\n", yytext); }
{EMAIL} { printf("Email institucional: %s\n", yytext); }
{DECIMAL} { printf("NUmero decimal: %s\n", yytext); }
{ENTERO} { printf("NUmero entero: %s\n", yytext); }
{IDENTIFICADOR} { printf("Variable: %s\n", yytext); }
[ \t\n]+ ;
. { printf("Carácter no reconocido: %s\n", yytext); }
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
