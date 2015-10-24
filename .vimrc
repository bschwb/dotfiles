set nocompatible              " be iMproved, required by Vundle
filetype off                  " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required

" Coding Tools
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'altercation/vim-colors-solarized'

" Coding Infrastructur
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" File/Navigation
Plugin 'scrooloose/nerdtree' " filebrowser
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, mru, tag finder.
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'

" C++
Plugin 'octol/vim-cpp-enhanced-highlight'

" Haskell
Plugin 'bitc/vim-hdevtools'
Plugin 'vim-scripts/haskell.vim'
Plugin 'wting/lhaskell.vim'

" Python
"Plugin 'fs111/pydoc.vim'

" Markdown
Plugin 'plasticboy/vim-markdown'

" Coq
Plugin 'def-lkb/vimbufsync'
Plugin 'the-lambda-church/coquille'

call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle

" use space as leader
nnoremap <space> <nop>
let mapleader = "\<space>"

" kill Ex-mode
nnoremap Q <nop>

"language tool
let g:languagetool_jar = '$HOME/.vim/LanguageTool/languagetool-commandline.jar'

" buffers
set hidden

" indentation etc.
set backspace=indent,eol,start
set tabstop=2
set expandtab       " Always uses spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set shiftround      " Round indent to nearest shiftwidth multiple
set autoindent

set history=200
set ruler
set laststatus=2 " also display statusbar when only one window is open
set number

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase " use casesensitive searching when using uppercase-chars
set gdefault
" undo search highlighting
nnoremap <leader><leader> :noh<cr>

set wildignorecase " filename ignorecase
set wildmenu " visual autocomplete for command menu
" files to ignore when opening files
set wildignore+=*.swp " vim swap-files
set wildignore+=*.o,*.so " c++ object and shared-object
set wildignore+=*.aux,*.pdf,*.log " latex
set wildignore+=*.hi  " haskell

set autochdir " automatically change window's cwd to file's dir

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupdir=~/.vim/tmp/undo//

" mark column 80 and wrap text at column 79
set wrap
set textwidth=79
set colorcolumn=80

" highlight the current line
set cursorline

scriptencoding utf-8

" enable folder specific vimrc
set exrc
set secure

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//e
  exe "normal `z"
endfunc

" Colorsettings
syntax on " Syntax Highlighting
set t_Co=16
set background=dark
colorscheme solarized

" Toggle colorscheme between dark and light
call togglebg#map("<F5>")

" --------------------- Keys ----------------------------
" quick reload vimrc
nnoremap <leader>r :source $MYVIMRC<cr>

" invoke make and open quickfix window in case of errors
nnoremap <leader>m :silent make\|redraw!\|cw<cr>

" yank to end of line with "Y" instead of a synonym for yy (linewise)
nnoremap Y y$

" sane up-down moving
noremap k gk
noremap j gj

" better backward moving to end of word
noremap <c-e> ge
noremap <c-E> gE

" copy & paste to system clipboard
map <leader>y "+y
map <leader>d "+d
map <leader>p "+p
map <leader>P "+P

" make tab move to matching bracket pairs
map <tab> %

" save file
nnoremap <leader>w :w<cr>
" close window
nnoremap <Leader>q :q<cr>
" new vertical window split and switch
nnoremap <leader>v <c-w>v<c-w>l
" nnoremap <leader>s <c-w>s<c-w>k

" easy window navigation
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l

" Use <leader>; to toggle display of whitespace
nnoremap <leader>; :set list!<cr>

" Use <leader>t to go to move between tags
nmap <leader>] <c-]>
nnoremap <leader>tf :tfirst<cr>
nnoremap <leader>tl :tlast<cr>
nnoremap <leader>tn :tnext<cr>
nnoremap <leader>tp :tprevious<cr>

" Line control
nnoremap <c-j> :join<cr>

" Folding
set foldmethod=indent
set foldlevel=99

" Buffer handling
nnoremap K :bn<cr>
nnoremap J :bp<cr>
nnoremap <leader>bf :bf<cr>
nnoremap <leader>bl :bl<cr>
nnoremap <leader>x :bd<cr>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" CtrlP
let g:ctrlp_map = '<leader>o'
let g:ctrlp_extensions = ['tag']
nnoremap <leader>bo :CtrlPBuffer<cr>
nnoremap <leader>to :CtrlPTag<cr>

" Fugitive
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gw :Gwrite<cr>

" NERDTree
nnoremap <F2> :NERDTreeToggle<cr>

" Use neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"

" Tagbar
nmap <F9> :TagbarToggle<cr><c-w>l

" Align

" Stop Align plugin from forcing its mapping on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <leader>a= :Align =<cr>
" Align on comma
map <leader>a, :Align ,<cr>
" Align on pipes
map <leader>a<bar> :Align <bar><cr>
" Prompt for align character
map <leader>ap :Align 

" Enable some tabular presets for Haskell
let g:haskell_tabular=1

" Syntastic
nnoremap <silent> <leader>e :Errors<cr>
nnoremap <leader>s :SyntasticToggleMode<cr>
let g:syntastic_html_tidy_exec = "/usr/local/bin/tidy"

let g:syntastic_cpp_compiler_options = "-std=c++11 -fopenmp"
let g:syntastic_cpp_include_dirs = ["/home/bernd/projects/ng/netgen/include", "/home/bernd/projects/ng/amg_reloaded/amg"]

let g:syntastic_haskell_hdevtools_args = "-g -package-db=$CABAL_SANDBOX_PACKAGE_PATH"


" hdevtools
au FileType haskell nnoremap <buffer> <leader>tp :HdevtoolsType<cr>
au FileType haskell nnoremap <buffer> <silent> <leader>tc :HdevtoolsClear<cr>
au FileType haskell nnoremap <buffer> <silent> <leader>ti :HdevtoolsInfo<cr>

" ghc-mod
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" pointfree
autocmd BufEnter *.hs set formatprg=pointfree


" airline
let g:airline#extensions#tabline#enabled = 1

" Mutt
au BufRead /tmp/mutt-* set textwidth=72
