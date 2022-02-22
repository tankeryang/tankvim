local editor = {}
local conf = require("modules.editor.config")

-- 高亮(nvim-treesitter 相关)
-- https://github.com/nvim-treesitter/nvim-treesitter
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = false,
    run = ":TSUpdate",
    -- event = "BufRead",
    config = conf.nvim_treesitter,
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
    opt = true,
    after = "nvim-treesitter"
}
editor["romgrk/nvim-treesitter-context"] = {
    opt = true,
    after = "nvim-treesitter"
}
editor["p00f/nvim-ts-rainbow"] = {
    opt = true,
    after = "nvim-treesitter",
    event = "BufRead"
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
    opt = true,
    after = "nvim-treesitter"
}

-- 侧边函数导航
-- https://github.com/liuchengxu/vista.vim
editor["liuchengxu/vista.vim"] = {
    opt = false,
    config = conf.vista
}

-- 快速跳转
-- https://github.com/phaazon/hop.nvim
editor["phaazon/hop.nvim"] = {
    opt = true,
    branch = "v1",
    cmd = {
        "HopLine", "HopLineStart", "HopWord", "HopPattern", "HopChar1",
        "HopChar2"
    },
    config = function()
        require("hop").setup {keys = "etovxqpdygfblzhckisuran"}
    end
}

-- 代码块/括号头尾跳转
-- https://github.com/andymass/vim-matchup
editor["andymass/vim-matchup"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.matchup
}

-- 导航段落所在位置状态栏
-- https://github.com/SmiteshP/nvim-gps
editor["SmiteshP/nvim-gps"] = {
    opt = false,
    after = "nvim-treesitter",
    config = conf.nvim_gps,
}

-- Git
-- https://github.com/tpope/vim-fugitive
editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
editor["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = { "BufRead", "BufNewFile" },
    config = conf.gitsigns,
    requires = { "nvim-lua/plenary.nvim", opt = true },
}

-- 符号对齐
-- https://github.com/junegunn/vim-easy-align
editor["junegunn/vim-easy-align"] = {opt = true, cmd = "EasyAlign"}

-- 单词下划线标识
-- https://github.com/itchyny/vim-cursorword
editor["itchyny/vim-cursorword"] = {
    opt = true,
    event = {"BufReadPre", "BufNewFile"},
    config = conf.vim_cursorwod
}

-- 注释插件
-- https://github.com/terrortylor/nvim-comment
editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = function()
        require("nvim_comment").setup({
            hook = function()
                require("ts_context_commentstring.internal").update_commentstring()
            end
        })
    end
}

-- 括号自动匹配补全
-- https://github.com/jiangmiao/auto-pairs
editor["jiangmiao/auto-pairs"] = {
    opt = true,
    event = { "BufRead" }
}

-- 自动补全html括号
-- https://github.com/windwp/nvim-ts-autotag
editor["windwp/nvim-ts-autotag"] = {
    opt = true,
    ft = {"html", "xml"},
    config = conf.autotag
}

-- 搜索时高亮, 搜完后取消高亮
-- https://github.com/romainl/vim-cool
editor["romainl/vim-cool"] = {
    opt = true,
    event = {"CursorMoved", "InsertEnter"}
}

return editor

