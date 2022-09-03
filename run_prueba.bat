:: Script para windows
flex Lexico-tp.l
Rem bison -dyv Sintactico.y

gcc.exe lex.yy.c -o bin/compiler.exe

bin\compiler.exe pruebas\tp.txt

@echo off
del .\bin\compiler.exe
Rem del lex.yy.c
Rem del y.tab.c
Rem del y.tab.h
Rem del y.output