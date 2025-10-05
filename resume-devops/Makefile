LATEXMK := latexmk
HTLATEX := htlatex
PANDOC := pandoc
PANDOC_PDF_ENGINE := xelatex
PDFUNITE := pdfunite

HTML_DIR := $(CURDIR)/html

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

build: build/pdf/ru build/pdf/en build/html/ru build/html/en

build/pdf/ru:
	$(LATEXMK) -pdf main.ru.tex

build/pdf/en:
	$(LATEXMK) -pdf main.en.tex

build/html/ru:
	mkdir -p $(HTML_DIR)
	$(HTLATEX) main.ru.tex "" "" -d$(HTML_DIR)/

build/html/en:
	mkdir -p $(HTML_DIR)
	$(HTLATEX) main.en.tex "" "" -d$(HTML_DIR)/

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

