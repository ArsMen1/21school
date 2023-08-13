CC = gcc
CFLAGS = -Wall -Werror -Wextra -std=c11
OS := $(shell uname -s)

all: s21_math.a

gcov_report: test
	lcov -t "s21_math_test" -o s21_math_test.info -c -d .
	genhtml -o report s21_math_test.info
	open ./report/index.html

test: s21_math_test.o
ifeq ($(OS), Linux)
	$(CC) $(CFLAGS) s21_math.c s21_math_test.o -o ./s21_math_test -lcheck -lrt -lpthread -lsubunit -lm --coverage
else
	$(CC) $(CFLAGS) s21_math.c s21_math_test.o -o ./s21_math_test -lcheck -lm --coverage
endif
	./s21_math_test

s21_math.a: s21_math.o
	ar -rc ./s21_math.a s21_math.o
	ranlib ./s21_math.a

s21_math_test.o:
	$(CC) $(CFLAGS) -c s21_math_test.c

s21_math.o:
	$(CC) $(CFLAGS) -c s21_math.c
	
clean:
	rm -rf *.o *.a *.gcno *.gcda *.info ./report/* test .clang-format

cleaner:
	rm -rf *.o *.gcno *.gcda *.info ./report/* *.a ./s21_math_test test

check:
	cp ../materials/linters/.clang-format .clang-format
	clang-format -n *.c
	clang-format -n *.h
	rm -rf *.clang-format
	make test
	make clean

t:
	$(CC) $(CFLAGS) s21_math.c main.c -lm -o test
	./test

