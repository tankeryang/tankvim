function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
vmap <c-j> <Plug>(coc-snippets-select)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-sh',
    \ 'coc-python',
    \ 'coc-lua',
    \ 'coc-go',
    \ 'coc-json',
    \ 'coc-yaml']
