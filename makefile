parsetest: parsetest.o parser.o lex.yy.o
	g++ -g -o parsetest parsetest.o parser.o lex.yy.o

lextest: driver.o lex.yy.o
	g++ -g -o lextest driver.o lex.yy.o

driver.o: driver.c tokens.h
	g++ -g -c driver.c
  
parsetest.o: parsetest.c
	g++ -g -c parsetest.c

parser.o: parser.cpp parser.hpp
	g++ -c parser.cpp

parser.cpp: tiger.grm
	yacc -d -v -o parser.cpp tiger.grm

parser.hpp: parser.cpp
	echo "parser.hpp was created at the same time as parser.cpp"

lex.yy.o: lex.yy.c parser.hpp
	g++ -g -c lex.yy.c

lex.yy.c: tiger.lex
	lex tiger.lex

clean: 
	rm -f parsetest.o parsetest.o lex.yy.o lex.yy.c driver.o parser.cpp parser.hpp
