set nocompatible
filetype off

if !exists("g:syntax_on")
  syntax enable
endif

" Color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
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
set ignorecase smartcase
set cursorline
set showcmd
set switchbuf=useopen
set scrolloff=5
set colorcolumn=80

" Unmap the arrow keys
no  <down>  <Nop>
no  <left>  <Nop>
no  <right> <Nop>
no  <up>    <Nop>
ino <down>  <Nop>
ino <left>  <Nop>
ino <right> <Nop>

imap <c-c> <Esc> 

filetype plugin indent on

autocmd Filetype gitcommit setlocal spell textwidth=72

" Plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

Plug 'jwalton512/vim-blade'
Plug 'mxw/vim-jsx'
Plug 'elixir-editors/vim-elixir'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
nnoremap <c-t> :FZF<cr>
nnoremap <c-f> :FZF<cr>

call plug#end()

 
