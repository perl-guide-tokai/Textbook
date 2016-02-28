highlight_style = tango

BASES = perlguidetokai01 perlguidetokai02
PDFS = $(addsuffix .pdf,$(BASES))

build: pdf

pdf: $(PDFS)

.SUFFIXES: .md .pdf

.md.pdf:
	pandoc -V documentclass=ltjarticle --latex-engine=lualatex -N --toc --highlight-style=$(highlight_style) -o $@ $<

clean:
	$(RM) $(RMF) *~
	$(RM) $(RMF) $(PDFS)
