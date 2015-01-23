parser.exe : lexer.o parser.o driver.o
	g++ lexer.o parser.o driver.o -o parser.exe

lexer.o : lexer.cpp
	g++ -c lexer.cpp -o lexer.o

parser.o : parser.cpp
	g++ -c parser.cpp -o parser.o

driver.o : driver.cpp
	g++ -c driver.cpp -o driver.o
