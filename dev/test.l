%{  
    #include <stdio.h>
    #include <string.h>
    #include "test_scanner.h"

    #define MAX     150
    #define LENGTH(x) (sizeof(x)/sizeof(*(x)))
    #define true    1 
    #define false   0

    int yylval;
    struct {
        int dispatch[52];
        char symbol[MAX];
        int next[MAX];
    }symbol_table;

    void init_symbol_table(void);
    void insert(char *);
    int next_symbol(char *);
%}

digit           [0-9]
decint          ({digit}|[1-9]{digit}*)
hexint          0(X|x)[0-9A-Fa-f]*+
integer         {decint}+|{hexint}
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
boolean         {printf("%s ", yytext); insert(yytext); return (_boolean);}
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

.               {;}
%%


// run function
int yywrap(void) { return 1; }

int main(void) {

    init_symbol_table();
    printf("finish init symbol table.\n");



    while(yylex()) {}
    return 0;
}

/* Initialize the symbol table */
void init_symbol_table(void) {
  int i;

  for (i = 0; i < 52; i++)
    symbol_table.dispatch[i] = -1;

  for (i = 0; i < MAX; i++)
    symbol_table.symbol[i] = '\0';

  for (i = 0; i < MAX; i++)
    symbol_table.next[i] = -1;
}

int next_symbol (char* s) {
  int p = s[0];
  if (p >= 97) return p - 97 + 26; 
  return p - 65;
}

void insert (char* s) {
    int value = next_symbol(s);
    printf("%d", value);
}