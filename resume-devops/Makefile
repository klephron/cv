LATEXMK := latexmk
HTLATEX := htlatex
PANDOC := pandoc
PANDOC_PDF_ENGINE := xelatex
PDFUNITE := pdfunite
MKTEXTFM := mktextfm

HTML_DIR := $(CURDIR)/html

.PHONY: install/fonts build build/ru clean/aux clean/pdf clean

.DEFAULT_GOAL := build

build:  html/main.ru.html html/main.en.html Кулаков\ Никита\ -\ DevOps.pdf Nikita\ Kulakov\ -\ DevOps.pdf

Кулаков\ Никита\ -\ DevOps.pdf: main.ru.pdf
	cp "$<" "$@"

Nikita\ Kulakov\ -\ DevOps.pdf: main.en.pdf
	cp "$<" "$@"

# for russian CV
# may use proper path to mktextfm
install/fonts:
	@$(MKTEXTFM) labx2074
	@$(MKTEXTFM) lacc1095
	@$(MKTEXTFM) lacc1200
	@$(MKTEXTFM) lati0900
	@$(MKTEXTFM) laxc2074

%.pdf: %.tex
	@$(LATEXMK) -pdf $<

html/%.html: %.tex
	@mkdir -pv $(HTML_DIR)
	@$(HTLATEX) $< "" "" -d$(HTML_DIR)/

clean/aux:
	@rm -fv *.aux
	@rm -fv *.fdb_latexmk
	@rm -fv *.fls
	@rm -fv *.log
	@rm -fv *.out
	@rm -fv *.synctex.gz

clean/pdf:
	rm -f *.pdf

clean: clean/aux clean/pdf

