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
op: PLUS
  | MINUS
  | MUL
  | DIV

expr : NUM
     | NUM op expr

start :
      | start expr
%%
void Calc::Parser::error(const Parser::location_type& loc, const std::string& msg) {
}
