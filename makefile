all: compile
	@./compilador practica1.txt
	@rm compilador
	@rm lex.yy.c

compile: flex
	@gcc lex.yy.c -o compilador

flex:
	@flex Lexico.l

