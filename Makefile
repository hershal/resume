MASTERFILE=resume
SOURCE=$(MASTERFILE).tex
OUTPUT=$(MASTERFILE).pdf

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

all: $(SOURCE) $(OUTPUT)

$(OUTPUT): $(SOURCE) res.cls
	latexmk -pdf -pdflatex='pdflatex -interaction=nonstopmode' -use-make $(SOURCE)

clean:
	latexmk -CA
