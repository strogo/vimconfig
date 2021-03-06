if !has("unix")
    colorscheme default
else
    colorscheme desert
endif

set encoding=UTF8
set formatoptions=l
set linebreak " break long lines automatically if appropriate

"" Line numbering
set nu
set numberwidth=5

"" Status line stuffed with tons of info
set ruler
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%c@%l/%L\ (%p%%)]

"" Some custom key maps
" The j/k mappings make vim move to the next 'visible' line instead of jumping
" to the next 'actual' line. Therefor if vim doesn't automatically break
" lines but instead does some internal wrapping, you can still reach that
" wrapped line with j and k.
nmap <C-T> :FuzzyFinderFile<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-f> vapgq
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"" Highlighting
syntax enable

highlight Error ctermbg=darkred ctermfg=white guibg=darkred guifg=white
match Error /\s\+$/

"" Helper function/command for marking overly long lines
" Based on http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns/235970#235970
function HighlightAfter(v)
    highlight clear OverLength
    let start = str2nr(a:v)
    if start > -1
        let re = '\%' . a:v . 'v.\+'
        call matchadd("Error", re)
    endif
endfunction
command -nargs=1 HLE :call HighlightAfter(<f-args>)

""" If working in the console, use a dark theme
if !has("gui_running")
    if has("unix")
        set term=xterm
    endif
    set background=dark
else
    if has("macunix")
        set guifont=DejaVuSansMono:h14
    elseif !has("unix")
        set guifont=Courier\ New:h10
    endif
    colorscheme osx_like
    "" I like my guis light and wide
    set background=light
    set cul " also highlight the current line

    "" Go into complete fullscreen mode
    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen

    imap <C-A> <HOME>
    imap <C-E> <END>
    imap <C-S> <Esc>:w<CR>i
    
    nmap <D-S-LEFT> :tabprevious<CR>
    nmap <D-S-RIGHT> :tabnext<CR>
    nmap <D-1> 1gt
    nmap <D-2> 2gt
    nmap <D-3> 3gt
    nmap <D-4> 4gt
    nmap <D-5> 5gt
endif

set backspace=indent,eol,start

"" ignore these files always
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store

set swapfile! "" Don't produce swap files
let use_xhtml = "1"

"" Highlight matching braces
set showmatch

"" Some mapping for MRU und NERDTree
map <C-B> :NERDTreeToggle<CR>
map <C-M> :MRU<CR>

set incsearch
"" Expand tabs to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
"" Some indent modes. I really have to find the time to clean them up
set ai
set si
set textwidth=78
set display=lastline "avoid some ugly wrapping at the file-end when scrolling
filetype indent on  "indent depends on filetype
filetype plugin on

"" Set some custom filetypes
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
autocmd BufNewFile,BufRead *.mako set syntax=html
autocmd BufNewFile,BufRead *.rst set syntax=rest
autocmd BufNewFile,BufRead *.mkd set filetype=mkd
autocmd BufNewFile,BufRead *.mdown set filetype=mkd
autocmd BufNewFile,BufRead *.mxml set filetype=mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufRead,BufNewFile * set path=$PWD/**

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" http://www.nabble.com/Restore-cursor-position-on-opening-file-td18705333.html
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" Do some spell checking
set spelllang=de,en
set spellsuggest=5 " I only want the top 5 suggestions
