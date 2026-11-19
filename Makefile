.PHONY: all clean manual run

all: build/main

manual: build/doc/general.pdf

build/main: src/main.c
	mkdir -p build
	gcc src/main.c -o build/main

run: build/main
	./build/main

build/doc/general.pdf: doc/general.tex
	mkdir -p build/doc
	pdflatex -interaction=nonstopmode -halt-on-error \
		-output-directory=build/doc doc/general.tex

clean:
	rm -rf build
