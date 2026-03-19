return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false }, {
  "MeanderingProgrammer/treesitter-modules.nvim",
  opts = {
    ensure_installed = { "rust", "toml", "lua", "haskell", "latex", "python", "markdown", "markdown_inline" },
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-n>',
        node_incremental = '<C-n>',
        node_decremental = '<C-p>'
      }
    }
  }
}
}

