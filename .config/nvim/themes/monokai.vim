syntax on
colorscheme monokai

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

highlight CodiVirtualText guifg=gray

