call plug#begin(stdpath('data') . '/plugged')
" helps to learn do it right
Plug 'takac/vim-hardtime'
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
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" debugger
"Plug 'puremourning/vimspector'
" c/c++
Plug 'cdelledonne/vim-cmake'
" rust
Plug 'rust-lang/rust.vim'
" scheme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
call plug#end()
