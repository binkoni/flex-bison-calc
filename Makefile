CXXFLAGS := -g
CXXFLAGS += -fsanitize=address,leak

all: calc

calc: lexer.yy.cc lexer.cc lexer.hh
	${CXX} ${CXXFLAGS} -o $@ $^

lexer.yy.cc: lexer.ll
	${LEX} ${LFLAGS} -o $@ $^

.PHONY: clean
clean:
	rm -rf *.o *.yy.cc
