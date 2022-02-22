"" 自动生成gtags
let g:LF_GtagsAutoGenerate = 1
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.vscode', '.idea']
let g:Lf_ShowHidden = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.30
let g:Lf_PopupWidth = 0.50

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}
let g:Lf_NormalMap = {
	\ "Line":   [["<ESC>", ':exec g:Lf_py "lineExplManager.quit()"<CR>']],
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
	\ }


" key binds
nnoremap FF :LeaderfFunction!<cr>
vnoremap FF <c-c>:LeaderfFunction!<cr><ESC>
inoremap FF <c-o>:LeaderfFunction!<cr><ESC>
