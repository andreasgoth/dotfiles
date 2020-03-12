set nocompatible
filetype plugin indent on

if !exists("g:syntax_on")
  syntax enable
endif

let mapleader=" "
map <leader>s :source ~/.config/nvim/init.vim<cr>

" Colors
set termguicolors
set background=dark
colorscheme andreasgoth

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
set splitbelow splitright
set clipboard=unnamed

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '×'
let g:ale_lint_delay = 500

function! LinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

" Statusline
set statusline=
set statusline +=\%1* " User 1 color (statusline path)
set statusline +=\ %{expand('%:h')}       " path
set statusline +=/%2* " User 2 color (statusline filename)
set statusline +=%t                       " filename
set statusline +=%m                     " modified flag
set statusline +=\ %3*  " file type
set statusline +=%y                     " file type
set statusline+=\ %4*
set statusline+=\ %{LinterOK()}
set statusline+=\ %5*
set statusline+=\ %{LinterWarnings()}
set statusline+=\ %6*
set statusline+=\ %{LinterErrors()}%*

set statusline +=%=                       " %= means right side
set statusline +=\ %-3v                  " virtual column number
set statusline +=\ %l/%L\ \              " current line

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

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

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

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

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
nnoremap <c-t> :GFiles --exclude-standard --others --cached<cr>
nnoremap <c-p> :GFiles --exclude-standard --others --cached<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <c-l> :Lines<cr>

" Gutentags - enable in defined dirs, or dirs with .withtags
let g:gutentags_enabled_dirs = ['~/repos']
let g:gutentags_enabled_user_func = 'CheckEnabledDirs'

function! CheckEnabledDirs(file)
    let file_path = fnamemodify(a:file, ':p:h')

    try
        let gutentags_root = gutentags#get_project_root(file_path)
        if filereadable(gutentags_root . '/.withtags')
            return 1
        endif
    catch
    endtry

    for enabled_dir in g:gutentags_enabled_dirs
        let enabled_path = fnamemodify(enabled_dir, ':p:h')

        if match(file_path, enabled_path) == 0
            return 1
        endif
    endfor

    return 0
endfunction

" Gutentags exclude
let g:gutentags_ctags_exclude = [
  \"*.min.js",
  \"*.min.css",
  \"build",
  \"vendor",
  \".git",
  \"node_modules",
\]

" Customize fzf colors to match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'FzfFg'],
  \ 'bg':      ['bg', 'FzfBg'],
  \ 'hl':      ['fg', 'FzfHighlight'],
  \ 'fg+':     ['fg', 'FzfFgPlus'],
  \ 'bg+':     ['bg', 'FzfBgPlus', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'FzfHighlightPlus'],
  \ 'info':    ['fg', 'FzfInfo'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'FzfPrompt'],
  \ 'pointer': ['fg', 'FzfPointer'],
  \ 'marker':  ['fg', 'FzfMarker'],
  \ 'spinner': ['fg', 'FzfSpinner'],
  \ 'header':  ['fg', 'FzfHighlight'] }

