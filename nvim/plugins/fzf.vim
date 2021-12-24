Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


nnoremap <silent> <Leader>p :FZF<cr>
nnoremap <silent> <Leader>P :FZF --exact<cr>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
