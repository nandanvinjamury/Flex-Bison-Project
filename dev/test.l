%{  
    #include <stdio.h>
    #include <string.h>
    int yylval;

    // tokens
    #define _boolean            1001
    #define _break              1002
    #define _class              1003
    #define _double             1004
    #define _else               1005
    #define _extends            1006
    #define _for                1007
    #define _if                 1008
    #define _implements         1009
    #define _int                1010
    #define _interface          1011
    #define _new                1012
    #define _newarray           1013
    #define _null               1014
    #define _println            1015
    #define _readln             1016
    #define _return             1017
    #define _string             1018
    #define _this               1019
    #define _void               1020
    #define _while              1021
    #define _plus               1022
    #define _minus              1023
    #define _multiplication     1024
    #define _division           1025
    #define _mod                1026
    #define _less               1027
    #define _lessequal          1028
    #define _greater            1029
    #define _greaterequal       1030
    #define _equal              1031
    #define _notequal           1032
    #define _and                1033
    #define _or                 1034
    #define _not                1035
    #define _assignop           1036
    #define _semicolon          1037
    #define _comma              1038
    #define _period             1039
    #define _leftparen          1040
    #define _rightparen         1041
    #define _leftbracket        1042
    #define _rightbracket       1043
    #define _leftbrace          1044
    #define _rightbrace         1045
    #define _intconstant        1046
    #define _doubleconstant     1047
    #define _stringconstant     1048
    #define _booleanconstant    1049
    #define _id                 1050

%}

digit           [0-9]
decint          (0|[1-9]{digit}*)
hexint          0(X|x)[0-9A-Fa-f]*+
errorint        0{digit}+
integer         {decint}|{hexint}
float1          {decint}+"."+{digit}*
exponent        (E|e)(\+|\-){digit}+
float2          {decint}+"."+{exponent}
double          {float1}|{float2}

alphabet        [a-zA-Z]
newline         [\n]
whitespace      [ \t]+
string          \"[^"\n]*\"

id              {alphabet}({alphabet}|{digit}|"_")*

comment         "//"((.)*)\n
multiComment    "/*"(([^*]|(("*"+)[^*/]))*)("*"+)"/"\n    

%%
boolean         {printf("%s ", yytext);}
break           {printf("%s ", yytext);}
class           {printf("%s ", yytext);}
double          {printf("%s ", yytext);}
else            {printf("%s ", yytext);}
extends         {printf("%s ", yytext);}
false           {printf("%s ", yytext);}
for             {printf("%s ", yytext);}
if              {printf("%s ", yytext);}
implements      {printf("%s ", yytext);}
int             {printf("%s ", yytext);}
interface       {printf("%s ", yytext);}
new             {printf("%s ", yytext);}
newarray        {printf("%s ", yytext);}
null            {printf("%s ", yytext);}
println         {printf("%s ", yytext);}
readln          {printf("%s ", yytext);}
return          {printf("%s ", yytext);}
string          {printf("%s ", yytext);}
this            {printf("%s ", yytext);}
void            {printf("%s ", yytext);}
while           {printf("%s ", yytext);}

true|false      {printf("%s ", yytext);}

"+"             {printf("plus "); return(_plus);}
"-"             {printf("minus "); return(_minus);}
"*"             {printf("multiplication "); return(_multiplication);}
"/"             {printf("division "); return(_division);}
"%"             {printf("mod "); return(_mod);}
"<"             {printf("less "); return(_less);}
"<="            {printf("lessequal "); return(_lessequal);}
">"             {printf("great "); return(_greater);}
">="            {printf("greaterequal "); return(_greaterequal);}
"=="            {printf("equal "); return(_equal);}
"!="            {printf("notequal "); return(_notequal);}
"&&"            {printf("and "); return(_and);}
"||"            {printf("or "); return(_or);}
"!"             {printf("not "); return(_not);}
"="             {printf("assignop "); return(_assignop);}
";"             {printf("semicolon "); return(_semicolon);}
","             {printf("comma "); return(_comma);}
"."             {printf("period "); return(_period);}
"("             {printf("leftparen "); return(_leftparen);}
")"             {printf("rightbrace "); return(_rightparen);}
"["             {printf("leftbracket "); return(_leftbracket);}
"]"             {printf("rightbracket "); return(_rightbracket);}
"{"             {printf("leftbrace "); return(_leftbrace);}
"}"             {printf("rightbrace "); return(_rightbrace);}

{integer}       {printf("intconstant "); return(_intconstant);}
{double}        {printf("doubleconstant "); return(_doubleconstant);}
{string}        {printf("stringconstant "); return(_stringconstant);}
{id}            {printf("id "); return(_id);}

{whitespace}    {; /* ignore whitespace */ }
{comment}       {; /* ignore comment */ }
{multiComment}  {; /* ignore multi-comment */ }

{errorint}      {printf("errorint ");}
.               {;}
%%


// run function
int yywrap(void) { 
    return 1; 
}

int main(void) {
    while(yylex()) {}
    return 0;
}



