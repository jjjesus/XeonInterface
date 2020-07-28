# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: XeonInterface.pdf all clean images

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: images XeonInterface.pdf 

images:
	(cd img ; make )

XeonInterface.pdf: images XeonInterface.tex
	lualatex --shell-escape XeonInterface
	pdflatex XeonInterface.tex


clean:
	rm -f XeonInterface.aux XeonInterface.bcf XeonInterface.toc XeonInterface.dvi XeonInterface.log XeonInterface.out XeonInterface.pdf XeonInterface.run.xml img/*.png

