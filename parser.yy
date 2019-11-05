%{
#include <cstdio>
%}
%require "3.2"
%defines
%skeleton "lalr1.cc"
%language "c++"
%debug
%define api.prefix {Calc}
%define api.parser.class {Parser}
%define api.value.type variant
%define parse.error verbose
%locations
%start start
%token <double> NUM
%token PLUS
%token MINUS
%token MUL
%token DIV
%token LPAREN
%token RPAREN
%token END
%token EOL
%type<double> expr
%parse-param { Calc::Driver* driver }
%{
#include "lexer.hh"
#undef yylex
#define yylex driver->lexer->lex
%}
%code requires {
#include <memory>
#include "driver.hh"
}

%%
expr : NUM { $$ = $1; }
     | NUM PLUS expr { $$ = $1 + $3; }
     | NUM MINUS expr { $$ = $1 - $3; }
     | NUM MUL expr { $$ = $1 * $3; }
     | NUM DIV expr { $$ = $1 / $3; }

start :
      | start expr EOL { printf(" = %lf\n", $2); }
      | start END
%%
void Calc::Parser::error(const Parser::location_type& loc, const std::string& msg) {
}
