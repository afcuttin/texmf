# E4ESS Layout

LaTeX package providing the layout defined for the E4ESS  project

## Thing to do to create a new document

1. create a new repository where the document will be hosted
1. clone the repository to the preferred location in your local folders
1. copy the content of `test-doc` into the folder created in the previous step, and rename the main file `testdoc.tex'
1. setup the sublime text project

    1. create the sublime project file
    1. add the document folder to the project
    1. setup the main file to build (TeXroot)

    	"settings":
	{
		"TEXroot": "rfps-req-ver-ass.tex",
        "tex_file_exts": [".tex", ".tikz"],
        "builder_settings": {
                    "options": "--shell-escape"
                }
	}
1. using `subrepo`, clone into a separate folder the repository containing auxiliary files (bibliographies and glossaries)
1. copy the `.gitignore` file from https://github.com/afcuttin/gitignore directory into the working directory of the document just created
1. to use the `gitinfo2` package, copy the hooks available in the documentation in a newly created `.githooks` folder (this will allow to version it). Set the new hooks path with
```
git config core.hooksPath .githooks
```