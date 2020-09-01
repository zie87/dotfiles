
" Register the description dictionary for the prefix first
let g:which_key_map =  {}
call which_key#register('-', "g:which_key_map")
" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '-'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '-'<CR>

set timeoutlen=500

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function


" Single mappings
"let g:which_key_map['/'] = [ ':Commentary'                , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                  , 'commands' ]
let g:which_key_map[','] = [ 'Startify'                   , 'start screen' ]
let g:which_key_map['e'] = [ ':NERDTreeToggle'            , 'explorer' ]
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['C'] = 'toogle formatting'
"let g:which_key_map['S'] = [ ':SSave'                     , 'save session' ]
"let g:which_key_map['H'] = [ ':HardTimeToggle'            , 'toggle HardTime' ]


"  ----------------------------------------------------------------------------
"  LSP CONFIGURATION
"  ----------------------------------------------------------------------------
"

nnoremap <silent> <leader>ld    <cmd> lua vim.lsp.buf.definition()<CR> 
nnoremap <silent> <leader>lD    <cmd> lua vim.lsp.buf.declaration()<CR> 
nnoremap <silent> <leader>lh    <cmd> lua vim.lsp.buf.hover()<CR> 
nnoremap <silent> <leader>li    <cmd> lua vim.lsp.buf.implementation()<CR> 
nnoremap <silent> <leader>lR    <cmd> lua vim.lsp.buf.rename()<CR> 
nnoremap <silent> <leader>lr    <cmd> lua vim.lsp.buf.references()<CR> 
nnoremap <silent> <leader>lt    <cmd> lua vim.lsp.buf.type_definitions()<CR> 
nnoremap <silent> <leader>lU    <cmd> lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
nnoremap <silent> <leader>l.    :ClangdSwitchSourceHeader<CR>

let g:which_key_map['l'] = {
      \ 'name' : '+lsp'           ,
      \ 'd' : 'definition'        ,
      \ 'D' : 'declaration'       ,
      \ 'h' : 'hover'             ,
      \ 'i' : 'implementation'    ,
      \ 'R' : 'rename'            ,
      \ 'r' : 'references'        ,
      \ 't' : 'type definition'   ,
      \ '.' : 'switch header'     ,
      \ 'U' : 'reload'            ,
      \ }

"let g:which_key_map['l'] = {
"      \ 'name' : '+lsp' ,
"      \ '.' : [':CocConfig'                          , 'config'],
"      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
"      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
"      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
"      \ 'b' : [':CocNext'                            , 'next action'],
"      \ 'B' : [':CocPrev'                            , 'prev action'],
"      \ 'c' : [':CocList commands'                   , 'commands'],
"      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
"      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
"      \ 'e' : [':CocList extensions'                 , 'extensions'],
"      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
"      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
"      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
"      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
"      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
"      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
"      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
"      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
"      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
"      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
"      \ 'O' : [':CocList outline'                    , 'outline'],
"      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
"      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
"      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
"      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
"      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
"      \ 's' : [':CocList -I symbols'                 , 'references'],
"      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
"      \ 'u' : [':CocListResume'                      , 'resume list'],
"      \ 'U' : [':CocUpdate'                          , 'update CoC'],
"      \ 'v' : [':Vista!!'                            , 'tag viewer'],
"      \ 'z' : [':CocDisable'                         , 'disable CoC'],
"      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
"      \ }


"  ----------------------------------------------------------------------------
"  SEARCH CONFIGURATION
"  ----------------------------------------------------------------------------
let g:which_key_map['s'] = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':SK'           , 'skim'],
      \ }

"  ----------------------------------------------------------------------------
"  BUFFER CONFIGURATION (needs vim-bufkil)
"  ----------------------------------------------------------------------------
let g:which_key_map['b'] = {
      \ 'name' : '+buffer' ,
      \ 'u' : ['BUN'       , 'unload-buffer']   ,
      \ 'd' : ['BD'        , 'delete-buffer']   ,
      \ 'w' : ['BW'        , 'wipeout-buffer']  ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['BF'        , 'next-buffer']     ,
      \ 'p' : ['BB'        , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'skim-buffer']     ,
      \ }

"  ----------------------------------------------------------------------------
"  WINDOW CONFIGURATION
"  ----------------------------------------------------------------------------
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'skim-window']           ,
      \ }
