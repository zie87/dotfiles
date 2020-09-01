""*****************************************************************************
"" NERDTREE CONFIGURATION
""*****************************************************************************
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeHighlightCursorline = 1
let g:nerdtree_sync_cursorline = 1

" close if nerdtree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
