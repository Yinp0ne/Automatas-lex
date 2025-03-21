%option noyywrap
%{
#include <stdio.h>
#include <string.h>

int count = 0;
FILE *output;
%}

%%
[Pp]oter { 
    count++;
    fprintf(output, "Potter ");
}
Potter { 
    fprintf(output, "Potter ");
}
[ \t]+ { 
    fprintf(output, "%s", yytext); // Mantiene espacios y tabulaciones
}
\n { 
    fprintf(output, "\n"); // Mantiene saltos de línea
}
. { 
    fprintf(output, "%s", yytext); // Mantiene el resto de los caracteres
}

%%

int main() {
    char inputFile[200], outputFile[200];

    printf("Ingrese el nombre del archivo de entrada: ");
    scanf("%s", inputFile);
    printf("Ingrese el nombre del archivo de salida: ");
    scanf("%s", outputFile);

    FILE *input = fopen(inputFile, "r");
    if (!input) {
        perror("Error al abrir el archivo de entrada");
        return 1;
    }

    output = fopen(outputFile, "w");
    if (!output) {
        perror("Error al abrir el archivo de salida");
        fclose(input);
        return 1;
    }

    yyin = input;
    yylex();

    printf("Se corrigieron %d errores de 'Poter'.\n", count);

    fclose(input);
    fclose(output);

    return 0;
}