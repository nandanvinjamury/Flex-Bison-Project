%{  
    #include <stdio.h>
    #include <string.h>
    int yylval;
%}

digit       [0-9]
decint      (0|[1-9]{digit}*)
hexint      0(X|x)[0-9A-Fa-f]*+
errorint    0{digit}+
integer     {decint}|{hexint}
float1      {decint}+"."+{digit}*
exponent    (E|e)(\+|\-){digit}+
float2      {decint}+"."+{exponent}
double      {float1}|{float2}

alphabet    [a-zA-Z]
newline     [\n]
whitespace  [ \t]+
string      \"[^"\n]*\"

id          {alphabet}({alphabet}|{digit}|"_")*

%%
{integer}       {printf("integer - %s \n", yytext);}
{double}        {printf("double - %s \n", yytext);}
{errorint}      {printf("errorint - %s \n", yytext);}
{alphabet}      {printf("alphabet - %s \n", yytext);}
{newline}       {printf("\n");}
{whitespace}    {{; /* ignore whitespace */ }}
{string}        {printf("string - %s \n", yytext);}
{id}            {printf("id - %s \n", yytext);}
%%

// run function
int yywrap(void) { 
    return 1; 
}

int main(void) {
    yylex();
    return 0;
}



