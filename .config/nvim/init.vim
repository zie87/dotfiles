" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')


" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" source code management
Plug 'APZelos/blamer.nvim'
Plug 'paul-nechifor/vim-svn-blame'

" language and completion settings
Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'scrooloose/nerdcommenter'
" cmake support
Plug 'ilyachur/cmake4vim'
" markdown support
Plug 'plasticboy/vim-markdown'

" scheme
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
" Initialize plugin system
call plug#end()

" init completion engine
let g:deoplete#enable_at_startup = 1
" init git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" nerd tree configs
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeGitStatusWithFlags = 1

" open nerdtree if started with dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if nerdtree is the last buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" language servers
lua require 'nvim_lsp'.clangd.setup{}
autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" general configuration
set spell spelllang=en_us
set spellcapcheck=""
set number
set cursorline
set laststatus=2
" enable mouse support
set mouse=a
" enable undo file to provide undo information even if buffer is closed
set undofile

" show tabs and spaces
set lcs=trail:·,tab:»·
set list
set expandtab
set shiftwidth=4
" enable tabs for make files and python
autocmd FileType make setlocal noexpandtab
autocmd FileType python setlocal noexpandtab

" color scheme
syntax on
colorscheme monokai

"set background=dark
"set background=light
"let g:gruvbox_contrast_light="hard"
"let g:gruvbox_italic=1
"let g:gruvbox_invert_signs=0
"let g:gruvbox_improved_strings=0
"let g:gruvbox_improved_warnings=1
"let g:gruvbox_undercurl=1
"let g:gruvbox_contrast_dark="hard"
"colorscheme gruvbox