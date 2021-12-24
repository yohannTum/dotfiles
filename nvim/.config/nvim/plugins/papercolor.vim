Plugin 'NLKNguyen/papercolor-theme'

augroup PapercolorOveride
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme PaperColor
augroup end

set background=dark
