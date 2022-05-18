"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

syntax on
set nocompatible
set t_Co=256 " force 256 colors on the terminal
set hidden
set termguicolors

au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
set clipboard+=unnamedplus " synchronize clipboard with the system
set expandtab
set nowrap
set shiftwidth=4
set tabstop=4 softtabstop=4
set title

"" Behavior : 
set backspace=eol,indent,start " Make backspace behave as expected
set incsearch       " incremental searches
set mouse=a
set noerrorbells        " no sound at the end of the line
set noswapfile          " disable swapefile
set sidescrolloff=15
set smartindent
set smartcase
" set so=999              " center the cursor with the window
set so=3                " see up and down to 5 lines

" neovim not compatible anymore with this feature
if !has('nvim') " specific to vim
    set undofile
    set undodir=~/.vim/undodir
end

"" Interface :
set colorcolumn=80
set hlsearch		" highlight searches
set laststatus=2 	" status line always showed
set noshowmode
set nu
set relativenumber
set showcmd 		" see 'dd' and other commands
set wildmenu		" better command-line completion

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

" Space bar become the main shortcut in vim
let mapleader = " "
nnoremap <leader> <C-w>

" make curly braces not alter the jumplist (normal and visual mode)
nnoremap <silent> { :keepjumps normal! }<cr>
nnoremap <silent> } :keepjumps normal! {<cr>
xnoremap <silent> } :<C-u>keepjumps normal! gv{<cr>
xnoremap <silent> { :<C-u>keepjumps normal! gv}<cr>

" vertical navigation
nnoremap <A-j> <C-d>
nnoremap <A-k> <C-u>
nnoremap <C-j> 10j
nnoremap <C-k> 10k

vnoremap <A-j> <C-d>
vnoremap <A-k> <C-u>
vnoremap <C-j> 10j
vnoremap <C-k> 10k

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" b = buffer commands
nnoremap <leader>bs :ls<CR>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
        echo "Installing VimPlug..."
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                autocmd VimEnter * PlugInstall
                endif

call plug#begin('~/.vim/plugged')
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/fugitive.vim " need to define a letter (gs)
source ~/.config/nvim/plugins/fzf.vim " leader p
source ~/.config/nvim/plugins/latex.vim
source ~/.config/nvim/plugins/undotree.vim " leader u
" source ~/.config/nvim/plugins/ripgrep.vim
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

"--------------------------------------------------------------------------
" Colorscheme
"--------------------------------------------------------------------------

Plug 'tanvirtin/monokai.nvim'
" source ~/.config/nvim/plugins/awesome_colorschemes.vim
source ~/.config/nvim/plugins/gruvbox.vim
" source ~/.config/nvim/plugins/synthwave.vim
" source ~/.config/nvim/plugins/papercolor.vim

call plug#end()

" Actions after plug#end()
doautocmd User PlugLoaded
""""" needs to be reworked
set shortmess+=c
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup = 1
let g:lsp_diagnostics_echo_cursor = 1

