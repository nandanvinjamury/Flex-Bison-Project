%{  
    #include <stdio.h>
    #include <string.h>
    int yylval;
%}


decint       ^(0|[1-9][0-9]*)$
hexint       0(X|x)[0-9A-Fa-f]*+

integer      {decint}|{hexint}

%%
{decint}     {printf("decint - %s \n", yytext);}
{hexint}     {printf("hexint - %s \n", yytext);}
{integer}    {printf("integer - %s \n", yytext);}
%%

// run function
int yywrap(void) { 
    return 1; 
}

int main(void) {
    yylex();
    return 0;
}



