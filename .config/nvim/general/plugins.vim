" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " start screen
    Plug 'mhinz/vim-startify'
    " key mapping
    Plug 'liuchengxu/vim-which-key'
    " buffer handling
    Plug 'qpkorr/vim-bufkill'
    " ranger
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
    " nerdtree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'unkiwii/vim-nerdtree-sync'
    Plug 'ryanoasis/vim-devicons'
    " floaterm
    Plug 'voldikss/vim-floaterm'
    " async
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/asyncrun.vim'
    " themes
    Plug 'crusoexia/vim-monokai'
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'romgrk/doom-one.vim'
    Plug 'jacoborus/tender.vim'
    " statusline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " comments
    Plug 'tpope/vim-commentary'
    " vcs
    Plug 'mhinz/vim-signify'
    " language support
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    " debugger
    Plug 'puremourning/vimspector'
    " scratchpad
    Plug 'metakirby5/codi.vim'
    " clang-format
    Plug 'rhysd/vim-clang-format'
    " lua-formatter
    Plug 'andrejlevkovitch/vim-lua-format'
call plug#end()
