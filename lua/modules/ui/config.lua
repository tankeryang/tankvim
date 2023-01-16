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
        commentStyle = { italic = true },
        functionStyle = { bold = true, italic = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,
        terminalColors = true,
        colors = {},
        overrides = {},
        theme = "default"
    })
end

function config.catppuccin()
    local function get_modified_palette()
		-- We need to explicitly declare our new color.
		-- (Because colors haven't been set yet when we pass them to the setup function.)

		local cp = require("catppuccin.palettes").get_palette() -- Get the palette.
		cp.none = "NONE" -- Special setting for complete transparent fg/bg.

		if vim.g.catppuccin_flavour == "mocha" then -- We only modify the "mocha" palette.
			cp.rosewater = "#F5E0DC"
			cp.flamingo = "#F2CDCD"
			cp.mauve = "#DDB6F2"
			cp.pink = "#F5C2E7"
			cp.red = "#F28FAD"
			cp.maroon = "#E8A2AF"
			cp.peach = "#F8BD96"
			cp.yellow = "#FAE3B0"
			cp.green = "#ABE9B3"
			cp.blue = "#96CDFB"
			cp.sky = "#89DCEB"
			cp.teal = "#B5E8E0"
			cp.lavender = "#C9CBFF"

			cp.text = "#D9E0EE"
			cp.subtext1 = "#BAC2DE"
			cp.subtext0 = "#A6ADC8"
			cp.overlay2 = "#C3BAC6"
			cp.overlay1 = "#988BA2"
			cp.overlay0 = "#6E6C7E"
			cp.surface2 = "#6E6C7E"
			cp.surface1 = "#575268"
			cp.surface0 = "#302D41"

			cp.base = "#1E1E2E"
			cp.mantle = "#1A1826"
			cp.crust = "#161320"
		end

		return cp
	end

    local function set_auto_compile(enable_compile)
		-- Setting auto-compile for catppuccin.
		if enable_compile then
			vim.api.nvim_create_augroup("_catppuccin", { clear = true })

			vim.api.nvim_create_autocmd("User", {
				group = "_catppuccin",
				pattern = "PackerCompileDone",
				callback = function()
					require("catppuccin").compile()
					vim.defer_fn(function()
						vim.cmd([[colorscheme catppuccin]])
					end, 0)
				end,
			})
		end
	end

    vim.g.catppuccin_flavour = "mocha" -- Set flavour here
	local cp = get_modified_palette()

	local enable_compile = true -- Set to false if you would like to disable catppuccin cache. (Not recommended)
	set_auto_compile(enable_compile)

    require("catppuccin").setup({
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        transparent_background = false,
        term_colors = true,
        compile = {
			enabled = enable_compile,
			path = vim.fn.stdpath("cache") .. "/catppuccin",
		},
        styles = {
            comments = { "italic" },
            functions = { "italic", "bold" },
            keywords = { "italic" },
            operators = { "bold" },
			conditionals = { "bold" },
			loops = { "bold" },
			booleans = { "bold", "italic" },
			numbers = {},
			types = {},
            strings = {},
            variables = {},
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
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
        color_overrides = {
			mocha = {
				rosewater = "#F5E0DC",
				flamingo = "#F2CDCD",
				mauve = "#DDB6F2",
				pink = "#F5C2E7",
				red = "#F28FAD",
				maroon = "#E8A2AF",
				peach = "#F8BD96",
				yellow = "#FAE3B0",
				green = "#ABE9B3",
				blue = "#96CDFB",
				sky = "#89DCEB",
				teal = "#B5E8E0",
				lavender = "#C9CBFF",

				text = "#D9E0EE",
				subtext1 = "#BAC2DE",
				subtext0 = "#A6ADC8",
				overlay2 = "#C3BAC6",
				overlay1 = "#988BA2",
				overlay0 = "#6E6C7E",
				surface2 = "#6E6C7E",
				surface1 = "#575268",
				surface0 = "#302D41",

				base = "#1E1E2E",
				mantle = "#1A1826",
				crust = "#161320",
			},
		},
        highlight_overrides = {
			mocha = {
				-- For base configs.
				CursorLineNr = { fg = cp.green },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For Ts-Rainbow
				rainbowcol1 = { bg = cp.none },
				rainbowcol2 = { bg = cp.none },
				rainbowcol3 = { bg = cp.none },
				rainbowcol4 = { bg = cp.none },
				rainbowcol5 = { bg = cp.none },
				rainbowcol6 = { bg = cp.none },
				rainbowcol7 = { bg = cp.none },

				-- For treesitter.
				TSField = { fg = cp.rosewater },
				TSProperty = { fg = cp.yellow },

				TSInclude = { fg = cp.teal },
				TSOperator = { fg = cp.sky },
				TSKeywordOperator = { fg = cp.sky },
				TSPunctSpecial = { fg = cp.maroon },

				-- TSFloat = { fg = cp.peach },
				-- TSNumber = { fg = cp.peach },
				-- TSBoolean = { fg = cp.peach },

				TSConstructor = { fg = cp.lavender },
				-- TSConstant = { fg = cp.peach },
				-- TSConditional = { fg = cp.mauve },
				-- TSRepeat = { fg = cp.mauve },
				TSException = { fg = cp.peach },

				TSConstBuiltin = { fg = cp.lavender },
				-- TSFuncBuiltin = { fg = cp.peach, style = { "italic" } },
				-- TSTypeBuiltin = { fg = cp.yellow, style = { "italic" } },
				TSVariableBuiltin = { fg = cp.red, style = { "italic" } },

				-- TSFunction = { fg = cp.blue },
				TSFuncMacro = { fg = cp.red, style = {} },
				TSParameter = { fg = cp.rosewater },
				TSKeywordFunction = { fg = cp.maroon },
				TSKeyword = { fg = cp.red },
				TSKeywordReturn = { fg = cp.pink, style = {} },

				-- TSNote = { fg = cp.base, bg = cp.blue },
				-- TSWarning = { fg = cp.base, bg = cp.yellow },
				-- TSDanger = { fg = cp.base, bg = cp.red },
				-- TSConstMacro = { fg = cp.mauve },

				-- TSLabel = { fg = cp.blue },
				TSMethod = { style = { "italic" } },
				TSNamespace = { fg = cp.rosewater },

				TSPunctDelimiter = { fg = cp.teal },
				TSPunctBracket = { fg = cp.overlay2 },
				-- TSString = { fg = cp.green },
				-- TSStringRegex = { fg = cp.peach },
				-- TSType = { fg = cp.yellow },
				TSVariable = { fg = cp.text },
				TSTagAttribute = { fg = cp.mauve, style = { "italic" } },
				TSTag = { fg = cp.peach },
				TSTagDelimiter = { fg = cp.maroon },
				TSText = { fg = cp.text },

				-- TSURI = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- TSLiteral = { fg = cp.teal, style = { "italic" } },
				-- TSTextReference = { fg = cp.lavender, style = { "bold" } },
				-- TSTitle = { fg = cp.blue, style = { "bold" } },
				-- TSEmphasis = { fg = cp.maroon, style = { "italic" } },
				-- TSStrong = { fg = cp.maroon, style = { "bold" } },
				-- TSStringEscape = { fg = cp.pink },

				bashTSFuncBuiltin = { fg = cp.red, style = { "italic" } },
				bashTSParameter = { fg = cp.yellow, style = { "italic" } },

				luaTSField = { fg = cp.lavender },
				luaTSConstructor = { fg = cp.flamingo },

				javaTSConstant = { fg = cp.teal },

				typescriptTSProperty = { fg = cp.lavender, style = { "italic" } },

				cssTSType = { fg = cp.lavender },
				cssTSProperty = { fg = cp.yellow, style = { "italic" } },

				cppTSProperty = { fg = cp.text },
			},
		},
    })
end


function config.tokyonight()
    -- Example config in Lua
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
end


function config.everblush()
    vim.g.everblushNR = 1
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
            numbers = "ordinal",
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
