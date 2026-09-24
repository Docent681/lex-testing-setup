%{
int count = 0;
%}

%%
[-+]?[0-9]+    {
                   count++;
                   printf( "%d %s\n", count, yytext );
               }
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
