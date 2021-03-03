syntax on

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
endif

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

highlight CodiVirtualText guifg=gray
colorscheme monokai
"colorscheme vim-monokai-tasty

" Switch to your current theme
" let g:airline_theme='molokai'
let g:airline_theme='monokai_tasty'
