call plug#begin(stdpath('data') . '/plugged')
" helps to learn do it right
Plug 'takac/vim-hardtime'
" Start Screen
Plug 'mhinz/vim-startify'
" rgb-hex colorizer
Plug 'norcalli/nvim-colorizer.lua'
" tmux
Plug 'christoomey/vim-tmux-navigator'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" source code management
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'paul-nechifor/vim-svn-blame'

" skim
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'zie87/skim.vim'
Plug 'airblade/vim-rooter'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'rust-lang/rust.vim'
" toggle comments
Plug 'scrooloose/nerdcommenter'
" markdown support
Plug 'plasticboy/vim-markdown'
" scheme
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
call plug#end()
