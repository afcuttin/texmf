# texmf
My texmf folder for special LaTeX additions unavailable on TeXLive.

## Folder structure and creation.
The folder is organized as follows<sup>1,(#fn1)</sup><sup>2(#fn2)</sup>:
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
<a name="fn1">1</a>: https://tex.stackexchange.com/a/8359/177
<a name="fn2">2</a>: https://tex.stackexchange.com/a/1138/177

