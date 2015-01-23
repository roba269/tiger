#include <stdio.h>
#include <stdlib.h>
#include "ast_node.h"

extern int yyparse(void);
extern FILE* yyin;
Exp *root;

void parse(const char* fname) 
{/*EM_reset(fname);*/
  yyin = fopen(fname, "r");
  if (!yyin) {
    fprintf(stderr, "cannot open file\n");
    return;
  }
 if (yyparse() == 0) /* parsing worked */
   fprintf(stderr,"Parsing successful!\n");
 else fprintf(stderr,"Parsing failed\n");
}


int main(int argc, char **argv) {
 if (argc!=2) {fprintf(stderr,"usage: a.out filename\n"); exit(1);}
 parse(argv[1]);
 printf("The final result is: %d\n", root->eval());
 return 0;
}
