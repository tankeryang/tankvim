local config = {}

local dap_dir = vim.fn.stdpath("data") .. "/dapinstall/"
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.nvim_treesitter()
    require("nvim-treesitter.configs").setup {
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "maintained",
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        -- ignore_install = { "javascript" },
        highlight = {
            -- `false` will disable the whole extension
            enable = true,
            -- list of language that will be disabled
            -- disable = { "c", "rust" },
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
            }
        },
        indent = {
            enable = true
        },
        matchup = {
            enable = true
        }
    }
end

function config.vista()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/editor/vimrc/vista.vimrc
        ]],
        false)
end

function config.nvim_gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " ", -- Methods (functions inside class-like objects)
        },
        languages = {
            -- You can disable any language individually here
            ["c"] = true,
            ["cpp"] = true,
            ["go"] = true,
            ["java"] = true,
            ["javascript"] = true,
            ["lua"] = true,
            ["python"] = true,
            ["rust"] = true,
        },
        separator = " > ",
    })
end

function config.gitsigns()
    require("gitsigns").setup({
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = "│",
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn",
            },
            change = {
                hl = "GitSignsChange",
                text = "│",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = "_",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = "‾",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        signcolumn = true,
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol',
            delay = 1000,
            ignore_whitespace = false
        },
        current_line_blame_formatter = '    <author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        yadm = {
            enable = false
        },
        on_attach = function(bufnr)
            local function map(mode, lhs, rhs, opts)
                opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
            end

            -- Navigation
            map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
            map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

            -- Actions
            map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
            map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
            map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
            map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
            map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
            map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
            map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
            map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
            map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
            map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
            map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
            map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
            map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

            -- Text object
            map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    })
end

function config.vim_cursorwod()
    vim.api.nvim_command("augroup user_plugin_cursorword")
    vim.api.nvim_command("autocmd!")
    vim.api.nvim_command(
        "autocmd FileType NvimTree,lspsagafinder,dashboard, defxlet b:cursorword = 0")
    vim.api.nvim_command(
        "autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
    vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
    vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
    vim.api.nvim_command("augroup END")
end

function config.autotag()
    require("nvim-ts-autotag").setup({
        filetypes = {
            "html", "xml", "javascript", "typescriptreact", "javascriptreact",
            "vue"
        }
    })
end

function config.matchup()
    vim.cmd [[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
end

return config
