" Plug 'morhetz/gruvbox'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

augroup GruvboxOveride
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme gruvbox
augroup end

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1
let g:gruvbox_colors_bg1 = '#111213'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
end

let g:gruvbox_invert_selection='0'
set background=dark
