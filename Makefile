# Makefile for thesis text, slides, etc.

slides:
	jupyter nbconvert presentation.ipynb --to slides --config config/slides_config.py

	cp presentation.slides.html index.html


serve:
ifeq ($(shell uname -s),Linux)
	jupyter nbconvert presentation.ipynb --to slides --post serve --config config/slides_config.py
else
	start cmd //c "jupyter nbconvert presentation.ipynb --to slides --post serve --config config/slides_config.py"
endif


notebook:
ifeq ($(shell uname -s),Linux)
	jupyter notebook presentation.ipynb
else
	start cmd //c "jupyter notebook presentation.ipynb"
endif


png-figs:
	python scripts/convfigs.py


all-png-figs:
	python scripts/convfigs.py --overwrite


thesis:
	latexmk -pdf thesis.tex


excerpt: thesis
	latexmk -pdf excerpt.tex


signatures:
	latexmk -pdf signatures.tex
