"" Distro and stability reasons :
runtime! archlinux.vim
set nocompatible
" force 256 colors on the terminal
set t_Co=256
set hidden

"" Text :
syntax on
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
set hlsearch		" highlight searches
set incsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smartcase

" let g:lightline = {L5
"         \ 'colorscheme': 'selenized_black',
"         \ }
set background=dark


"" Behavior : 
set noerrorbells " no sound at the end of the line
set noswapfile
set undodir=~/.vim/undodir
set undofile
set mouse=a
set smartindent

"" make curly braces not alter the jumplist (normal and visual mode)
nnoremap { :keepjumps normal! }<cr>
nnoremap } :keepjumps normal! {<cr>
xnoremap } :<C-u>keepjumps normal! gv}<cr>
xnoremap { :<C-u>keepjumps normal! gv{<cr>


"" Interface :
" Make backspace behave as expected
set backspace=eol,indent,start

set laststatus=2 	" status line always showed
set showcmd 		" see 'dd' and other commands
set wildmenu		" better command-line completion
set nu
set relativenumber
set colorcolumn=80
set noshowmode



"" Plugins :
call plug#begin('~/.vim/plugged')
" Themes :
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'yuttie/comfortable-motion.vim'
" Plug 'jremmen/vim-ripgrep'
" Plug 'vim-utils/vim-man'
Plug 'tpope/vim-fugitive'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'dark'

"" Shortcuts :
" Space bar become the main shortcut in vim
let mapleader = " "
nnoremap <leader> <C-w>


"" Clear highlighting on escape in normal mode
" nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[

" g = Gitfugitive (git commands)
noremap <leader>gs :Gstatus<cr>

" b = buffer commands
nnoremap <leader>bs :ls<CR>

" t = tabs commands
" w or v = window commands


nnoremap <leader>u :UndotreeShow<CR>

" FZF part :
nnoremap <silent> <Leader>p :FZF<cr>
nnoremap <silent> <Leader>P :FZF --exact<cr>


let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
