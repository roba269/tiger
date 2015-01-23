#include <cstdio>
#include "y.tab.h"

extern int yyparse();

int main(int argc, char **argv) {
  if (argc < 2) {
    printf("Please specify the filename");
    return 1;
  }
  yyparse(); 
  return 0;
}

