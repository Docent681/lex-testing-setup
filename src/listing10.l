    int i, len;
    char *p;

%%
\@[A-Za-z]+ {
            len = yyleng;
            p = (char *)strdup(yytext);
            for( i = 1; i < len; i++ )
            unput( p[i] );
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
