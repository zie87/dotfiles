" *****************************************************************************
" INIT PLUGIN SYSTEM
" *****************************************************************************
source $HOME/.config/nvim/general/plugins.vim

" *****************************************************************************
" GENERAL SETTINGS
" *****************************************************************************
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keys.vim

" *****************************************************************************
" PLUGIN SETTINGS
" *****************************************************************************
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/hardtime.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/skim.vim
"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/clang-format.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/ranger.vim
"source $HOME/.config/nvim/plug-config/cmake.vim
"source $HOME/.config/nvim/plug-config/debugger.vim
"source $HOME/.config/nvim/plug-config/snippets.vim
"source $HOME/.config/nvim/plug-config/wiki.vim

source $HOME/.config/nvim/plug-config/whichkey.vim

""*****************************************************************************
"" MISC
""*****************************************************************************

" init colorizer
lua require 'colorizer'.setup()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c

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

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
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
