#ifndef LEXER_HH
#define LEXER_HH
#ifndef yyFlexLexerOnce
# include <FlexLexer.h>
#endif
namespace Calc
{
    class Lexer;
};

class Calc::Lexer : public yyFlexLexer {
public:
    explicit Lexer();
    virtual ~Lexer();
    virtual int yylex();
};

#endif
