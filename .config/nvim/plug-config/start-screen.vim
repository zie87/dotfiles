let g:startify_ascii = [
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

let g:startify_custom_header = map(g:startify_ascii, '"     ".v:val')


