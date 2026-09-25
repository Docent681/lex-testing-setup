    int s = 0, h = 0;
%%
she { s++; REJECT; }
he { h++; REJECT; }
.|\n ;
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
