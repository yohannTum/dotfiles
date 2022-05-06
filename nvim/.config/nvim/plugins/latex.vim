" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'

let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Label'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8
