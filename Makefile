LATEXMK := latexmk -xelatex -interaction=nonstopmode -halt-on-error
MAIN    := main
THEME   := beamerthemeCyberwitchery.sty
DEPS    := $(MAIN).tex $(THEME)
INSTALLDIR := $(shell kpsewhich -var-value TEXMFHOME)/tex/latex/cyberwitchery

.PHONY: all light clean cleanall install uninstall

all: $(MAIN).pdf

$(MAIN).pdf: $(DEPS)
	$(LATEXMK) $(MAIN).tex

light: main-light.pdf

main-light.pdf: $(DEPS)
	sed 's/\\usetheme{Cyberwitchery}/\\usetheme[light]{Cyberwitchery}/' $(MAIN).tex > main-light.tex
	$(LATEXMK) main-light.tex

clean:
	$(LATEXMK) -c $(MAIN) main-light 2>/dev/null || true
	rm -f *.nav *.snm *.vrb *.xdv main-light.tex missfont.log

cleanall:
	$(LATEXMK) -C $(MAIN) main-light 2>/dev/null || true
	rm -f *.nav *.snm *.vrb *.xdv main-light.tex missfont.log $(MAIN).pdf main-light.pdf

install: $(THEME)
	mkdir -p $(INSTALLDIR)
	cp $(THEME) $(INSTALLDIR)/
	@echo "installed to $(INSTALLDIR)"

uninstall:
	rm -f $(INSTALLDIR)/$(THEME)
	-rmdir $(INSTALLDIR)
