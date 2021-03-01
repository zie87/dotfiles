
" banners a created with https://manytools.org/hacker-tools/ascii-banner/
let g:startify_ascii_doom = [
            \ " .S_sSSs      sSSs    sSSs_sSSs     .S    S.    .S   .S_SsS_S. ",  
            \ ".SS~YS%%b    d%%SP   d%%SP~YS%%b   .SS    SS.  .SS  .SS~S*S~SS.",  
            \ "S%S   `S%b  d%S'    d%S'     `S%b  S%S    S%S  S%S  S%S `Y' S%S",  
            \ "S%S    S%S  S%S     S%S       S%S  S%S    S%S  S%S  S%S     S%S",  
            \ "S%S    S&S  S&S     S&S       S&S  S&S    S%S  S&S  S%S     S%S",  
            \ "S&S    S&S  S&S_Ss  S&S       S&S  S&S    S&S  S&S  S&S     S&S",  
            \ "S&S    S&S  S&S~SP  S&S       S&S  S&S    S&S  S&S  S&S     S&S",  
            \ "S&S    S&S  S&S     S&S       S&S  S&S    S&S  S&S  S&S     S&S",  
            \ "S*S    S*S  S*b     S*b       d*S  S*b    S*S  S*S  S*S     S*S",  
            \ "S*S    S*S  S*S.    S*S.     .S*S  S*S.   S*S  S*S  S*S     S*S",  
            \ "S*S    S*S   SSSbs   SSSbs_sdSSS    SSSbs_S*S  S*S  S*S     S*S",  
            \ "S*S    SSS    YSSP    YSSP~YSSY      YSSP~SSS  S*S  SSS     S*S",  
            \ "SP                                             SP           SP ",  
            \ "Y                                              Y            Y  ",  
            \ ]

let g:startify_ascii_money = [
            \ "  __    __                     __     __  __                ",
            \ " |  \  |  \                   |  \   |  \|  \               ",
            \ " | $$\ | $$  ______    ______ | $$   | $$ \$$ ______ ____   ",
            \ " | $$$\| $$ /      \  /      \| $$   | $$|  \|      \    \  ",
            \ " | $$$$\ $$|  $$$$$$\|  $$$$$$\\$$\ /  $$| $$| $$$$$$\$$$$\ ",
            \ " | $$\$$ $$| $$    $$| $$  | $$ \$$\  $$ | $$| $$ | $$ | $$ ",
            \ " | $$ \$$$$| $$$$$$$$| $$__/ $$  \$$ $$  | $$| $$ | $$ | $$ ",
            \ " | $$  \$$$ \$$     \ \$$    $$   \$$$   | $$| $$ | $$ | $$ ",
            \ "  \$$   \$$  \$$$$$$$  \$$$$$$     \$     \$$ \$$  \$$  \$$ ",
            \ ]


let g:startify_ascii_bloody = [
            \ "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ", 
            \ "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ", 
            \ " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ", 
            \ " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ", 
            \ " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ", 
            \ " ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ", 
            \ " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ", 
            \ "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ", 
            \ "          ░    ░  ░    ░ ░        ░   ░         ░    ", 
            \ ]


let g:startify_ascii_corps = [
            \ " ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ", 
            \ " ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ", 
            \ " ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ", 
            \ " ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ", 
            \ " ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ", 
            \ " ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ", 
            \ " ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ", 
            \ "  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ", 
            \ ]                                        


let g:startify_custom_header = g:startify_ascii_corps
let g:startify_session_dir = '~/.config/nvim/session'

" detect current dir based on cvs system
let g:startify_change_to_vcs_root = 1
" Automatically Update Sessions
let g:startify_session_persistence = 1

let g:startify_lists = [
        \ { 'type': 'files',     'header':                ['   Files']            },
        \ { 'type': 'dir',       'header':                ['   Current Dir '. getcwd()] },
        \ { 'type': 'sessions',  'header':                ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header':                ['   Bookmarks']      },
        \ { 'type': 'commands',  'header':                ['   Commands']       },
        \ ]
  "     \ { 'type': function('s:gitModified'),  'header': ['   Git modified']},
  "     \ { 'type': function('s:gitUntracked'), 'header': ['   Git untracked']},

let g:startify_bookmarks = [
            \ { 'z': '~/.zshrc' },
            \ { 'a': '~/.config/awesome/rc.lua' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'k': '~/.config/kitty/kitty.conf'},
            \ { 'r': '~/.config/ranger/rc.conf'},
            \ ]
