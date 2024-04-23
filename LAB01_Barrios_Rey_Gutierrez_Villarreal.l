%{
char identifiers[100][100];
int identifiers_count = 0;
int errors_count = 0;
int last_identifier_index = -1;
int yylex();
void process_identifier(const char* id);
%}

%option noyywrap
%x COMMENT

%%

"if"                                        { printf("IF "); }
"else"                                      { printf("ELSE "); }
"for"                                       { printf("FOR "); }
"while"                                     { printf("WHILE "); }
"double"                                    { printf("DOUBLE" ); }
"int"                                       { printf("INT "); }
"String"                                    { printf("STRING "); }
"char"                                      { printf("CHAR "); }
"new"                                       { printf("NEW "); }
"public"                                    { printf("PUBLIC "); }
"class"                                     { printf("CLASS "); }
"static"                                    { printf("STATIC "); }
"void"                                      { printf("VOID "); }


[0-9]+[a-zA-Z_]+                            { errors_count++; printf("ERROR= %s ", yytext); }
\"[^"\n]*\"                                 { printf("Cte-cadena= %s ", yytext); }


"++"                                        { printf("Op-MasMas= %s ", yytext); }
"--"                                        { printf("Op-MenosMenos= %s ", yytext); }
"+="                                        { printf("Op-sumaAsig= %s ", yytext); }
"-="                                        { printf("Op-sustAsig= %s ", yytext); }
"*="                                        { printf("Op-porAsig= %s ", yytext); }
"/="                                        { printf("Op-divAsig= %s ", yytext); }
"+"                                         { printf("Op-suma= %s ", yytext); }
"-"                                         { printf("Op-sust= %s ", yytext); }
"*"                                         { printf("Op-mult= %s ", yytext); }
"/"                                         { printf("Op-div= %s ", yytext); }
"="                                         { printf("Op_asig= %s ", yytext); }
"%"                                         { printf("Op-mod= %s ", yytext); }


"=="                                        { printf("Op-igual= %s ", yytext); }
"<="                                        { printf("Op-menorIgual= %s ", yytext); }
">="                                        { printf("Op-mayorIgual= %s ", yytext); }
"!="                                        { printf("Op-diferente= %s ", yytext); }
">"                                         { printf("Op-Mayor= %s ", yytext); }
"<"                                         { printf("Op-Menor= %s ", yytext); }
"<>"                                        { printf("Op-diferente= %s ", yytext); }


"&&"                                        { printf("op-y= && "); }
"||"                                        { printf("op-o= || "); }
"!"                                         { printf("op-no= ! "); }


"{"                                         { printf("Llave-a= { "); }
"}"                                         { printf("Llave-c= } "); }
";"                                         { printf("Punto-coma=;"); }
"("                                         { printf("Parent-a= ( "); }
")"                                         { printf("Parent-c= ) "); }
"["                                         { printf("Corchete-a= [ "); }
"]"                                         { printf("Corchete-c= ] "); }



[0-9]+"."[0-9]*([eE][-+]?[0-9]+)?           { printf("Cte-real= %s ", yytext); }
[0-9]+                                      { printf("Cte-ent= %s ", yytext); }



[a-zA-Z_][a-zA-Z0-9]*                       { process_identifier(yytext); } 
"=?"                                        { errors_count++; printf("ERROR: %s ", yytext); } 
[ \t]+                                      ;
"//"[^\n]*                                  { printf("Coment= %s", yytext+2); }
"/*"                                        { BEGIN(COMMENT); printf("Coment= "); }  
<COMMENT>"*/"                               { BEGIN(INITIAL); }       
<COMMENT>.                                  { putchar(yytext[0]); }                  
<COMMENT>\n                                 { putchar('\n'); }                       
\n                                          { printf("\n"); }
.                                           { errors_count++; printf("ERROR: %s", yytext); }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!freopen(argv[1], "r", stdin)) {
            perror(argv[1]);
            return 1;
        }
    }
    yylex();
    printf("\nTABLA DE IDENTIFICADORES\n");
    printf("Hay %d identificadores\n", identifiers_count);
    for (int i = 0; i < identifiers_count; ++i) {
        printf("Id%d= %s\n", i+1, identifiers[i]);
    }
    printf("%d errores léxicos\n", errors_count);
    return 0;
}

void process_identifier(const char* id) {
    int found = 0;
    int index = 0;
    for (int i = 0; i < identifiers_count; i++) {
        if (strcmp(identifiers[i], id) == 0) {
            found = 1;
            index = i;
            break;
        }
    }
    if (!found) {
        index = identifiers_count;
        if (index < 100) {
            strcpy(identifiers[index], id);
            identifiers_count++;
        } else {
            printf("ERROR: ");
            return;
        }
    }
    last_identifier_index = index;
    printf("Id%d= %s ", index + 1, id);
}
