# Liberation Sans / DejaVu Sans
PANDOC := pandoc
PANDOC_PDF_ENGINE := xelatex

.DEFAULT_GOAL := build

%.pdf: %.md
	pandoc $< -o $@ --pdf-engine=$(PANDOC_PDF_ENGINE) \
	-V mainfont="Liberation Serif" -V papersize:a4 \
	-V geometry:margin=0.75in -V geometry:bottom=0.75in -V geometry:top=0.5in

build: build/ru build/en

build/ru: cv.ru.pdf

build/en: cv.en.pdf

clean:
	rm cv.ru.pdf cv.en.pdf || true
