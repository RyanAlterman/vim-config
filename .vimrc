filetype plugin indent on
syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set number
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=100
set showtabline=2

let &t_SI="\e[5 q"
let &t_EI="\e[1 q"

autocmd BufNewFile,BufRead *.rs set filetype=rust

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

set background=dark
let g:gruvbox_italic=1
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1

" Set the theme to gruvbox if we can
if has('gui_running') || has('nvim')
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_transparent_bg = 1

    set termguicolors

    colorscheme gruvbox
else
    colorscheme inkpot
endif

" As-you-type autocomplete
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

let g:rustfmt_autosave = 1

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }
let g:ale_linters = {'rust': ['analyzer'] }

noremap <silent><localleader>cb :Cbuild<cr>

""" Customize colors of pop up menu
hi Pmenu guifg=#bcbcbc guibg=#262626
hi PmenuSel guifg=#bcbcbc guibg=#af5f5f
