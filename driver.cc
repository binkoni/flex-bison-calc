#include "driver.hh"
#include "lexer.hh"
#include "parser.tab.hh"

Calc::Driver::Driver() {
    lexer = std::make_shared<Calc::Lexer>();
    parser = std::make_shared<Calc::Parser>(this);
}

int Calc::Driver::parse() {
    return parser->parse();
}

Calc::Driver::~Driver() {}
