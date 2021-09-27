local function conf(config_name)
  return require(string.format('plugins.%s', config_name))
end

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

require('packer').startup(
  function(use, use_rocks)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-sensible'

    -- Git commands in nvim
    use 'tpope/vim-fugitive'

    -- Fugitive-companion to interact with github
    use 'tpope/vim-rhubarb'

    -- 'gc' to comment visual regions/lines
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-surround'

    -- UI to select things (files, grep results, open buffers...)
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = conf('telescope')
    }

    use 'AckslD/nvim-neoclip.lua'

    -- Add git related info in the signs columns and popups
    use 'lewis6991/gitsigns.nvim'
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
      'nvim-treesitter/nvim-treesitter',
      config = conf('nvim-treesitter'),
      branch = 'master',
      run = ':TSUpdate'
    }

    -- LSP
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'neovim/nvim-lspconfig', config = conf('nvim-lspconfig') }

    -- Autocompletion plugin
    use { 'hrsh7th/nvim-cmp',
      config = conf('nvim-cmp'),
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
      }
    }

    use 'L3MON4D3/LuaSnip'

    use { 'kyazdani42/nvim-tree.lua', config = conf('nvim-tree') }
    use 'kyazdani42/nvim-web-devicons'
    use 'liuchengxu/vista.vim'

    -- Clojure specific
    use 'tpope/vim-fireplace'
    use 'tpope/vim-salve'
    use 'clojure-vim/clojure.vim'
    use 'guns/vim-sexp'
    use 'guns/vim-clojure-highlight'
    use 'tpope/vim-sexp-mappings-for-regular-people'

    use 'luochen1990/rainbow'

    use 'NoahTheDuke/coc-clojure'
    use { 'neoclide/coc.nvim', config = conf('coc-nvim') }

    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      config = conf("galaxyline"),
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'vitalk/vim-shebang'
    use { 'norcalli/nvim-colorizer.lua', config = conf('nvim-colorizer') }

    use { 'sheerun/vim-polyglot' }

    use { 'sindrets/diffview.nvim', config = conf('diffview') }
    use { 'folke/lsp-trouble.nvim' }

    use { 'tpope/vim-abolish' }
    use { 'junegunn/fzf.vim' }
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }

    use { 'jgdavey/tslime.vim' }
    use { 'janko-m/vim-test', config = conf('vim-test') }

    -- Ruby & Rails

    use { 'vim-ruby/vim-ruby', config = conf('vim-ruby') }

    use 'thoughtbot/vim-rspec'
    use 'tpope/vim-rails'
    use 'kana/vim-textobj-user'
    use 'nelstrom/vim-textobj-rubyblock'

    -- Colors
    use { 'sindrets/tokyonight.nvim' }
    use { 'phanviet/vim-monokai-pro' }
  end
)

require('plugins/clojure')
require('gitsigns').setup()
require('neoclip').setup()
require('trouble').setup()
