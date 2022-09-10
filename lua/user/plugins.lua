-- Additional Plugins
lvim.plugins = {
  -- theme
  -- { "LunarVim/onedarker.nvim" },
  -- { "folke/tokyonight.nvim" },
  -- { "lunarvim/synthwave84.nvim" },
  -- { "lunarvim/horizon.nvim" },
  -- { "joshdick/onedark.vim" },
  -- { "cocopon/iceberg.vim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "catppuccin/nvim" },
  -- { "projekt0n/github-nvim-theme" },
  -- { "marko-cerovac/material.nvim" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "haishanh/night-owl.vim" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "glepnir/zephyr-nvim" },

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
  },
  { "windwp/nvim-ts-autotag" }, -- auto tag
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }, -- refactor code

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter-context" }, -- sticky header

  -- utility
  { "norcalli/nvim-colorizer.lua" }, --color highlighter
  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  }, -- color picker
  { "nacro90/numb.nvim" }, -- Peek lines just when you intend
  -- { "andymass/vim-matchup" }, -- highlight, navigate, and operate on sets of matching text
  {
    -- "windwp/nvim-spectre",
    "LoneExile/nvim-spectre",
    requires = "nvim-lua/plenary.nvim",
  }, -- search and replace
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  }, -- interactive scratchpad and buggy
  { "michaelb/sniprun", run = "bash ./install.sh" }, -- run code block/line
  -- { "luukvbaal/nnn.nvim" },
  { "lukas-reineke/indent-blankline.nvim" }, -- indent hl
  { "tpope/vim-repeat" }, -- enable repeating supported plugin maps with "."
  -- { "tpope/vim-surround" }, -- Delete/change/add parentheses/quotes,
  -- { "svermeulen/vim-yoink" }, -- maintains a yank history to cycle between
  -- { "svermeulen/vim-subversive" }, -- operator motions to quickly replace text
  { "echasnovski/mini.nvim" }, -- lua code utility (surround, word jumping)
  { "folke/zen-mode.nvim" }, -- Zen mode
  { "ThePrimeagen/harpoon" },
  { "dhruvasagar/vim-open-url" }, -- open url from vim
  { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" },

  -- copilot
  -- { "github/copilot.vim" },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot-cmp").setup()
  --   end,
  -- },

  ---------- old
  { "github/copilot.vim" },
  {
    "zbirenbaum/copilot.lua",
    commit = "ede741d935cf5d962c9a9e44db2400ed1a4aaf13",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    commit = "67825246fa2aa6226ec3320d554640aa4697e1b1",
    module = "copilot_cmp",
  },
}
