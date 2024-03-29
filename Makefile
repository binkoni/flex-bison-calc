CXXFLAGS := -g -pg
CXXFLAGS += -fsanitize=address,leak

all: calc

calc: main.cc lexer.yy.cc lexer.cc lexer.hh parser.tab.cc parser.tab.hh driver.cc driver.hh
	${CXX} ${CXXFLAGS} -o $@ $^

lexer.yy.cc: lexer.ll
	${LEX} ${LFLAGS} -o $@ $^

parser.tab.cc: parser.yy
	bison $^

.PHONY: clean
clean:
	rm -rf *.o *.yy.cc *.tab.hh *.tab.cc *.out location.hh
