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
set hidden
set history=10000
set number
set expandtab
set softtabstop=2
set shiftwidth=2
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
set wildmode=longest,list
set mouse=a

" Indentation
autocmd FileType html       setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php        setlocal ts=4 sts=4 sw=4 expandtab

" Multipurpose tab key
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

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
Plug 'pangloss/vim-javascript'
Plug 'jwalton512/vim-blade'
Plug 'mxw/vim-jsx'
Plug 'elixir-editors/vim-elixir'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
call plug#end()

" EasyAlign
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)
" Vim Javascript
let g:javascript_plugin_jsdoc = 1
" FZF
nnoremap <c-t> :FZF<cr>
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-l> :Lines<cr>

