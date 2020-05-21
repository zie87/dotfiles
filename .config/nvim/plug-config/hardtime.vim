""*****************************************************************************
"" HARD MODE
""*****************************************************************************
let g:hardtime_default_on = 0
let g:hardtime_showmsg = 1

let g:list_of_normal_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = []
let g:list_of_disabled_keys = []

nnoremap <leader>h <Esc>:call HardTimeToggle()<CR>


