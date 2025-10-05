.PHONY: install/fonts build build/ru clean/aux clean/pdf clean

.DEFAULT_GOAL := build

# for russian CV
# may use proper path to mktextfm
install/fonts:
	mktextfm labx2074
	mktextfm lacc1095
	mktextfm lacc1200
	mktextfm lati0900
	mktextfm laxc2074

build: build/ru

build/ru:
	latexmk -pdf main.tex

clean/aux:
	rm -f *.aux
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.log
	rm -f *.out
	rm -f *.synctex.gz

clean/pdf:
	rm -f *.pdf

clean: clean/aux clean/pdf

