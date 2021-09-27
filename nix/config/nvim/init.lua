local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

local function conf(config_name)
  return require(string.format('plugins.%s', config_name))
end

require('packer').startup(
  function(use, use_rocks)
    use { 'wbthomason/packer.nvim' }

    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-sensible' }

    use { 'junegunn/fzf.vim' }
    use {
      'junegunn/fzf',
      run = function() vim.fn['fzf#install']() end
    }

    use { 'LionC/nest.nvim' }

    use { 'sindrets/tokyonight.nvim' }
    use { 'LnL7/vim-nix' }

    use {
      'kyazdani42/nvim-tree.lua',
      config = conf('nvim-tree')
    }

    use {
     'glepnir/galaxyline.nvim',
      branch = 'main',
      config = conf("galaxyline"),
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
  end
)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

require("settings")
require("keymaps")

config = vim.fn.stdpath("config")
vim.cmd("source " .. config .. "/colors.vim")
