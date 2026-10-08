%%
z?(ab)+    ECHO; printf("\n");
.    ;
\n    ;
%%

#ifndef yywrap
int yywrap() { return 1; }
#endif

main () { while (yylex()); }
