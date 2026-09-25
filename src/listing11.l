%%
read { printf( "operation: " ); ECHO; }
[a-z]+ { printf( "identifier: " ); ECHO; }
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
