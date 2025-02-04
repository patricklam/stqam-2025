(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("beamer" "t")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "clisting")
   (add-to-list 'LaTeX-verbatim-environments-local "cpluslisting")
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "etex"
    "amsmath"
    "extarrows"
    "stmaryrd"
    "amsfonts"
    "amssymb"
    "proof"
    "verbatim"
    "latexsym"
    "color"
    "float"
    "url"
    "graphicx"
    "pifont"
    "textpos"
    "xcolor"
    "colortbl"
    "tikz"
    "xspace"
    "listings"
    "mathpartir")
   (TeX-add-symbols
    '("aststyle" 1)
    '("ssem" 4)
    '("sem" 3)
    "mhyphen"
    "bZ"
    "cSkip"
    "cDo"
    "cWhile"
    "cIf"
    "cThen"
    "cElse"
    "cHavoc"
    "cPrint"
    "seq"
    "cAssume"
    "cAssert"
    "vTrue"
    "vFalse"
    "cequiv"
    "Plus"
    "Times"
    "Lt"
    "Gt"
    "TAnd"
    "TOr")
   (LaTeX-add-xcolor-definecolors
    "apricot"
    "codebg"
    "olive"
    "fore"
    "back"
    "title"
    "dgreen"
    "gold"
    "JungleGreen"
    "BlueGreen"
    "RawSienna"
    "Magenta"
    "WaterlooRed"))
 :latex)

