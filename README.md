# texmf
My texmf folder for special LaTeX additions unavailable on TeXLive.

## Folder structure and creation.
The folder is organized as follows
<a href="#note1" id="note1ref"><sup>1,</sup></a>
<a href="#note2" id="note2ref"><sup>2</sup></a>
:
```
    bibtex directory    This is where bib files and bst files go
    ⁃  bst directory       Put bst files here
    ⁃  bib directory       Put bib files here

    tex directory       This is where new packages go
    ⁃  latex directory     Put latex packages here
    ⁃  plain directory     Put plain tex files here
    ⁃  xelatex directory   Put xelatex specific packages here
    ⁃  xetex  directory    Put plain xetex files here
    ⁃  context directory   Put context files here
    ⁃  generic directory   Put files that are usable with any TeX flavour here
    doc directory
    ⁃  put documentation files from packages installed in the tex directory here. Putting the documentation files here allows them to be found by the texdocsystem.
```

[This](https://github.com/amunn/make-local-texmf) is a script that can create the directory tree. If `texmf` already exist, it does not do anything. Check the script directory for the modified script and possibly fork the code.

## Custom packages

### europecv2013
Aggiunto `europecv2013` come submodule, dopo aver fatto il fork dal repository originale:
```
git submodule add git@github.com:afcuttin/europecv2013.git
```

### circuitikz
Circuitikz is actively maintained and its version may be ahead of the one available on CTAN.

Therefore, it may be easier to use the [provided](https://circuitikz.github.io/circuitikz/) `circuitikzgit.sty` version.
Just
```
wget http://circuitikz.github.io/circuitikz/circuitikzgit.sty
```
in `~/texmf/tex/latex/`
and
```
wget http://circuitikz.github.io/circuitikz/circuitikzmanualgit.pdf
```
in `~/texmf/doc`.

## References
<a id="note1" href="#note1ref"><sup>1</sup></a>: https://tex.stackexchange.com/a/8359/177
<br>
<a id="note2" href="#note2ref"><sup>2</sup></a>: https://tex.stackexchange.com/a/1138/177

