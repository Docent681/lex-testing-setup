%%
[0-9]+    |
[a-zA-Z]+    { ECHO; printf( "\n" ); }
.|\n    ;
%%

#ifndef yywrap
int yywrap() { return 1; }
#endif

int main(void)
{
    while (yylex())
        ;
    return 0;
}
