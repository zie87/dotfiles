" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" helps to learn do it right
Plug 'takac/vim-hardtime'
" Start Screen
Plug 'mhinz/vim-startify'
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

source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/lsp.vim



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

" markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" spell checks
set spell spelllang=en_us
set spellcapcheck=""

" general configuration
set number relativenumber
set cursorline
set laststatus=2
set colorcolumn=80

" Required to keep multiple buffers open multiple buffers
set hidden

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
