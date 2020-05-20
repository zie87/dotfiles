" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
Plug 'takac/vim-hardtime'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" source code management
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'paul-nechifor/vim-svn-blame'

" language and completion settings
Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/c.vim'
" toggle comments
Plug 'scrooloose/nerdcommenter'
" cmake support
Plug 'ilyachur/cmake4vim'
" markdown support
Plug 'plasticboy/vim-markdown'

" scheme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
" Initialize plugin system
call plug#end()

""*****************************************************************************
"" HARD MODE
""*****************************************************************************
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1

let g:list_of_normal_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = []

nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>

""*****************************************************************************
"" MISC
""*****************************************************************************

" init completion engine
let g:deoplete#enable_at_startup = 1
" init git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500
" status line configuration
let g:airline_powerline_fonts = 1

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

""*****************************************************************************
"" NERDTREE CONFIGURATION
""*****************************************************************************
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
" toogle nerdtree
nnoremap <silent> <F3> :NERDTreeToggle<CR>

""*****************************************************************************
"" LSP CONFIGURATION
""*****************************************************************************
lua require 'nvim_lsp'.clangd.setup{ init_options = { highlight = { lsRanges = true; } } }
autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

" lsp bindings
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
set number relativenumber
set cursorline
set laststatus=2
set colorcolumn=80
" copy/paste/cut
set clipboard=unnamed,unnamedplus
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
"colorscheme gruvbox
"colorscheme base16-tomorrow-night
set background=dark termguicolors

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
" clean search highlight
nnoremap <silent> <leader><space> :noh<cr>
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
