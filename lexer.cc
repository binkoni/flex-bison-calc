#include <iostream>
#include "lexer.hh"
Calc::Lexer::Lexer() : yyFlexLexer{std::cin, std::cout} {}
Calc::Lexer::~Lexer() {}
