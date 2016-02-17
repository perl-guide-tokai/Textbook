highlight_style = tango

build: slides.pdf

slides.pdf: slides.md
	pandoc -V documentclass=ltjarticle --latex-engine=lualatex -N --toc --highlight-style=$(highlight_style) -o $@ $<

clean:
	$(RM) $(RMF) *~
	$(RM) $(RMF) slides.pdf
