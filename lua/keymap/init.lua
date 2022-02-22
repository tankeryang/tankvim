local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

local plug_map = {
    -- Bufferline
    ["n|<leader>p"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|<leader>+"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<leader>-"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    -- ["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
    -- ["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
    -- ["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
    -- ["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
    ["n|<leader>1"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
    ["n|<leader>2"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
    ["n|<leader>3"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
    ["n|<leader>4"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
    ["n|<leader>5"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
    ["n|<leader>6"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
    ["n|<leader>7"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
    ["n|<leader>8"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
    ["n|<leader>9"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    ["n|<leader>q"] = map_cu("bp<CR>:bd #"):with_noremap():with_silent(),
    -- Hop
    ["n|<leader>w"] = map_cu("HopWord"):with_noremap(),
    ["n|<leader>j"] = map_cu("HopLine"):with_noremap(),
    ["n|<leader>k"] = map_cu("HopLine"):with_noremap(),
    ["n|<leader>s"] = map_cu("HopChar1"):with_noremap(),
    ["n|<leader>ss"] = map_cu("HopChar2"):with_noremap(),
    -- Plugin MarkdownPreview
    ["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
