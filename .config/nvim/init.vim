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
"source $HOME/.config/nvim/plug-config/nerdtree.vim
"source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/hardtime.vim
source $HOME/.config/nvim/plug-config/airline.vim
"source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/skim.vim


""*****************************************************************************
"" MISC
""*****************************************************************************

" init colorizer
lua require'colorizer'.setup()

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
