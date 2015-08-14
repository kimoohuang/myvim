"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"study => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=400
set nocompatible
" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
"nmap <leader>w :wa!<cr>
nmap <leader>q :qa!<cr>

" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set cmdheight=1 "The commandbar height
set hid "Change buffer - without saving
" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"syntax enable "Enable syntax hl
filetype plugin on
syntax on

" Set font according to system
  set gfn=Monospace\ 13
  set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme solarized 
  set nonu
else
  colorscheme pyte
  set background=dark
  set nu
endif

set encoding=utf8
set fileencodings=utf8,gbk,gb18030,utf-16,big5
"try
"    lang en_US.utf8
"catch
"endtry

set ffs=unix,dos,mac "Default file types
"hi cursorline cterm=none ctermfg=none ctermbg=darkblue
set cul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" NOTICE: Really useful!

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
map j gj
map k gk

" Close the current buffer
map <leader>bd :Bclose<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
"endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


"Remeber open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"Git branch
"function! GitBranch()
"    try
"        let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
"    catch
"        return ''
"    endtry
"
"    if branch != ''
"        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
"    en
"
"    return ''
"endfunction
"
"function! CurDir()
"    return substitute(getcwd(), '/Users/amir/', "~/", "g")
"endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ Position:\ %l,%c/%L


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^


"Delete trailing white space, useful for Python ;)
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'
"map <leader>o :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 18
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

"if MySys() == "mac"
"    if has("gui_running")
"      set fuoptions=maxvert,maxhorz
"      au GUIEnter * set fullscreen
"    endif
"endif

"============================================
" Taglist setting
noremap <space> :
noremap cl :let @/=""<cr>
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"noremap ts :split<cr>
"noremap tv :vsplit<cr>
nmap <F7> :call ToggleConqueTerm()<cr>
nmap <F8> :NERDTreeToggle<cr><c-w>j
"nmap <F9> :TlistToggle<cr><c-w>j
"nmap <F9> :Tlist<cr><c-w>j
nmap <silent> <F9> :TlistToggle<cr><c-w>j
nmap <F10> :TMiniBufExplorer<cr>:SrcExplToggle<cr>
"map <leader>so :so ~/.vim/vimrc<cr>
map <leader>mk :make<cr>

let Tlist_Exit_OnlyWindow = 1
let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close=1
let Tlist_WinWidth = 28
let Tlist_Display_Prototype = 1
let Tlist_Compact_Format = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_jumpKey = ""
let g:SrcExpl_gobackKey = ""
let g:miniBufExplorerMoreThanOne=1
"let g:miniBufExplSplitBelow=1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:yankring_history_file = '.my_yankring_history_file'
let g:SuperTabMappingBackward = '<c-tab>'
let g:SuperTabDefaultCompletionType = "context"
"let g:tagbar_width = 20
"let g:tagbar_autofocus = 1
"let g:tagbar_autoclose=1
let g:NERDTreeWinSize =20
let g:tex_flavor = "latex"

autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()
function! SaveSession()
       execute 'mksession! $HOME/.vimsession.vim'
endfunction
function! LoadSession()
    if argc() == 0
        execute 'source $HOME/.vimsession.vim'
    endif
endfunction

if has("gui_running")
    let g:do_toggle_term=1
else
    let g:do_toggle_term=1
endif

function! ToggleConqueTerm()
    if g:do_toggle_term == 1
        execute "ConqueTermSplit bash"
    endif
endfunction

set mouse=v
set clipboard =unnamed
set stal=1
set dictionary+=~/.vim/words
"set guifont=Dejavu\ San\ Mono\ 14"

"folding
set foldenable
set foldtext=My_foldline()
set foldcolumn=3
set foldmethod=indent
set foldminlines=8
set foldlevel=1
set fillchars=fold:\ 
function! My_foldline()
    let line = getline(v:foldstart)
    " cleanup unwanted things in first line
    let sub = substitute(line, '/\*\|\*/\|^\s+', '', 'g')
    " calculate lines in folded text
    let nlines = v:foldend - v:foldstart + 1
    "return v:folddashes.sub.'...'.lines.' Lines...'.getline(v:foldend)
    return v:folddashes.sub.' {'.nlines.' Lines Folded}'
endfunction
"I hate fortran!!
"let fortran_fixed_source=1
"let fortran_free_source=1

"template settings
autocmd BufNewFile * silent! 0r $HOME/.vim/templates/%:e.tpl
match Todo /<+.\++>/

let g:template_load = 1

let g:template_tags_replacing = 1

let g:T_AUTHOR = "Jianmeng Huang"

let g:T_AUTHOR_EMAIL = "jianmenghuang<AT>gmail.com"

"let g:T_AUTHOR_WEBSITE = ""

let g:T_DATE_FORMAT = "%Y-%m-%d %H:%M:%S"


""""""""""""""""""""""""""""""
" winManager setting
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr> 

""""""""""""""""""""""""""""""
"tags
set tags=tags;
set autochdir

"""""""""""""""""""""""""""""
"cscope
:set cscopequickfix=s-,c-,d-,i-,t-,e-

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0                                                                                                    
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""
"cscope work
"@cs add /home/jianmeng/work/labjob/xmhf/flickertcb-code/flicker/cscope.out /home/jianmeng/work/labjob/xmhf/flickertcb-code/flicker
"cs add $CSCOPE_DB

"""""""""""""""""""""""""
"sdcv
nmap <leader>sd :! sdcv <c-r><c-w><CR>
"nmap <leader>sd :!sdcv "<cword>" <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""
"asciidoc
au BufRead,BufNewFile *.asc set filetype=asciidoc

""""""""""""""""""""""""
"masm
au BufRead,BufNewFile *.asm set filetype=masm

"""""""""""""""""""""""
""key mapping 
imap jj <Esc>

"""""""""""""""""""""""
""latex-suite

