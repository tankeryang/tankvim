" defx.vim
map <F2> :Defx usearch=`expand('%:p')` -toggle <CR>
" 自动开启
func! ArgFunc() abort
    let s:arg = argv(0)
    if isdirectory(s:arg)
        return s:arg
    else
        return fnamemodify(s:arg, ':h')
    endif
endfunc
autocmd VimEnter * Defx `ArgFunc()` -no-focus -search=`expand('%:p')`
" 单窗口自动退出
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:defx') |
\ quit | endif
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/


" defx树的格式
call defx#custom#option('_', {
      \ 'columns': 'git:indent:icon:icons:filename:size',
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'resume': 1,
      \ })
call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })


" cd 目录
function! MyCD(context) abort
    if isdirectory(get(a:context.targets, 0))
        execute 'cd' . get(a:context.targets, 0)
    else
        execute 'cd' . fnamemodify(defx#get_candidate().action__path, ':h')
    endif
endfunction


" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  " 复制
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  " 粘贴
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  " 删除
  nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
  " 选中文件(夹)
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  " 彻底删除
  nnoremap <silent><buffer><expr> D defx#do_action('remove')
  " 进入目录(没用)
  nnoremap <silent><buffer><expr> cd defx#do_action('call', 'MyCD')
  " 展开目录
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  " 展开所有目录
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  " 显示隐藏文件
  nnoremap <silent><buffer><expr> I defx#do_action('toggle_ignored_files')
  " 新建文件夹
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  " 新建文件
  nnoremap <silent><buffer><expr> N defx#do_action('new_multiple_files')
  " 重命名
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  " 刷新
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  " 上级目录
  nnoremap <silent><buffer><expr> .. defx#do_action('cd', ['..'])
  " 往右扩5格
  nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth + 5)
  " 往左缩5格
  nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth - 5)
endfunction


" defx.git
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✓',
  \ 'Untracked' : '*',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment


" defx.icons
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_link_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
