mkdir -p auxfiles
latexmk -silent -bibtex -outdir=auxfiles -pdf -pdflatex="pdflatex -synctex=1 --shell-escape %O '\def\auxfiles{}\input{%S}'" main.tex
# Command for TexLive: latexmk -silent -bibtex -outdir=auxfiles -pdf -pdflatex="pdflatex -synctex=1 --shell-escape %%O '\def\auxfiles{}\input{%%S}'" %
