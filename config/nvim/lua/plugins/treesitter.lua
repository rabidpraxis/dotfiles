return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      ensure_installed = {
        "bash", "cpp", "css", "html", "javascript", "json", "lua",
        "rust", "go", "yaml", "ruby", "clojure", "cmake"
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
      },
      endwise = {
        enable = true,
      },
    },
  },
}
