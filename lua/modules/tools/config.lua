local config = {}

function config.leaderf()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/tools/vimrc/leaderf.vimrc
        ]],
        false)
end

function far()
    vim.g["far#enable_undo"] = 1
    vim.g["far#source"] = 'ag'
end

function config.vim_terminal_help()
    vim.g.terminal_height = 24
    vim.g.terminal_list = 2048
end

function config.toggleterm()
    require("toggleterm").setup({
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.40
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
    })
    function _G.set_terminal_keymaps()
      local opts = {noremap = true}
      -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'wq', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
end

function config.filetype()
    -- In init.lua or filetype.nvim's config file
    require("filetype").setup({
        overrides = {
            shebang = {
                -- Set the filetype of files with a dash shebang to sh
                dash = "sh",
            },
        },
    })
end

function config.wilder()
	vim.cmd([[
        call wilder#setup({'modes': [':', '/', '?']})
        call wilder#set_option('use_python_remote_plugin', 0)
        call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])
        call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
    ]])
end

return config
