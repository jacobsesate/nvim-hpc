return {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", lazy = false }, 
    {
        'MeanderingProgrammer/treesitter-modules.nvim',
        opts = {
            ensure_installed = { "lua", "latex", "python" },
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
