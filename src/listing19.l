    int s = 0, h = 0;
%%
she { s++; yyless(1); }
he { h++; }
.|\n ;
%%

#ifndef yywrap
int yywrap() { return 1; }
#endif

int main(void)
{
    while (yylex());
    printf( "she: %d times, he: %d times\n", s, h );
    return 0;
}
