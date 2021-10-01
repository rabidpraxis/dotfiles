return function()
  -- NvimTree
  vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
      'packer',
      'qf',
      'Trouble',
      'LspTrouble',
      'fugitiveblame',
    }
  }

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "",
      unmerged = "",
      renamed = "ﰴ",
      untracked = "",
      deleted = "",
      ignored = ""
    },
    folder = {
      arrow_closed = "",
      arrow_open = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }

  require('nvim-tree').setup()
end
