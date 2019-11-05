#include <memory>
#include "driver.hh"

int main() {
    auto driver = std::make_unique<Calc::Driver>();
    driver->parse();
    return 0;
}
