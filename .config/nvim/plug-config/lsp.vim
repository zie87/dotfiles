" init completion engine
let g:deoplete#enable_at_startup = 1

""*****************************************************************************
"" LSP CONFIGURATION
""*****************************************************************************

" C++
lua require 'nvim_lsp'.clangd.setup{ init_options = { highlight = { lsRanges = true; } } }
lua require 'nvim_lsp'.cmake.setup{}
" Python
lua require 'nvim_lsp'.pyls.setup{}
" Elixir
lua require 'nvim_lsp'.elixirls.setup{}
" vim 
lua require 'nvim_lsp'.vimls.setup{}



autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc

" lsp bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
