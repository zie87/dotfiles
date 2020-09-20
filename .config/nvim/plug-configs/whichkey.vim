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
let g:which_key_map['/'] = [ ':Commentary'                , 'comment toogle' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'open init' ]
let g:which_key_map[';'] = [ ':Commands'                  , 'command list' ]
let g:which_key_map[','] = [ 'Startify'                   , 'start screen' ]
let g:which_key_map['e'] = [ ':NERDTreeToggle'            , 'explorer' ]
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['C'] = [ ':ClangFormatAutoToggle'     , 'toggle clang-format' ]
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
      \ '?' : ['Buffers'   , 'buffer-list']     ,
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
      \ '?' : ['Windows'    , 'window-list']           ,
      \ }

"  ----------------------------------------------------------------------------
"  SEARCH OPTIONS
"  ----------------------------------------------------------------------------
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':AsyncTaskFzf' , 'async tasks'],
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
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

"  ----------------------------------------------------------------------------
"  FLOATERM CONFIGURATION
"  ----------------------------------------------------------------------------
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --position=bottom --height=6'      , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'h' : [':FloatermNew htop'                              , 'htop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

"  ----------------------------------------------------------------------------
"  LSP CONFIGURATION
"  ----------------------------------------------------------------------------
let g:which_key_map['l'] = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocCommand clangd.switchSourceHeader'  , 'switch header'],
      \ ';' : ['<Plug>(coc-refactor)'                   , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'                 , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'        , 'selected action'],
      \ 'b' : [':CocNext'                               , 'next action'],
      \ 'B' : [':CocPrev'                               , 'prev action'],
      \ 'c' : [':CocList commands'                      , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'                 , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'                , 'declaration'],
      \ 'e' : [':CocList extensions'                    , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'            , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                     , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'                 , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'             , 'implementation'],
      \ 'I' : [':CocList diagnostics'                   , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'                 , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'            , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'            , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'      , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                   , 'open link'],
      \ 'O' : [':CocList outline'                       , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'            , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'      , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'                , 'quickfix'],
      \ 'R' : ['<Plug>(coc-rename)'                     , 'rename'],
      \ 'r' : ['<Plug>(coc-references)'                 , 'references'],
      \ 's' : [':CocList -I symbols'                    , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'            , 'type definition'],
      \ 'u' : [':CocListResume'                         , 'resume list'],
      \ 'U' : [':CocUpdate'                             , 'update CoC'],
      \ 'v' : [':Vista!!'                               , 'tag viewer'],
      \ 'z' : [':CocDisable'                            , 'disable CoC'],
      \ 'Z' : [':CocEnable'                             , 'enable CoC'],
      \ }

"  ----------------------------------------------------------------------------
"  DEBUGGER CONFIGURATION
"  ----------------------------------------------------------------------------
let g:which_key_map['d'] = {
      \ 'name' : '+debugger',
      \ 'd' : 'launch'      ,
      \ 'e' : 'eval'        ,
      \ 'x' : 'reset'       ,
      \ 'o' : 'show output' ,
      \ 'w' : 'watch'       ,
      \ }
"  ----------------------------------------------------------------------------
