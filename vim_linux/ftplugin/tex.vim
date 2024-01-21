" TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
" set iskeyword+=:
"
"
let g:Tex_DefaultTargetFormat = 'pdf'

let g:Tex_FormatDependency_pdf = 'pdf'

let g:Tex_CompileRule_dvi = 'latex -synctex=1 -src-specials --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -t letter -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 -dCompatibilityLevel=1.3 $*.ps'
let g:Tex_CompileRule_pdf = 'pdflatex $*' 


" https://facwiki.cs.byu.edu/nlp/index.php/Vim%2BLaTeX_on_Linux
let g:Tex_UseEditorSettingInDVIViewer = 1

let g:Tex_ViewRule_ps = 'okular'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_ViewRule_dvi = 'okular'

" The following two refs from:
" http://blog.csdn.net/ustc_dylan/article/details/6085150
" not tested yet
" 写出/cite{ 后按 F9 " 无反应，没有给出交叉引用，原因在于vim中的Python接口对latex-suite来说有些问题，将其禁用即可
"let g:Tex_UsePython = 0

" 为了能够正向搜索，应设定好参数并使用/ll编译，然而当工作目录下有makefile时，/ll并非执行设定的编译命令，而是执行makefile，于是导致无法正向搜索，只要禁用makefile即可
let g:Tex_UseMakefile = 0


" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
set sw=2
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:
