#ifndef DRIVER_HH
#define DRIVER_HH

#include <memory>

namespace Calc {
    class Driver;
    class Lexer;
    class Parser;
};

class Calc::Driver {
private:
    std::shared_ptr<Calc::Lexer> lexer;
    std::shared_ptr<Calc::Parser> parser;
    friend class Calc::Parser;
public:
    explicit Driver();
    ~Driver();
    int parse();
};
#endif
