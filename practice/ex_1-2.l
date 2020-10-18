/* English -> American */

%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"clever" { printf("smart"); }
"smart" { printf("elegant"); }
"liberal" { printf("conservative"); }
. { printf("%s", yytext); }
%%

int main(){
  yylex();

  return 0;
}

int yywrap(){ 
    return 1; 
}
