call plug#begin(stdpath('data') . '/plugged')
" Start Screen
Plug 'mhinz/vim-startify'
" rgb-hex colorizer
Plug 'norcalli/nvim-colorizer.lua'
" tmux
Plug 'christoomey/vim-tmux-navigator'
" optimize buffer handling
Plug 'qpkorr/vim-bufkill'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" See what keys do like in emacs
Plug 'liuchengxu/vim-which-key'
" source code management
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'paul-nechifor/vim-svn-blame'
" skim
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'zie87/skim.vim'
Plug 'airblade/vim-rooter'
" comments
Plug 'tpope/vim-commentary'
" A bunch of useful language related snippets (ultisnips is the engine).
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'ryanoasis/vim-devicons'
" ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
" languages & lsp
Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'
" rust
Plug 'rust-lang/rust.vim'
" scheme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
call plug#end()
