local config = {}

function config.edge()
    vim.cmd([[set background=dark]])
    vim.g.edge_style = "neon"
    vim.g.edge_enable_italic = 1
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_show_eob = 1
    vim.g.edge_better_performance = 1
    vim.g.edge_transparent_background = 1
end

function config.kanagawa()
    require("kanagawa").setup({
        undercurl = true, -- enable undercurls
        commentStyle = "italic",
        functionStyle = "bold,italic",
        keywordStyle = "italic",
        statementStyle = "bold",
        typeStyle = "NONE",
        variablebuiltinStyle = "italic",
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        colors = {},
        overrides = {},
    })
end

function config.catppuccin()
    require("catppuccin").setup({
        transparent_background = true,
        term_colors = true,
        styles = {
            comments = "italic",
            functions = "italic,bold",
            keywords = "italic",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic",
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline",
                },
            },
            lsp_trouble = true,
            lsp_saga = true,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            which_key = true,
            indent_blankline = { enabled = true, colored_indent_levels = false },
            dashboard = true,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            hop = true,
        },
    })
end


function config.defx()
    vim.api.nvim_exec(
        [[
            source ~/.config/nvim/lua/modules/ui/vimrc/defx.vimrc
        ]],
        false)
end

function config.lualine()
    local gps = require("nvim-gps")

    local function gps_content()
        if gps.is_available() then
            return gps.get_location()
        else
            return ""
        end
    end
    local simple_sections = {
        lualine_a = { "mode" },
        lualine_b = { "filetype" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    }
    local aerial = {
        sections = simple_sections,
        filetypes = { "aerial" },
    }
    local dapui_scopes = {
        sections = simple_sections,
        filetypes = { "dapui_scopes" },
    }

    local dapui_breakpoints = {
        sections = simple_sections,
        filetypes = { "dapui_breakpoints" },
    }

    local dapui_stacks = {
        sections = simple_sections,
        filetypes = { "dapui_stacks" },
    }

    local dapui_watches = {
        sections = simple_sections,
        filetypes = { "dapui_watches" },
    }

    local defx_extension = {
        sections = {
            lualine_a = { "filetype" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
        filetypes = { "defx" }
    }

    require("lualine").setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            disabled_filetypes = {},
            component_separators = { left = '│', right = '│'},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                { "branch" },
                { "diff" },
                {
                    "diagnostics",
                    sources = { "coc" },
                    sections = { "error", "warn", "info", "hint" },
                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = "DiagnosticError", -- Changes diagnostics' error color.
                        warn  = "DiagnosticWarn",  -- Changes diagnostics' warn color.
                        info  = "DiagnosticInfo",  -- Changes diagnostics' info color.
                        hint  = "DiagnosticHint",  -- Changes diagnostics' hint color.
                    },
                    symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                    colored = true,           -- Displays diagnostics status in color if set to true.
                    update_in_insert = true, -- Update diagnostics in insert mode.
                    always_visible = false,   -- Show diagnostics even if there are none.
                }
            },
            lualine_c = {
                { gps_content, cond = gps.is_available },
            },
            lualine_x = {},
            lualine_y = {
                {
                    "filename",
                    file_status = true,
                    path = 1,
                    shorting_target = 40,
                    symbols = {
                        modified = '[✓]',      -- Text to show when the file is modified.
                        readonly = '[×]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    }
                },
                { "filetype" },
                { "encoding" },
                {
                    "fileformat",
                    icons_enabled = true,
                    symbols = {
                        unix = "LF",
                        dos = "CRLF",
                        mac = "CR",
                    },
                },
            },
            lualine_z = { "progress", "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {
            "quickfix",
            "nvim-tree",
            "toggleterm",
            "fugitive",
            aerial,
            dapui_scopes,
            dapui_breakpoints,
            dapui_stacks,
            dapui_watches,
            defx_extension
        },
    })
end

function config.nvim_bufferline()
    require("bufferline").setup({
        options = {
            numbers = "buffer_id",
            buffer_close_icon = "",
            close_icon = "",
            modified_icon = "✥",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_buffer_close_icons = true,
            show_buffer_icons = true,
            show_tab_indicators = true,
            diagnostics = "coc",
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                    s = s .. n .. sym
                end
                return s
                end,
            always_show_bufferline = true,
            separator_style = "thin",
            offsets = {
                {
                    filetype = "defx",
                    text = "[Defx] File Explorer",
                    text_align = "left",
                    padding = 1,
                },
            },
        },
    })
end

function config.indent_blankline()
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")
    require("indent_blankline").setup {
        char = "│",
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
        space_char_blankline = " ",
        show_first_indent_level = true,
        filetype_exclude = {
            "startify", "dashboard", "dotooagenda", "log", "fugitive",
            "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
            "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
            "TelescopePrompt", "undotree", "flutterToolsOutline", "defx", "" -- for all buffers without a file type
        },
        buftype_exclude = {"terminal", "nofile"},
        show_trailing_blankline_indent = false,
        context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for", "type", "var",
            "import"
        }
    }
    -- because lazy load indent-blankline so need readd this autocmd
    vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

return config
