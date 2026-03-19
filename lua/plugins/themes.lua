return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup { 
                ungerline = false, 
                transparent_mode = true,
            }
            vim.cmd [[set background=dark]]
            vim.cmd [[hi clear LspReferenceText]]
            vim.cmd [[hi link LspReferenceText LspReferenceTarget]]
            vim.cmd [[hi clear LspReferenceRead]]
            vim.cmd [[hi link LspReferenceRead LspReferenceTarget]]
            vim.cmd [[hi clear LspReferenceWrite]]
            vim.cmd [[hi link LspReferenceWrite LspReferenceTarget]]
            vim.cmd [[hi NormalFloat guifg=#ebdbb2 guibg=#3c3836]]
        vim.cmd.colorscheme "gruvbox"
        end
    }, 
    {
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            require('tokyonight').setup {
                transparent = true,
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                },
            }
        end,
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup {
                style = 'deep',
                transparent = true,
            }
        end,
    },
    {
        "ficcdaf/ashen.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('ashen').setup {
                hl = {
                    force_override = {
                        LineNR = { "#C0C0C0" },
                    },
                },
                transparent = true,
            }
        end,
    },
}
