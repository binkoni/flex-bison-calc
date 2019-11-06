#ifndef LEXER_HH
#define LEXER_HH
#ifndef yyFlexLexerOnce
# include <FlexLexer.h>
#endif
#include "parser.tab.hh"

namespace Calc
{
    class Lexer;
};

class Calc::Lexer : public yyFlexLexer {
public:
    explicit Lexer();
    virtual ~Lexer();
    Parser::token_type lex(
        Parser::semantic_type* yylval,
        Parser::location_type* yylloc
    );
};

#endif
