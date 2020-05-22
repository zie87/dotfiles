" we need to build with make for absolute paths so we should speed it up
let g:cmake_native_build_options = ["-j $(nproc)"]
" cmake can generate the compile comands symlink for lsp
let g:cmake_link_compile_commands = 1
