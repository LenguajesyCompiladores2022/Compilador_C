%{
#include <stdio.h>
#include <stdlib.h>


FILE  *yyin;
int yylval;
char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

DIGITO			[0-9]
LETRA			[a-zA-Z]

NUMERAL             "#"
INCLUDE             "include"
PUNTO               "."
INTEGER             "int"
FLOAT               "float"
CHAR                "char"
MAIN                "main"
ELSE                "else"
CORCH_ABRE          "["
CORCH_CIERRA        "]"
ASIGNACION          "="
PUNTO_COMA          ";"
SYS_OUT             "printf"
SYS_IN              "scanf"
AND                 "&&"
OR                  "||"
POINTER             "&"
BARRA               "\/"
ASTERISCO           "\*"
SALTO_LINEA         "\n|\r\n|\r"
/*COMENTARIO_MULTI    ({} [^\*] \*\/) | (\/\* \*+ \/)*/
COMENTARIO_MULTI    \/\*((\n|\r\n|\r)*([^*]*)(\n|\r\n|\r)*)*\*\/
COMENTARIO_SINGLE   \/\/.*

CTE		            {DIGITO}+
ID			        {LETRA}({LETRA}|{DIGITO})*

OP_SUM		        "+"
OP_MUL              "*"
OP_RES		        "-"
OP_DIV              "/"
PA			        "("
PC			        ")"
IF                  "if"
WHILE               "while"
COMA                ","
TEXTO               [\"].*[\"]
DISTINTO            "!="
IGUA_IGUAL          "=="
MENOR_IGUAL         "<="
MAYOR_IGUAL         ">="
MENOR               "<"
MAYOR               ">"
PARENTESIS_ABRE     "{"
PARENTESIS_CIERRA   "}"
CTE_REAL            [0]{0,1}[1-9]{0,11}[.][0-9]{0,11}

%%

{NUMERAL}		    {printf("\nPalabra reservada Numeral: %s\n", yytext);}
{INCLUDE}		    {printf("\nPalabra reservada Include: %s\n", yytext);}
{PUNTO}		        {printf("\nPunto: %s\n", yytext);}
{MAIN}		        {printf("\nPalabra reservada main: %s\n", yytext);}
{CHAR}		        {printf("\nPalabra reservada char: %s\n", yytext);}
{CORCH_ABRE}		{printf("\nCorchete abre: %s\n", yytext);}
{CORCH_CIERRA}		{printf("\nCorchete cierra: %s\n", yytext);}
{ASIGNACION}		{printf("\nAsignacion: %s\n", yytext);}
{PUNTO_COMA}	    {printf("\nPunto y coma: %s\n", yytext);}
{SYS_OUT}	        {printf("\nSalida pantalla: %s\n", yytext);}
{SYS_IN}	        {printf("\nEntrada pantalla: %s\n", yytext);}
{AND}	            {printf("\nAnd: %s\n", yytext);}
{OR}	            {printf("\nOr: %s\n", yytext);}
{POINTER}	        {printf("\nPointer: %s\n", yytext);}
{ELSE}	            {printf("\nPalabra reservada else: %s\n", yytext);}
{COMENTARIO_SINGLE} {/*ignorar*/}
{COMENTARIO_MULTI}  {/*ignorar*/}

{INTEGER}		    {printf("\nTipo Integer: %s\n", yytext);}
{FLOAT}		        {printf("\nTipo float: %s\n", yytext);}
{IF}                {printf("\nPalabra reservada IF: %s\n", yytext);}
{WHILE}             {printf("\nPalabra reservada WHILE: %s\n", yytext);}
{COMA}	            {printf("\nComa: %s\n", yytext);}
{CTE}			    {printf("\nConstante: %s\n", yytext);}
{TEXTO}			    {printf("\nTexto: %s\n", yytext);}
{ID}			    {printf("\nIdentificador: %s\n", yytext);}
{MENOR_IGUAL}	    {printf("\nMenor igual: %s\n", yytext);}
{MAYOR_IGUAL}	    {printf("\nMayor igual: %s\n", yytext);}
{MENOR}			    {printf("\nMenor: %s\n", yytext);}
{MAYOR}			    {printf("\nMayor: %s\n", yytext);}
{PARENTESIS_ABRE}	{printf("\nParentesis abre: %s\n", yytext);}
{PARENTESIS_CIERRA}	{printf("\nParentesis cierra: %s\n", yytext);}
{CTE_REAL}	        {printf("\nConstante real: %s\n", yytext);}
{DISTINTO}	        {printf("\nDistinto: %s\n", yytext);}
{IGUA_IGUAL}	    {printf("\nIgualacion: %s\n", yytext);}

{OP_SUM}		{printf("\nSuma: %s\n", yytext);}
{OP_MUL}		{printf("\nMultiplicacion: %s\n", yytext);}
{OP_RES}		{printf("\nResta: %s\n", yytext);}
{OP_DIV}		{printf("\nDivision: %s\n", yytext);}
{PA}			{printf("\nParAbre: %s\n", yytext);}
{PC}			{printf("\nParCierra: %s\n", yytext);}
"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}

%%

int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yylex();
        
    }
	fclose(yyin);
        return 0;
}
int yyerror(void)
{
    printf("Error Sintactico\n");
    exit (1);
}
