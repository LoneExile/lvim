-- Additional Plugins
lvim.plugins = {
	-- theme
	{ "folke/tokyonight.nvim" },
	-- { "lunarvim/synthwave84.nvim" }, { "lunarvim/horizon.nvim" },
	-- { "joshdick/onedark.vim" },
	-- { "cocopon/iceberg.vim" },
	-- { "rebelot/kanagawa.nvim" },
	-- { "EdenEast/nightfox.nvim" },
	-- { "catppuccin/nvim" },
	-- { "projekt0n/github-nvim-theme" },
	-- { "marko-cerovac/material.nvim" },
	-- { "ellisonleao/gruvbox.nvim" },
	-- { "haishanh/night-owl.vim" },

	-- debugger
	{ "rcarriga/nvim-dap-ui" },
	-- { "Pocco81/dap-buddy.nvim" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "leoluz/nvim-dap-go" },
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "mfussenegger/nvim-dap-python" },

	-- LSP
	{ "glepnir/lspsaga.nvim", branch = "main" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		requires = "kyazdani42/nvim-web-devicons",
		-- config = function()
		-- 	require("trouble").setup()
		-- end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- utility
	{ "unblevable/quick-scope" }, -- jumpy but in line
	{ "norcalli/nvim-colorizer.lua" }, --color highlighter
	{ "phaazon/hop.nvim" }, -- EasyMotion
	{ "nacro90/numb.nvim" }, -- Peek lines just when you intend
	-- { "andymass/vim-matchup" }, -- highlight, navigate, and operate on sets of matching text
	{
		"windwp/nvim-spectre",
		-- ~/.local/share/lunarvim/site/pack/packer/start/nvim-spectre/build.sh
		requires = "nvim-lua/plenary.nvim",
	}, -- search and replace
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
	}, -- interactive scratchpad
	{ "luukvbaal/nnn.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	-- { "nvim-telescope/telescope-project.nvim" },
	{ "tpope/vim-repeat" }, -- enable repeating supported plugin maps with "."
	{ "tpope/vim-surround" }, -- Delete/change/add parentheses/quotes,
	-- { "svermeulen/vim-yoink" }, -- maintains a yank history to cycle between
	-- { "svermeulen/vim-subversive" }, -- operator motions to quickly replace text

	{
		"folke/zen-mode.nvim",
	},

	-- copilot
	-- { "github/copilot.vim" },
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		module = "copilot_cmp",
	},
}
