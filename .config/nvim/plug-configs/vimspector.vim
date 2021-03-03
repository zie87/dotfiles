let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir=expand('$HOME/.config/nvim/vimspector-config')

nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval 
nmap <leader>dw :VimspectorWatch 
nmap <leader>do :VimspectorShowOutput 

" autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>

