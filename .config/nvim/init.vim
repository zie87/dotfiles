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
call plug#end()

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keys.vim

source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/hardtime.vim

""*****************************************************************************
"" MISC
""*****************************************************************************

" init colorizer
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

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
 no one is really happy until you have this shortcuts
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
