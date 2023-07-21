local editor = {}

-- https://github.com/rainbowhxch/accelerated-jk.nvim
-- accelerated j/k
editor["rainbowhxch/accelerated-jk.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("editor.accelerated-jk"),
}

-- https://github.com/olimorris/persisted.nvim
-- session management
editor["olimorris/persisted.nvim"] = {
	lazy = true,
	cmd = {
		"SessionToggle",
		"SessionStart",
		"SessionStop",
		"SessionSave",
		"SessionLoad",
		"SessionLoadLast",
		"SessionLoadFromFile",
		"SessionDelete",
	},
	config = require("editor.persisted"),
}

-- https://github.com/m4xshen/autoclose.nvim
-- auto pairs & closes brackets
editor["m4xshen/autoclose.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("editor.autoclose"),
}

-- https://github.com/max397574/better-escape.nvim
-- replace esc with jk
editor["max397574/better-escape.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.better-escape"),
}

-- https://github.com/LunarVim/bigfile.nvim
-- provide support for editing large files
editor["LunarVim/bigfile.nvim"] = {
	lazy = false,
	config = require("editor.bigfile"),
	cond = require("core.settings").load_big_files_faster,
}

-- https://github.com/ojroques/nvim-bufdel
-- close buffer gently with bufferline.nvim
editor["ojroques/nvim-bufdel"] = {
	lazy = true,
	event = "BufReadPost",
}

-- https://github.com/rhysd/clever-f.vim
-- extended f, F, t and T key mappings for Neovim
editor["rhysd/clever-f.vim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("editor.cleverf"),
}

-- https://github.com/numToStr/Comment.nvim
-- better comment
editor["numToStr/Comment.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.comment"),
}

-- https://github.com/sindrets/diffview.nvim
-- git diff view
editor["sindrets/diffview.nvim"] = {
	lazy = true,
	cmd = { "DiffviewOpen", "DiffviewClose" },
}

-- https://github.com/junegunn/vim-easy-align
-- vim easy alignment
editor["junegunn/vim-easy-align"] = {
	lazy = true,
	cmd = "EasyAlign",
}

-- https://github.com/phaazon/hop.nvim
-- better motion jumping
editor["smoka7/hop.nvim"] = {
	lazy = true,
	version = "*",
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.hop"),
}

-- https://github.com/RRethy/vim-illuminate
-- highlight current cursor word
editor["RRethy/vim-illuminate"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("editor.vim-illuminate"),
}

-- https://github.com/romainl/vim-cool
-- auto clear highlight after search
editor["romainl/vim-cool"] = {
	lazy = true,
	event = { "CursorMoved", "InsertEnter" },
}

-- https://github.com/lambdalisue/suda.vim
-- allow one to edit a file with prevledges from an unprivledged session
editor["lambdalisue/suda.vim"] = {
	lazy = true,
	cmd = { "SudaRead", "SudaWrite" },
	config = require("editor.suda"),
}

----------------------------------------------------------------------
--                  :treesitter related plugins                    --
----------------------------------------------------------------------

-- https://github.com/nvim-treesitter/nvim-treesitter
-- super powerful code highlighter
editor["nvim-treesitter/nvim-treesitter"] = {
	lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command("TSUpdate")
		end
	end,
	event = "BufReadPre",
	config = require("editor.treesitter"),
	dependencies = {
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		-- move between textobjects
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
		-- context-based comment
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		-- https://github.com/mfussenegger/nvim-treehopper
		-- Region selection with hints on the AST nodes of a document powered by treesitter
		{ "mfussenegger/nvim-treehopper" },
		-- https://github.com/andymass/vim-matchup
		-- better matchup for %
		{ "andymass/vim-matchup" },
		-- https://gitlab.com/HiPhish/rainbow-delimiters.nvim
		-- rainbow brackets
		{
			"hiphish/rainbow-delimiters.nvim",
			config = require("editor.rainbow_delims"),
		},
		-- https://github.com/nvim-treesitter/nvim-treesitter-context
		-- shows the context of the currently cisible buffer contents
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("editor.ts-context"),
		},
		-- https://github.com/windwp/nvim-ts-autotag
		-- fast vim-closetag
		{
			"windwp/nvim-ts-autotag",
			config = require("editor.autotag"),
		},
		-- https://github.com/norcalli/nvim-colorizer.lua
		-- display detected color
		{
			"NvChad/nvim-colorizer.lua",
			config = require("editor.colorizer"),
		},
		-- https://github.com/abecodes/tabout.nvim
		-- tabout between bracket
		{
			"abecodes/tabout.nvim",
			config = require("editor.tabout"),
		},
	},
}

return editor
