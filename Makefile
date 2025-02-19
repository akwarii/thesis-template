# Compiler settings
LATEX=pdflatex
BIB=biber
MAIN=main
OUTDIR=output

# Files to clean
AUXFILES=*.aux *.bbl *.bcf *.blg *.log *.out *.toc *.lof *.lot *.run.xml *.synctex.gz *.fdb_latexmk *.fls

# Default target: compile the thesis
all: $(MAIN).pdf

# Compile the main document
$(MAIN).pdf: $(MAIN).tex
	mkdir -p $(OUTDIR)
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	$(BIB) $(OUTDIR)/$(MAIN)
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex

# Clean auxiliary files
clean:
	rm -rf $(OUTDIR) $(AUXFILES)

# Quick compile without bibliography (for testing changes)
fast:
	$(LATEX) -output-directory=$(OUTDIR) $(MAIN).tex
