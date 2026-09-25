%%
(.)+    {
            printf(">%s\n", yytext);
            if (yyleng > 1) yyless(yyleng/2);
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
