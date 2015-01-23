parsetest: parsetest.o parser.o lex.yy.o ast_node.h
	g++ -g -o parsetest parsetest.o parser.o lex.yy.o

lextest: driver.o lex.yy.o
	g++ -g -o lextest driver.o lex.yy.o

driver.o: driver.c
	g++ -g -c driver.c
  
parsetest.o: parsetest.c ast_node.h
	g++ -g -c parsetest.c

parser.o: parser.cpp parser.hpp ast_node.h
	g++ -c parser.cpp

parser.cpp: tiger.grm ast_node.h
	yacc -d -v -o parser.cpp tiger.grm

parser.hpp: parser.cpp
	echo "parser.hpp was created at the same time as parser.cpp"

lex.yy.o: lex.yy.c parser.hpp
	g++ -g -c lex.yy.c

lex.yy.c: tiger.lex
	lex tiger.lex

clean: 
	rm -f *.o lex.yy.c parser.cpp parser.hpp
