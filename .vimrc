" __________    __________
" \______   \   \______   \
"  |    |  _/    |     ___/
"  |    |   \    |    |
"  |______  / /\ |____|
"         \/  \/
" ---------------------------------------------------
" A.I (BinaryPax) => Vim custom configuration file
" Vim Plug as plugin manager
" Don't forget to create the undodir at ~/.vim/undodir
" ---------------------------------------------------
"
" setup folds {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" ---------------------------------------------------
" Basic Configs
" ---------------------------------------------------

"  basic configs {{{
syntax on
set noerrorbells
set encoding=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ignorecase
set colorcolumn=80
set smartcase
set cursorline
set spell spelllang=en_us
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set cursorcolumn
set scrolloff=8
set pastetoggle=<F2>
" set clipboard=unnamed,unnamedplus
filetype plugin indent on
" }}}

" ---------------------------------------------------
" Plugins (Vim Plug)
" ---------------------------------------------------

" plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'unblevable/quick-scope'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tmhedberg/simpylfold'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
call plug#end()
" }}}

" ---------------------------------------------------
" Aesthetics
" ---------------------------------------------------

" Aesthetics {{{
if !has('gui_running')
      set t_Co=256
endif

if (has("termguicolors"))
      set termguicolors
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

" For these lines to take effect they must come after the call of Gruvbox
" ctermbg=lightgrey
" highlight ColorColumn guibg=lightblue
" Transparency
" hi Normal guibg=NONE ctermbg=NONE
" When enabling transparency (line above), underline for spell check is lost,
" the following line brings it back
hi clear SpellBad
hi SpellBad cterm=underline

" Netrw

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
" }}}

" ---------------------------------------------------
" Custom Mappings & Shortcuts
" ---------------------------------------------------

" mappings {{{
let mapleader = " "

nnoremap <silent> <leader>z :Files<CR>

" Fix spelling errors with <leader>f & toggle spell check with <leader>s
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!<cr>

" use jh instead of ESC to leave insert mode
inoremap jh <Esc>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" C-e to go to end of line in Insert mode
inoremap <C-e> <C-o>A

" Execute Python3 with <F9>
nnoremap <buffer> <F9> :exec '!clear;python3' shellescape(@%, 1)<cr>

" Open terminal below
noremap <leader>t :below terminal<CR>
" }}}

" --------------------------------------------
" Plugins Configuration
" --------------------------------------------

" plugins configuration {{{
" Indentline
let g:indentLine_fileTypeExclude = ['markdown','json']
" let g:indentLine_setConceal = 0

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" " Flake8
" autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR>
" }}}

" --------------------------------------------
" Auto Commands
" --------------------------------------------
" auto commands {{{
" Remove trailing white space at save
autocmd  BufWritePre * %s/\s\+$//e

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" FIX COLON INDENT IN YAML FILE
au FileType yaml setlocal indentkeys-=<:>
" ---------------------------------------------------
" Settings per file type
" ---------------------------------------------------
au BufNewFile,BufRead *.py
    \| set textwidth=79
    \| set fileformat=unix
    \| let python_highlight_all=1
au BufNewFile,BufRead *.js,*.html,*.css
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2
" }}}

" ---------------------------------------------------
" Temporary settings
" ---------------------------------------------------

" temporary settings {{{
" Disable arrow keys
" }}}
