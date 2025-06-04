local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- v,i 模式回到 n 模式
    ["i|<C-n>"] = map_cmd("<Esc>"):with_noremap():with_silent(),
    ["v|<C-n>"] = map_cmd("<Esc>"):with_noremap():with_silent(),
    -- 保存
    ["n|<C-s>"] = map_cu("update"):with_noremap():with_silent(),
    ["i|<C-s>"] = map_cmd("<C-o>:update<CR><Esc>"):with_noremap():with_silent(),
    ["v|<C-s>"] = map_cmd("<C-c>:update<CR>gv<Esc>"):with_noremap():with_silent(),
    -- 全选
    ["n|<C-a>"] = map_cmd("ggvG$"):with_noremap():with_silent(),
    ["v|<C-a>"] = map_cmd("<Esc>ggvG$"):with_noremap():with_silent(),
    ["i|<C-a>"] = map_cmd("<Esc>ggvG$"):with_noremap():with_silent(),
    -- 跳行首
    ["n|<M-h>"] = map_cmd("^"):with_noremap():with_silent(),
    ["v|<M-h>"] = map_cmd("^"):with_noremap():with_silent(),
    -- ["i|<M-H>"] = map_cmd("<Esc>^a"):with_noremap():with_silent(),
    -- 跳行尾
    ["n|<M-l>"] = map_cmd("$"):with_noremap():with_silent(),
    ["v|<M-l>"] = map_cmd("$"):with_noremap():with_silent(),
    -- ["i|<M-L>"] = map_cmd("<Esc>$a"):with_noremap():with_silent(),
    -- 跳第一行行首
    ["n|gk"] = map_cmd("gg^"):with_noremap():with_silent(),
    ["v|gk"] = map_cmd("gg^"):with_noremap():with_silent(),
    -- ["i|kk"] = map_cmd("<Esc>gg^a"):with_noremap():with_silent(),
    -- 跳最后一行行尾
    ["n|gj"] = map_cmd("G$"):with_noremap():with_silent(),
    ["v|gj"] = map_cmd("G$"):with_noremap():with_silent(),
    -- ["i|jj"] = map_cmd("<Esc>G$a"):with_noremap():with_silent(),
    -- 向上移动行(块)
    ["n|<M-k>"] = map_cu("m -2"):with_noremap():with_silent(),
    ["i|<M-k>"] = map_cmd("<C-o>:m -2<CR>"):with_noremap():with_silent(),
    ["v|<M-k>"] = map_cmd(":m '<-2<cr>gv=gv"):with_noremap():with_silent(),
    -- 向下移动行(块)
    ["n|<M-j>"] = map_cu("m +1"):with_noremap():with_silent(),
    ["i|<M-j>"] = map_cmd("<C-o>:m +1<CR>"):with_noremap():with_silent(),
    ["v|<M-j>"] = map_cmd(":m '>+1<cr>gv=gv"):with_noremap():with_silent(),

    -- 窗口操作
    ---- 切换窗口
    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap():with_silent(),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap():with_silent(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap():with_silent(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap():with_silent(),
    ---- 窗口宽度调整
    ["n|<A-[>"] = map_cr("vertical resize -5"):with_noremap():with_silent(),
    ["n|<A-]>"] = map_cr("vertical resize +5"):with_noremap():with_silent(),
    ---- 窗口高度调整
    ["n|<A-;>"] = map_cr("resize -2"):with_noremap():with_silent(),
    ["n|<A-'>"] = map_cr("resize +2"):with_noremap():with_silent(),

    -- 编辑模式光标移动
    ---- 跳词移动
    ["i|<C-h>"] = map_cmd("<C-o>b"):with_noremap():with_silent(),
    ["i|<C-l>"] = map_cmd("<C-o>w"):with_noremap():with_silent(),
    ---- 上下移动
    ["i|<C-k>"] = map_cmd("<Up>"):with_noremap():with_silent(),
    ["i|<C-j>"] = map_cmd("<Down>"):with_noremap():with_silent(),
    ---- 左右移动
    ["i|<M-h>"] = map_cmd("<Left>"):with_noremap():with_silent(),
    ["i|<M-l>"] = map_cmd("<Right>"):with_noremap():with_silent(),

    -- 视图模式操作
    ---- 缩进
    ["v|>"] = map_cmd(">gv"):with_noremap():with_silent(),
    ["v|<"] = map_cmd("<gv"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(def_map)
