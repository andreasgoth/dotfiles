" Basic editing configuration
set nocompatible
filetype off

if !exists("g:syntax_on")
  syntax enable
endif

" Color
:set termguicolors
:set t_8f=[38;2;%lu;%lu;%lum
:set t_8b=[48;2;%lu;%lu;%lum
:set background=dark
:colorscheme andreasgoth

" Basic editing configuration 
set history=10000
set number
set expandtab
set tabstop=2
set autoindent
set showmatch
set incsearch
set hlsearch
" Make searches cas-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set showcmd
set switchbuf=useopen
set scrolloff=5

" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

imap <c-c> <Esc> 

filetype plugin indent on

autocmd Filetype gitcommit setlocal spell textwidth=72

" Highlight long lines (>80)
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=052 guibg=#111111
  autocmd BufEnter * match OverLength /\%81v.*/
augroup END

