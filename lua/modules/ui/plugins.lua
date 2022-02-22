local ui = {}
local conf = require("modules.ui.config")

-- 主题相关
-- https://github.com/kyazdani42/nvim-web-devicons
ui["kyazdani42/nvim-web-devicons"] = { opt = false }
-- https://github.com/sainnhe/edge
ui["sainnhe/edge"] = { opt = false, config = conf.edge }
-- https://github.com/rebelot/kanagawa.nvim
ui["rebelot/kanagawa.nvim"] = { opt = false, config = conf.kanagawa }
-- https://github.com/catppuccin/nvim
ui["catppuccin/nvim"] = {
    opt = false,
    as = "catppuccin",
    config = conf.catppuccin,
}

-- 底部状态栏
-- https://github.com/nvim-lualine/lualine.nvim
ui["hoob3rt/lualine.nvim"] = {
    opt = false,
    after = "lualine-lsp-progress",
    config = conf.lualine,
}
ui["arkav/lualine-lsp-progress"] = { opt = false, after = "nvim-gps" }

-- 标签栏
-- https://github.com/akinsho/bufferline.nvim
ui["akinsho/nvim-bufferline.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_bufferline,
}

-- 文件目录
-- https://github.com/Shougo/defx.nvim
ui["Shougo/defx.nvim"] = {
    opt = false,
    run = ":UpdateRemotePlugins",
    requires = {"kristijanhusak/defx-git", "kristijanhusak/defx-icons"},
    config = conf.defx
}

-- 缩进美化
-- https://github.com/lukas-reineke/indent-blankline.nvim
ui["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufRead",
    config = conf.indent_blankline,
}

return ui
