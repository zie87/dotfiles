" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
Plug 'takac/vim-hardtime'
" rgb-hex colorizer
Plug 'norcalli/nvim-colorizer.lua'
" tmux
Plug 'christoomey/vim-tmux-navigator'

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
Plug 'haorenW1025/completion-nvim'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'vim-scripts/c.vim'
Plug 'rust-lang/rust.vim'
" toggle comments
Plug 'scrooloose/nerdcommenter'
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
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1

let g:list_of_normal_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = []

nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>

""*****************************************************************************
"" MISC
""*****************************************************************************
" init colorizer
set termguicolors
lua require'colorizer'.setup()

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
let g:NERDTreeHighlightCursorline = 1
" open nerdtree if no file or a directory was given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close nerdtree when it is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toogle nerdtree
map <F3> :NERDTreeToggle<CR>

""*****************************************************************************
"" LSP CONFIGURATION
""*****************************************************************************

let g:completion_timer_cycle = 100 "default value is 80
let g:completion_chain_complete_list = {
    \ 'cpp':[ {'complete_items': ['lsp']},
    \         {'complete_items': ['snippet']},
    \         {'mode': '<c-p>'},
    \         {'mode': '<c-n>'}],
    \ 'default':[ {'complete_items': ['lsp']},
    \             {'mode': '<c-p>'},
    \             {'mode': '<c-n>'}], 
    \}

let g:diagnostic_insert_delay = 1

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sumneko_lua.setup{ 
    cmd = { "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", 
            "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" },
    install_dir = "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua",
    is_installed = true,
    on_attach=on_attach_vim}
EOF

" lsp bindings

nnoremap <silent> <Leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>gD    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>h     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>i     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>s     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <Leader>td    <cmd>lua vim.lsp.buf.type_definition()<CR>

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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

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

""*****************************************************************************
"" BINDINGS
""*****************************************************************************


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
