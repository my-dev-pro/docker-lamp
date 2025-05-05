" Basic Settings
set nocompatible            " Disable vi compatibility
filetype plugin indent on   " Enable filetype detection and plugins
syntax enable              " Enable syntax highlighting
set encoding=utf-8         " Set default encoding
set hidden                 " Allow buffer switching without saving
set history=1000           " Increase command history
set autoread               " Reload files changed outside vim

" UI Config
set number                " Show line numbers
" set relativenumber        " Show relative line numbers
set cursorline           " Highlight current line
set colorcolumn=80       " Show column guideline
set showmatch            " Highlight matching brackets
set scrolloff=5          " Keep 5 lines above/below cursor
set laststatus=2         " Always show status line
set wildmenu             " Better command-line completion
set wildmode=list:longest,full
set splitright           " Open vertical splits to the right
set splitbelow           " Open horizontal splits below

" Editing
set expandtab            " Use spaces instead of tabs
set tabstop=4            " Number of spaces per tab
set shiftwidth=4         " Number of spaces for autoindent
set softtabstop=4        " Number of spaces for tab key
set autoindent           " Copy indent from current line
set smartindent          " Do smart autoindenting
set backspace=indent,eol,start " Allow backspacing over everything
set formatoptions+=j     " Delete comment char when joining lines
set clipboard=unnamedplus " Use system clipboard

" Search
set incsearch           " Show search matches as you type
set hlsearch            " Highlight search terms
set ignorecase          " Case insensitive search
set smartcase           " Case sensitive when uppercase present

" PHP-specific settings
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType php setlocal iskeyword+=$

" Key Mappings
let mapleader = ","      " Set leader key to comma

" Quick escape from insert mode
inoremap jj <ESC>

" Clear search highlights
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Buffer navigation
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick save
nnoremap <leader>w :w<CR>

" Plugin Management (using vim-plug)
call plug#begin('~/.vim/plugged')

" PHP-specific plugins
Plug 'StanAngeloff/php.vim', {'for': 'php'}       " Better PHP syntax
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'tobyS/pdv', {'for': 'php'}                  " PHP Documentor
Plug 'tobyS/vmustache', {'for': 'php'}            " Dependency for pdv

" General coding plugins
Plug 'tpope/vim-commentary'       " Comment/uncomment lines
Plug 'tpope/vim-surround'         " Easily change surroundings
Plug 'tpope/vim-repeat'           " Repeat plugin commands
Plug 'jiangmiao/auto-pairs'       " Auto-close brackets, quotes, etc.
Plug 'majutsushi/tagbar'          " Class outline viewer
Plug 'ctrlpvim/ctrlp.vim'         " Fuzzy file finder
Plug 'vim-airline/vim-airline'    " Status/tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'     " Git diff in gutter
Plug 'tpope/vim-fugitive'         " Git integration
Plug 'sheerun/vim-polyglot'       " Better language support
Plug 'dense-analysis/ale'         " Async linting engine

call plug#end()

" Plugin Configurations

" PHP Actor
let g:phpactorPhpBin = 'php'
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'

" PDV (PHP Documentor)
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>doc :call pdv#DocumentCurrentLine()<CR>

" ALE (Linting)
let g:ale_fixers = {
\   'php': ['php_cs_fixer', 'phpcbf'],
\}
let g:ale_linters = {
\   'php': ['php', 'phpstan', 'psalm'],
\}
let g:ale_fix_on_save = 1
let g:ale_php_phpcs_standard = 'PSR12'
let g:ale_php_phpcbf_standard = 'PSR12'

" CtrlP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|jar|swp)$',
  \ }

" Tagbar
let g:tagbar_type_php = {
    \ 'ctagstype' : 'php',
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
\ }
nnoremap <leader>t :TagbarToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" GitGutter
set updatetime=100 " For better GitGutter performance

" Colorscheme
set background=dark
