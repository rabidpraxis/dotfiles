require('settings')
require('plugins')

vim.cmd("source " .. vim.fn.stdpath("config") .. "/colors.vim")

vim.api.nvim_exec([[
if filereadable(".exrc")
  source .exrc
endif
]], false)

require('clojure')
