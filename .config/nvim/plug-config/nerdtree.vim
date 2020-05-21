""*****************************************************************************
"" NERDTREE CONFIGURATION
""*****************************************************************************

let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeHighlightCursorline = 1
" open nerdtree if no file or a directory was given
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close nerdtree when it is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toogle nerdtree
map <F3> :NERDTreeToggle<CR>


