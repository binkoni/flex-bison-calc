%{
#include "lexer.hh"
#include <memory>
#include <cstdio>
%}
%option nodefault
%option noyywrap
%option c++
%option yyclass="Calc::Lexer"
NUM [0-9]*\.?[0-9]+
PLUS \+
MINUS -
MUL \*
DIV \/
LPAREN \(
RPAREN \)
%%
{NUM} { printf("NUM(%s)", yytext); }
{PLUS} { printf("PLUS(%s)", yytext); }
{MINUS} { printf("MINUS(%s)", yytext); }
{MUL} { printf("MUL(%s)", yytext); }
{DIV} { printf("DIV(%s)", yytext); }
{LPAREN} { printf("LPAREN(%s)", yytext); }
{RPAREN} { printf("RPAREN(%s)", yytext); }
[ \t] {}
.|\n { ECHO; }
%%
int main() {
    auto lexer = std::make_unique<Calc::Lexer>();
    lexer->yylex();
}
