utils = require('core/utils')

return {
  "tpope/vim-sensible",

  -- Color scheme
  {
    "sindrets/tokyonight.nvim",
    -- make sure we load this during startup if it is your main colorscheme
    lazy = false,
    -- make sure to load this before all the other start plugins
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = {}
  },

  -- UI
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Debugging
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Formatting
  "tpope/vim-commentary",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  { "junegunn/fzf.vim" },
  {
    "junegunn/fzf",
    build = function() vim.fn["fzf#install"]() end,
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    opts = {
      enhanced_diff_hl = true
    }
  },

  -- Web
  {
    "mattn/emmet-vim",
    config = function()
      utils.keymap("i", "<C-e>,", "<Plug>(emmet-expand-abbr)")
    end,
  },
  "tpope/vim-ragtag",

  "vitalk/vim-shebang",

  -- Git
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
  },

  { "github/copilot.vim" },

  -- Testing
  {
    "janko-m/vim-test",
    dependencies = {
      "jgdavey/tslime.vim",
    },
    config = function()
      vim.g['test#strategy'] = 'tslime'
    end,
  }
}
