local completion = {}

-- https://github.com/neovim/nvim-lspconfig
-- Neovim's native LSP configuration
completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lsp"),
	dependencies = {
		-- https://github.com/williamboman/mason.nvim
		-- package manager for LSP, DAP servers, linters and formatters
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		-- using `nvim-lspconfig` with `mason.nvim`
		{ "williamboman/mason-lspconfig.nvim" },
		-- https://github.com/ray-x/lsp_signature.nvim
		-- show signature when completing function parameters
		{
			"ray-x/lsp_signature.nvim",
			config = require("completion.lsp-signature"),
		},
	},
}

-- https://github.com/glepnir/lspsaga.nvim
-- better LSP functions
completion["nvimdev/lspsaga.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("completion.lspsaga"),
	-- https://github.com/kyazdani42/nvim-web-devicons
	-- nerd font icons
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- use Neovim as a language server via Lua
completion["jose-elias-alvarez/null-ls.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("completion.null-ls"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- https://github.com/jay-babu/mason-null-ls.nvim
		-- using `null-ls` with `mason.nvim`
		"jay-babu/mason-null-ls.nvim",
	},
}

-- https://github.com/hrsh7th/nvim-cmp
-- auto completion plugin for Neovim
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		-- https://github.com/L3MON4D3/LuaSnip
		-- snippets completion engine for nvim-cmp
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("completion.luasnip"),
		},
		-- https://github.com/lukas-reineke/cmp-under-comparator
		-- better completion sorting for underline items in nvim-cmp
		{ "lukas-reineke/cmp-under-comparator" },
		-- https://github.com/saadparwaiz1/cmp_luasnip
		-- luasnip source for nvim-cmp
		{ "saadparwaiz1/cmp_luasnip" },
		-- https://github.com/hrsh7th/cmp-nvim-lsp
		-- lsp source for nvim-cmp
		{ "hrsh7th/cmp-nvim-lsp" },
		-- https://github.com/hrsh7th/cmp-nvim-lua
		-- lua source for nvim-cmp
		{ "hrsh7th/cmp-nvim-lua" },
		-- https://github.com/andersevenrud/compe-tmux
		-- tmux source for nvim-cmp
		{ "andersevenrud/cmp-tmux" },
		-- https://github.com/hrsh7th/cmp-path
		-- path source for nvim-cmp
		{ "hrsh7th/cmp-path" },
		-- https://github.com/f3fora/cmp-spell
		-- spell souce for nvim-cmp
		{ "f3fora/cmp-spell" },
		-- https://github.com/hrsh7th/cmp-buffer
		-- buffer source for nvim-cmp
		{ "hrsh7th/cmp-buffer" },
		-- https://github.com/kdheepak/cmp-latex-symbols
		-- latex symbols source for nvim-cmp
		{ "kdheepak/cmp-latex-symbols" },
		-- https://github.com/ray-x/cmp-treesitter
		-- treesitter source for nvim-cmp
		{ "ray-x/cmp-treesitter", commit = "c8e3a74" },
	},
}

return completion
