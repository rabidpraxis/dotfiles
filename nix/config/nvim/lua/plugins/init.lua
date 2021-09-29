local function conf(config_name)
  return require(string.format('plugins.%s', config_name))
end

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd('packadd packer.nvim')
end

packer = require('packer')
util = require('packer.util')
compile_path = util.join_paths(vim.fn.stdpath('data'), 'packer_compiled.lua')
packer.init {
  compile_path = compile_path
}
packer.startup(
  function(use, use_rocks)
    use { 'wbthomason/packer.nvim' }
    use { 'tpope/vim-sensible' }

    -- G{ it commands in nvim
    use { 'tpope/vim-fugitive' }

    -- F{ ugitive-companion to interact with github
    use { 'tpope/vim-rhubarb' }

    -- '{ gc' to comment visual regions/lines
    use { 'tpope/vim-commentary' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-eunuch' }
    use { 'tpope/vim-surround' }

    -- U{ I to select things (files, grep results, open buffers...)
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    -- use { 'AckslD/nvim-neoclip.lua',
    --   config = function()
    --     require('neoclip').setup()
    --   end
    -- }

    -- A{ dd git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim', config = function()
      require('gitsigns').setup()
    end}
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
      'nvim-treesitter/nvim-treesitter',
      config = conf('nvim-treesitter'),
      branch = 'master',
      run = ':TSUpdate'
    }

    -- LSP
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'neovim/nvim-lspconfig', config = conf('nvim-lspconfig') }

    -- Autocompletion plugin
    use { 'nvim-lua/completion-nvim' }
    use { 'hrsh7th/nvim-cmp',
      config = conf('nvim-cmp'),
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
      }
    }

    use { 'L3MON4D3/LuaSnip' }

    use { 'kyazdani42/nvim-tree.lua', config = conf('nvim-tree') }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'liuchengxu/vista.vim' }

    -- Clojure specific
    use { 'tpope/vim-fireplace' }
    use { 'tpope/vim-salve' }
    use { 'clojure-vim/clojure.vim' }
    use { 'guns/vim-sexp' }
    use { 'guns/vim-clojure-highlight' }
    use { 'tpope/vim-sexp-mappings-for-regular-people' }

    use { 'luochen1990/rainbow' }

    use { 'NoahTheDuke/coc-clojure' }
    use { 'neoclide/coc.nvim', branch = 'release' }

    use { 'LionC/nest.nvim', config = conf('nest') }

    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      config = conf("galaxyline"),
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use { 'vitalk/vim-shebang' }
    use { 'norcalli/nvim-colorizer.lua', config = conf('nvim-colorizer') }

    use { 'sheerun/vim-polyglot' }

    use { 'sindrets/diffview.nvim', config = conf('diffview') }
    -- use { 'folke/lsp-trouble.nvim', config = function()
    --   require('trouble').setup()
    -- end }

    use { 'tpope/vim-abolish' }
    use { 'junegunn/fzf.vim' }
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }

    use { 'jgdavey/tslime.vim' }
    use { 'janko-m/vim-test', config = conf('vim-test') }

    -- Ruby & Rails

    use { 'vim-ruby/vim-ruby', config = conf('vim-ruby') }

    use { 'thoughtbot/vim-rspec' }
    use { 'tpope/vim-rails' }
    use { 'kana/vim-textobj-user' }
    use { 'nelstrom/vim-textobj-rubyblock' }

    -- Colors
    use { 'sindrets/tokyonight.nvim' }
  end
)

vim.cmd('luafile ' .. compile_path)
