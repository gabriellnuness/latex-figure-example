FILE = main
FIGURE_FILE = ifog3x3
OUT_DIR = output
TEX = pdflatex
BIB = bibtex
TEX_FLAGS = -interaction=nonstopmode -aux_directory=$(OUT_DIR) -output-directory=$(OUT_DIR)
LATEXMK_FLAGS = -pdf -auxdir=$(OUT_DIR) -outdir=$(OUT_DIR)


.PHONY:	all pdf bib clean

all: complete

complete:
	latexmk -pdflatex="$(TEX)" $(LATEXMK_FLAGS) $(FILE).tex

pdf:
	$(TEX) $(TEX_FLAGS) $(FILE).tex

figure:
	latexmk -pdflatex="lualatex" $(LATEXMK_FLAGS) $(FIGURE_FILE).tex
	
bib: $(OUT_DIR)/$(FILE).aux
	$(BIB) $(OUT_DIR)/$(FILE)

clean:
	@del /F /Q /A $(OUT_DIR)
