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
" PLUGINS
" =============================================================================
" Install setup
"set MYVIMRC="$HOME/.config/nvim/init.vim"
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Search
Plug 'romainl/vim-cool'               " Disables highlight when search is done
Plug 'haya14busa/incsearch.vim'       " Better incremental search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " FZF plugin, makes Ctrl-P unnecessary
Plug 'junegunn/fzf.vim'

" Colors
Plug 'patstockwell/vim-monokai-tasty'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
"Plug 'justinmk/vim-sneak' " This overrides using 's'
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
" Interacts with coc Plug 'tpope/vim-endwise'              " Ends control flow indentifiers
Plug 'tpope/vim-repeat'               " Adds repeat thorugh . to other packages
Plug 'tpope/vim-speeddating'          " Dates in vim
Plug 'dense-analysis/ale'             " https://github.com/dense-analysis/ale

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'             " Better start screen
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

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
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
"syntax on                             " Turn on syntax highlighting.
let g:vim_molokai_tasty_italic=1
colorscheme vim-monokai-tasty
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
" Prevet bad habits of using arrows
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
" Ale LSP, linting
" =============================================================================
let g:ale_completion_enabled = 1 " autocompletion
highlight clear ALEErrorSign
highlight clear ALEWarningSign
" better looking signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_fix_on_save = 1 " only perform fixes after saving
let g:ale_fixers = {
    \    '*': ['remove_trailing_lines', 'trim_whitespace'],
    \    'python': ['black']
    \}
let g:ale_python_pylint_options = '--rcfile ~/.vim/plugin/pylint.rc'
let g:ale_exclude_highlights = ['line too long', 'too many arguments', 'too many locals', 'lazy % formatting', 'string statement', 'method docstring', 'snake_case', 'outer scope', 'trailing whitespace', 'constant name']
let g:ale_completion_enabled = 1
" jump through linting errors/warnings
nmap <silent> <C-e> <Plug>(ale_next_wrap)
" go to the definition of the word under the cursor
nmap <silent> <C-g> <Plug>(ale_go_to_definition_in_split)
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

"augroup highlight_yank
"    autocmd!
"    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
"augroup END
