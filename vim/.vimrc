" https://dougblack.io/words/a-good-vimrc.html

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible
set signcolumn=yes

" Turn on syntax highlighting.
syntax on

" lint
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:ale_exclude_highlights = ['line too long', 'lazy % formatting', 'string statement', 'method docstring', 'snake_case', 'outer scope', 'trailing whitespace', 'constant name']
let g:ale_completion_enabled = 1

" git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
let g:gitgutter_set_sign_backgrounds = 1

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:molokai_original = 1
"colorscheme molokai " Monokai-like colorscheme
let g:vim_molokai_tasty_italic=1
colorscheme vim-monokai-tasty
syntax enable "enable syntax processing

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces, mainly because of python
set shiftwidth=4
set smartindent

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set exrc                " in case each projects has its own vimrc
set guicursor=
set relativenumber
set showcmd             " show command in bottom bar
" Give more space for displaying messages
set cmdheight=2
set cursorline          " highlight current line
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
set updatetime=50
" Don't pass messages to |ins-completion-menu|
set shortmess+=c
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " Show the status line at the bottom
set mouse+=a            " A necessary evil, mouse support
set noerrorbells visualbell t_vb=    "Disable annoying error noises
set splitbelow          " Open new vertical split bottom
set splitright          " Open new horizontal splits right
set shortmess+=I        " Disable the default Vim startupt message
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set colorcolumn=80

" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase " But make it case sensitive if an uppercase is entered
"set hlsearch  " highlight matches
" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
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

" Remapping keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remaps works as follows: mode lhs rhs
" mode will be a letter that indicates the mode from which the
" action will take place
" lhs: the thing you need to execute to execute the remap
" rhs: the thing that will be executed with the remap
" nore: no recursive execution
let mapleader = " "
nmap <silent> <C-e> <Plug>(ale_next_wrap)
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
