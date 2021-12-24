" Plug 'rafi/awesome-vim-colorschemes'
Plug 'sainnhe/sonokai'

augroup AwesomeOveride
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme sonokai
augroup end

let g:sonokai_transparent_background = 1

" let g:sonokai_style = 'default'
let g:sonokai_style = 'shusia'
" let g:sonokai_style = 'espresso'
" let g:sonokai_style = 'shusia'
