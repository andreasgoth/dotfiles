
" ----------------------------------------------------------------------------
"   Plugins
" ----------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugins')

" General plugins
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'

" Langs etc
Plug 'elixir-editors/vim-elixir'
Plug 'evanleck/vim-svelte'
Plug 'jwalton512/vim-blade'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

call plug#end()


" ----------------------------------------------------------------------------
"   General config
" ----------------------------------------------------------------------------

filetype plugin indent on

if !exists("g:syntax_on")
  syntax enable
endif

" Colors
set termguicolors
set background=dark
colorscheme andreasgoth

" Basic editing configuration
set clipboard=unnamed
set colorcolumn=80   " Highlight column
set cursorline
set hidden           " Don't unload buffers when leaving them
set history=10000
set mouse=a
set number
set scrolloff=5      " Minimum lines to keep above or below the cursor
set showcmd
set showmatch
set splitbelow
set splitright
set switchbuf=useopen
set wildmode=longest,list

" Indentation
set autoindent       " Copy indent from current line when starting a new line
set expandtab        " Indent with spaces
set shiftwidth=2     " Number of spaces to use when indenting
set softtabstop=2    " Number of spaces a <tab> counts for when inserting

" Searching
set hlsearch
set ignorecase
set incsearch
set smartcase

" 'Invisible' characters
set list                    " Show some more characters
set listchars+=extends:❯    " Char representing an extending line
set listchars+=nbsp:␣       " Non breaking space
set listchars+=precedes:❮   " Char representing an extending line in the other direction
set listchars+=trail:·      " Show trailing spaces as dots
set listchars=tab:▸\        " Char representing a tab

" netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" ALE
let g:ale_lint_delay = 500
let g:ale_sign_column_always = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '⚠'

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
set statusline +=\%1*                " User 1 color (statusline path)
set statusline +=\ %{expand('%:h')}  " path
set statusline +=/%2*                " User 2 color (statusline filename)
set statusline +=%t                  " filename
set statusline +=%m                  " modified flag
set statusline +=\ %3*               " file type
set statusline +=%y                  " file type
set statusline+=\ %4*
set statusline+=\ %{LinterOK()}
set statusline+=\ %5*
set statusline+=\ %{LinterWarnings()}
set statusline+=\ %6*
set statusline+=\ %{LinterErrors()}%*

set statusline +=%=                  " %= means right side
set statusline +=\ %-3v              " virtual column number
set statusline +=\ %l/%L\ \          " current line

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


" ----------------------------------------------------------------------------
"   Plugin configs
" ----------------------------------------------------------------------------

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


" ----------------------------------------------------------------------------
"   Mappings
" ----------------------------------------------------------------------------

let mapleader=" "

imap <c-c> <Esc>

" Reload nvim config
map <leader>§ :source ~/.config/nvim/init.vim<cr>

" Fix annoying user mistakes
command! W w
command! Q q

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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


" ----------------------------------------------------------------------------
"   Auto commands
" ----------------------------------------------------------------------------

" Indentation
autocmd FileType html       setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php        setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype gitcommit  setlocal spell textwidth=72

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

