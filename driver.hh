#ifndef DRIVER_HH
#define DRIVER_HH

#include <memory>

namespace Calc {
    class Driver;
    class Lexer;
    class Parser;
};

class Calc::Driver {
public:
    explicit Driver();
    ~Driver();
    std::shared_ptr<Calc::Lexer> lexer;
    std::shared_ptr<Calc::Parser> parser;
    int parse();
};
#endif
