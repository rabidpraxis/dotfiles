-- require('settings')
-- require('plugins')

-- vim.cmd("source " .. vim.fn.stdpath("config") .. "/colors.vim")

-- require('clojure')
--

require('core/settings')
require('core/keymaps')

require('core/lazy')

require('langs')

vim.api.nvim_exec([[
if filereadable(".exrc")
  source .exrc
endif
]], false)
