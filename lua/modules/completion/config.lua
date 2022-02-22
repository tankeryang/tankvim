local config = {}

function config.coc()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/completion/vimrc/coc.vimrc
        ]],
        false)
end

return config
