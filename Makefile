highlight_style = tango

BASE = perlguidetokai01

build: $(BASE).pdf

$(BASE).pdf: $(BASE).md
	pandoc -V documentclass=ltjarticle --latex-engine=lualatex -N --toc --highlight-style=$(highlight_style) -o $@ $<

clean:
	$(RM) $(RMF) *~
	$(RM) $(RMF) $(BASE).pdf
