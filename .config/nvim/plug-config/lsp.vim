""*****************************************************************************
"" LSP CONFIGURATION
""*****************************************************************************

let g:completion_timer_cycle = 100 "default value is 80
let g:completion_chain_complete_list = {
    \ 'cpp':[ {'complete_items': ['lsp']},
    \         {'complete_items': ['snippet']},
    \         {'mode': '<c-p>'},
    \         {'mode': '<c-n>'}],
    \ 'default':[ {'complete_items': ['lsp']},
    \             {'mode': '<c-p>'},
    \             {'mode': '<c-n>'}], 
    \}

let g:diagnostic_insert_delay = 1

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

lua << EOF
local on_attach_vim = function()
  require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
require'nvim_lsp'.rust_analyzer.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sumneko_lua.setup{ 
    cmd = { "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", 
            "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" },
    install_dir = "/home/zie/.cache/nvim/nvim_lsp/sumneko_lua",
    is_installed = true,
    on_attach=on_attach_vim}
EOF

" lsp bindings

nnoremap <silent> <Leader>gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>gD    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>h     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>i     <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>s     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <Leader>td    <cmd>lua vim.lsp.buf.type_definition()<CR>


