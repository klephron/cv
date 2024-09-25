# Liberation Sans / DejaVu Sans
FONT := -V mainfont="Liberation Serif"
MARGINS := -V geometry:margin=0.5in
PDF_ENGINE := xelatex

%.pdf: %.md
	pandoc $< -o $@ --pdf-engine=$(PDF_ENGINE) $(FONT) $(MARGINS)

build: build/ru build/en

build/ru: cv.ru.pdf

build/en: cv.en.pdf

clean:
	rm cv.ru.pdf cv.en.pdf || true
