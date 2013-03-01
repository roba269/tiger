#include <stdio.h>
#include <stdlib.h>

extern int yyparse(void);
extern FILE* yyin;

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
 return 0;
}
