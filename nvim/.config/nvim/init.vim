" Fish doesn't play all that well with others
set shell=/bin/bash
let mapleader = "\<Space>"

" Plugin setup
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"call plug#begin('~/.vim/plugged')
call plug#begin()

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
"Plug 'justinmk/vim-sneak' # overwrites 's'
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

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native/.nvim'

" lint
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

call plug#end()

" Source main vimrc
source ~/.vimrc
