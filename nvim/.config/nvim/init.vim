set path+=**

" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader = "\<Space>"

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" =============================================================================
" LSP, linting, fixer
" =============================================================================
" lsp and linting are done with the lua pluggins, ale is just used as a fixer
" TODO: get this done with null-ls
"let g:ale_disable_lsp = 1
"let g:ale_fix_on_save = 1 " only perform fixes after saving
"let g:ale_fixers = {
"    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
"    \}

" =============================================================================
" PLUGINS
" =============================================================================
" Install setup

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Search
Plug 'romainl/vim-cool'               " Disables highlight when search is done
Plug 'haya14busa/incsearch.vim'       " Better incremental search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " FZF plugin, makes Ctrl-P unnecessary
Plug 'junegunn/fzf.vim'

" Colors
"Plug 'patstockwell/vim-monokai-tasty'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'

" Text Manipulation
Plug 'tpope/vim-sensible'             " Some better defaults
Plug 'tpope/vim-unimpaired'           " Pairs of mappings
Plug 'tpope/vim-surround'             " Surround with parentheses & co
Plug 'joom/vim-commentary'            " To comment stuff out
Plug 'terryma/vim-multiple-cursors'   " Multiple cursors like sublime
Plug 'godlygeek/tabular'              " For alignment
Plug 'junegunn/vim-easy-align'        " Easier alignment
Plug 'foosoft/vim-argwrap'            " convert lists of arguments into blocks of arguments
Plug 'tpope/vim-repeat'               " Adds repeat thorugh . to other packages
Plug 'tpope/vim-speeddating'          " Dates in vim

" LSP and linting
" https://github.com/neovim/nvim-lspconfig
" https://github.com/williamboman/nvim-lsp-installer
" use LspInstallInfo to install needed language servers
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim' " formatters and linters

" Fixer
Plug 'dense-analysis/ale'

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'             " Better start screen
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'numtoStr/Comment.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Syntactic language support
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'fatih/vim-go'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


call plug#end()

" https://github.com/awesome-streamers/awesome-streamerrc/tree/master/ThePrimeagen
lua require("theprimeagen")


" =============================================================================
" General (Spaces, tabs, colors)
" =============================================================================
set nocompatible
set signcolumn=yes                    " git gutter always on
set hidden                            " for hidden buffers
set tabstop=4                         " number of visual spaces per TAB
set softtabstop=4                     " number of spaces in tab when editing
set expandtab                         " tabs are spaces, mainly because of python
set shiftwidth=4
set smartindent

"let g:vim_molokai_tasty_italic=1
"colorscheme vim-monokai-tasty
colorscheme tokyonight
"syntax enable                         "enable syntax processing with color scheme

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

" =============================================================================
" UI Config
" =============================================================================
set number                            " show line numbers
set exrc                              " in case each projects has its own vimrc
set guicursor=
set relativenumber
set showcmd                           " show command in bottom bar
set cmdheight=2                       " Give more space for displaying messages
set cursorline                        " highlight current line
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
set updatetime=50
set shortmess+=c                      " Don't pass messages to |ins-completion-menu|
filetype indent on                    " load filetype-specific indent files
filetype plugin on                    " load filetype specific plugin files
set wildmenu                          " visual autocomplete for command menu
set showmatch                         " highlight matchin
set laststatus=2                      " Show the status line at the bottom
set mouse+=a                          " A necessary evil, mouse support
set noerrorbells visualbell t_vb=     " Disable annoying error noises
set splitbelow                        " Open new vertical split bottom
set splitright                        " Open new horizontal splits right
set shortmess+=I                      " Disable the default Vim startupt message
set noswapfile
set nobackup
set undodir=~/.vim/undodirl
set undofile
set scrolloff=8
set colorcolumn=80
set ignorecase
set smartcase                         " but make it case sensitive if an uppercase is entered
set incsearch                         " enable searching as you type


" Formatting
nnoremap <leader>f :Format<CR>

" Better window management (neovim splits)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move text up and down # TODO: not working with mac
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Avoid keeping deleted stuff on clipboard
"vnoremap <p> "_dP # TODO not working

" Prevent bad habits of using arrows
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" =============================================================================
" Git
" =============================================================================
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count        = 0
let g:signify_sign_show_text         = 1
let g:gitgutter_set_sign_backgrounds = 1

" =============================================================================
" Autocommands
" =============================================================================
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
