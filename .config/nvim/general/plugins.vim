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
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" source code management
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'paul-nechifor/vim-svn-blame'

" neovim-lsp
"Plug 'neovim/nvim-lsp'
"Plug 'haorenW1025/completion-nvim'
"Plug 'haorenW1025/diagnostic-nvim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'vim-scripts/c.vim'
Plug 'rust-lang/rust.vim'
" toggle comments
Plug 'scrooloose/nerdcommenter'
" markdown support
Plug 'plasticboy/vim-markdown'
" scheme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
call plug#end()
