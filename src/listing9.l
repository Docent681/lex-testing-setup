    int i;

%%
\@[A-Za-z]+ {
            for( i = 1; i < yyleng; i++ )
                 unput( yytext[i] );
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
