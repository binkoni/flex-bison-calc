%{
#include <memory>
#include <cstdio>
#include "lexer.hh"
#include "parser.tab.hh"
#undef YY_DECL
#define YY_DECL \
Calc::Parser::token_type \
Calc::Lexer::lex( \
    Calc::Parser::semantic_type* yylval, \
    Calc::Parser::location_type* yylloc \
)
using Token = Calc::Parser::token;
#define yyterminate() return Token::END
%}
%option nodefault
%option noyywrap
%option nounput
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
{NUM} { printf("NUM(%s)", yytext); return Token::NUM; }
{PLUS} { printf("PLUS(%s)", yytext); return Token::PLUS; }
{MINUS} { printf("MINUS(%s)", yytext); return Token::MINUS; }
{MUL} { printf("MUL(%s)", yytext); return Token::MUL; }
{DIV} { printf("DIV(%s)", yytext); return Token::DIV; }
{LPAREN} { printf("LPAREN(%s)", yytext); return Token::LPAREN; }
{RPAREN} { printf("RPAREN(%s)", yytext); return Token::RPAREN; }
[ \t] {}
.|\n { ECHO; }
%%
#ifdef yylex
#undef yylex
#endif

