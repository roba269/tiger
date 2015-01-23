%{

#include <cstdio>
#include "parser.hpp"

extern "C" int yywrap() {}

%}

%%
[ \t\n] {}
[0-9]+  {return INT;}
"+"     {return PLUS;}
"-"     {return MINUS;}

