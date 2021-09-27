require('settings')
require('plugins')
require('keymaps')

config = vim.fn.stdpath("config")
vim.cmd("source " .. config .. "/colors.vim")

vim.api.nvim_exec([[
if filereadable(".exrc")
  source .exrc
endif
]], true)
